-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create or replace function _qa.run_data_metrics_tests(is_debug boolean DEFAULT false)
    returns TABLE(test_name character varying, test_pass_fail boolean)
    language plpgsql
as
$$
DECLARE ts_offset TIMESTAMP(2) WITH TIME ZONE := CURRENT_TIMESTAMP;
		str_sql varchar := '';
		test_row record;
		is_true bool := true;
		min_limit_f float;
		max_limit_f float;
		current_value_f float;

BEGIN

  FOR test_row IN 
  	SELECT mt.metric_id, mt.test_id, mt.test_name, mt.min_limit, mt.max_limit, mt.min_limit_sql, mt.max_limit_sql 
  	FROM _qa.udh_data_metrics_tests mt
  loop
	select	coalesce(test_row.min_limit, _qa.evaluate_test_limit(test_row.min_limit_sql, is_debug)),
			coalesce(test_row.max_limit, _qa.evaluate_test_limit(test_row.max_limit_sql, is_debug))
		into min_limit_f, max_limit_f;
	
	select mh.current_value_float, (mh.current_value_float between min_limit_f and max_limit_f) into current_value_f, is_true 
		FROM _qa.udh_data_metrics_history mh
		WHERE mh.metric_id = test_row.metric_id order by _ts desc limit 1;
	
	str_sql := FORMAT('SELECT CAST(%L AS VARCHAR(250)), CAST(%L AS BOOL) ' 
					  'FROM _qa.udh_data_metrics_tests te WHERE te.metric_id = %s and te.test_id = %s'
					  ,test_row.test_name, is_true, test_row.metric_id, test_row.test_id);
	IF is_debug THEN
	    RAISE NOTICE '%', test_row.test_name;
	    RAISE NOTICE 'min_limit_f: %', min_limit_f;
	    RAISE NOTICE 'max_limit_f: %', max_limit_f;
	    RAISE NOTICE 'current_value_f: %', current_value_f;
	END IF;
	
	RETURN QUERY execute str_sql;
  END LOOP;
	
END;
$$;

