-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create schema if not exists _qa;

create or replace function _qa.evaluate_test_limit(limit_sql character varying, is_debug boolean DEFAULT false) returns double precision
    language plpgsql
as
$$
DECLARE ts_offset TIMESTAMP(2) WITH TIME ZONE := CURRENT_TIMESTAMP;-- INTERVAL '19 hours';
		--str_sql varchar := '';
		test_limit float;

BEGIN

	EXECUTE limit_sql INTO test_limit;
	return test_limit;
	
END;
$$;

