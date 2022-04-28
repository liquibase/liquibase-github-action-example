-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_glims
(
    sample_sampling_point varchar(20),
    test_status           varchar(1),
    batch_number          varchar(20),
    sample_recd_date      date,
    sap_matl_no           varchar(20),
    sample_status         varchar(1),
    insp_lot_no           varchar,
    reported_name         varchar(254),
    sample_sub_type       varchar(5),
    analysis              varchar(20),
    sample_type           varchar(40),
    test_location         varchar(20),
    external              boolean,
    sample_number         numeric,
    sample_date_reviewed  date,
    test_date_reviewed    date,
    plant_code            varchar(4),
    sampled_date          date,
    test_date_completed   date,
    test_number           numeric,
    test_date_started     date
);

