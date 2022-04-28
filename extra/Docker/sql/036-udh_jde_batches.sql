-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_jde_batches
(
    quality_status           text,
    order_key                text,
    batch_number             text,
    sap_batch_status         text,
    matl_no                  text,
    plant_code               text,
    batch_status_change_date date,
    expiration_date          date,
    order_type               text,
    vendor_batch             text
);

