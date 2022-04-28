-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_batches
(
    date_of_mfg         date,
    production_order_no varchar(12),
    batch_number        varchar(20),
    status_desc         varchar(20),
    requirement_date    date,
    sap_matl_no         varchar(18),
    vendor_name         text,
    plant_code          varchar(4),
    vendor_batch_number varchar(60),
    expiration_date     date,
    purchase_order_no   varchar(12),
    stock_out_date      date
);

