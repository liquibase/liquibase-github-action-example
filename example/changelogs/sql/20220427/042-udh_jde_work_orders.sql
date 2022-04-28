-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_jde_work_orders
(
    sap_order_status            text,
    batch_number                text,
    scheduled_start_date        date,
    planned_release_date        date,
    scheduled_finish_datetime   date,
    order_status_key            varchar,
    actual_gr_quantity          numeric,
    inventory_completion_status text,
    matl_no                     text,
    plant_code                  text,
    actual_confirmed_date       date,
    process_order               text,
    process_order_status1       text
);

