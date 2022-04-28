-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_sql_lims
(
    test_status          varchar(20),
    sample_timestamp     date,
    batch_number         varchar(20),
    sample_condition     varchar(20),
    method               varchar(40),
    sap_matl_no          varchar(20),
    sample_id            numeric,
    sample_status        varchar(20),
    test_condition       varchar(20),
    insp_lot_no          varchar,
    test_expected_date   date,
    sample_received      date,
    sample_online_date   date,
    lot_condition        text,
    date_sample_reviewed date,
    stage_name           text,
    plant_code           varchar(4),
    operation            varchar(40),
    supervisor           varchar(40),
    test_date_completed  date,
    test_id              numeric
);

