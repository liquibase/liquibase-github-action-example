-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_material
(
    days_full_coverage     numeric,
    sap_matl_no            varchar(20),
    item_id                varchar(4),
    gr_processing_days     numeric,
    market_segment         varchar(1),
    gi_processing_time     numeric,
    mrp_controller         varchar(3),
    market_code            varchar(20),
    item_id_desc           varchar(75),
    planned_delivery_days  numeric,
    type_code_desc         varchar(75),
    processed_aid          numeric,
    material_desc          varchar(255),
    purchasing_group       varchar(12),
    purchased_aid          numeric,
    avg_insp_duration_days numeric,
    mrp_controller_desc    varchar(30),
    plant_code             varchar(4),
    mpg_code_desc          varchar(75)
);

