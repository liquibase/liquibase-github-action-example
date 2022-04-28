-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_planner_material
(
    processed_aid          numeric,
    material_desc          varchar,
    purchased_aid          numeric,
    sap_matl_no            varchar,
    item_id                varchar,
    avg_insp_duration_days numeric,
    plant_code             varchar,
    mpg_code_desc          varchar,
    mrp_controller         varchar
);

