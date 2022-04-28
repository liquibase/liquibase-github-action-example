-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_process_orders
(
    production_order_no  text,
    hist_pdo_status_code text,
    sap_matl_no          varchar(20),
    teco_date            date,
    quantity_delivered   numeric,
    first_gi_date        date,
    target_qty           numeric,
    schedule_finish_date date,
    proc_order_status    text,
    release_date         date,
    schedule_start_date  date,
    production_scheduler text,
    teco_flag            boolean,
    plant_code           varchar(4),
    confirmed_start_date date
);

