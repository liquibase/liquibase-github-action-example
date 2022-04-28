-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_material_metrics
(
    sap_matl_no    varchar(20),
    plant_code     varchar(4),
    qa_lead_time   numeric,
    dispo_duration numeric,
    sample_flag    varchar(1)
);

