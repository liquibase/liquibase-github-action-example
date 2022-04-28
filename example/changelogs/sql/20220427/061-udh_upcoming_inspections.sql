-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_upcoming_inspections
(
    next_inspection_date date,
    material_desc        varchar(255),
    purchasing_group     varchar(12),
    batch_number         varchar(20),
    sap_matl_no          varchar(18),
    item_id              varchar(4),
    mrp_controller_desc  varchar(30),
    plant_code           varchar(4),
    mrp_controller       varchar(3),
    days_of_supply       numeric
);

