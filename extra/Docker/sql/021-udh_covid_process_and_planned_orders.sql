-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_covid_process_and_planned_orders
(
    batch_number                   text,
    sap_matl_no                    text,
    planned_order                  text,
    scheduled_start_date           date,
    target_qty_6_dose_vials        numeric,
    target_qty_jde                 numeric,
    target_qty_eaches              numeric,
    planned_order_qty_eaches       numeric,
    site                           text,
    planned_order_qty_6_dose_vials numeric,
    jde_matl_no                    text,
    availability_date              date,
    scheduled_finish_date          date,
    process_order                  text
);

