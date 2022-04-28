-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
/*
create materialized view if not exists dream.udh_refresh_check as
SELECT run_data_metrics_tests.test_name
     , run_data_metrics_tests.test_pass_fail
FROM _qa.run_data_metrics_tests(false) run_data_metrics_tests(test_name, test_pass_fail)
WHERE run_data_metrics_tests.test_pass_fail <> true
   OR run_data_metrics_tests.test_pass_fail IS NULL;

*/