-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_jde_movements
(
    lot_status_desc        text,
    transaction_date       date,
    document_number        numeric,
    batch_number           text,
    incremental_identifier numeric,
    transaction_quantity   numeric,
    matl_no                text,
    document_type_key      text,
    plant_code             text,
    document_type_desc     text,
    lot_status_key         text
);

