-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_labware
(
    sample_reviewed_date   date,
    test_started           date,
    sample_released_on     date,
    test_status            varchar(1),
    batch_number           varchar(20),
    sap_matl_no            varchar(20),
    sample_status          varchar(1),
    insp_lot_no            varchar,
    reported_name          varchar(20),
    test_reviewed          date,
    w_date1                date,
    analysis               varchar(15),
    sample_type            varchar(40),
    test_location          varchar(20),
    external               boolean,
    sample_received        date,
    sample_number          numeric,
    unreleased_andover_lot boolean,
    sample_date            date,
    plant_code             varchar(4),
    sampling_point         varchar(20),
    w_sample_sub_type      varchar(3),
    test_number            numeric,
    test_completed         date
);

