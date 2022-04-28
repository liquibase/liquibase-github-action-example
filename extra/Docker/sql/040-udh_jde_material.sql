-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_jde_material
(
    planner_key                 text,
    gl_category_desc            text,
    sap_matl_no                 text,
    planner_desc                text,
    mpg_desc                    text,
    grpt_cal_days               numeric,
    master_planning_family_desc text,
    material_type               text,
    material_desc               text,
    matl_no                     text,
    commodity_class_desc        text,
    sap_item_id                 text,
    lims_material               boolean,
    plant_code                  text,
    days_of_supply              numeric,
    planned_delivery            numeric,
    gl_category_key             text,
    master_planning_family_key  text
);

