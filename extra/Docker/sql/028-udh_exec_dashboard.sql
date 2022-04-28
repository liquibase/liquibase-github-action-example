-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_exec_dashboard
(
    hist_pdo_status_code text,
    batch_number         text,
    vial_planned_outputs numeric,
    sap_matl_no          varchar(20),
    item_id              text,
    delivered_on         date,
    two_weeks_out        timestamp,
    grouping             text,
    target_qty           numeric,
    material_desc        text,
    actual_gr_quantity   numeric,
    time_indicator       text,
    planned_order_start  date,
    teco_flag            boolean,
    actual_start         date,
    base_unit_of_measure text,
    plant_code           varchar(4),
    one_month_out        timestamp,
    two_weeks_back       timestamp,
    vial_actual_outputs  numeric,
    process_order        text,
    planned_order_finish date
);

