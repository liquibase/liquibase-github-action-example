-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create schema if not exists dream;

create table if not exists dream.freiburg_glims_dispo_checklist_complete_history
(
    insp_lot_no               varchar,
    plant_code                text,
    first_recorded_true_value timestamp
);

