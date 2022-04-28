-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create or replace function _qa.store_data_metrics_current_values(is_debug boolean DEFAULT false)
    returns TABLE(metric_id integer, current_value_float double precision, _ts timestamp with time zone)
    language plpgsql
as
$$
DECLARE ts_offset TIMESTAMP(2) WITH TIME ZONE := CURRENT_TIMESTAMP;
		str_sql varchar := '';
		test_row record;
		current_value_f float;

BEGIN

  FOR test_row IN 
  	SELECT ml.metric_id, ml.calculation_sql
  	FROM _qa.udh_data_metrics_lookup ml WHERE ml.calculation_sql IS NOT NULL
  loop
	  EXECUTE test_row.calculation_sql INTO current_value_f;
	
	str_sql := FORMAT('INSERT INTO _qa.udh_data_metrics_history (metric_id, current_value_float, _ts) '
					  'VALUES (%L, %L, %L) '
					  'RETURNING metric_id, current_value_float, _ts'
					  ,test_row.metric_id, current_value_f, ts_offset);
	IF is_debug THEN
	    RAISE NOTICE '%', test_row.calculation_sql;
	    RAISE NOTICE '%', str_sql;
	    RAISE NOTICE 'current_value_f: %', current_value_f;
	END IF;

	RETURN QUERY execute str_sql;	
  END LOOP;
	
END;
$$;

