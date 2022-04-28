-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists _qa.fact_durations
(
    plant_code        text,
    batch_number      text,
    insp_lot_no       numeric,
    prediction_type   text,
    prediction        integer,
    duration          integer,
    ongoing           integer,
    material_id       text,
    material_code_sap text,
    vendor_name       text
);

