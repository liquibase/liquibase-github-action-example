-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_puurs_water_testing
(
    test_status          varchar(20),
    sample_condition     varchar(20),
    method               varchar(40),
    sample_id            numeric,
    sample_status        varchar(20),
    test_condition       varchar(20),
    test_expected_date   date,
    lot_number           text,
    instance_id          text,
    sample_received      date,
    date_sample_reviewed date,
    stage_name           text,
    operation            varchar(40),
    supervisor           varchar(40),
    test_date_completed  date,
    test_id              numeric
);

