-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists public.insp_update_history
(
    material_code_sap    varchar(20),
    orig_insp_end_date   date,
    insp_lot_no          varchar(40),
    checking_for_update  boolean                  default true,
    created_at           timestamp with time zone default CURRENT_TIMESTAMP,
    ud_first_date        date,
    old_insp_end_date    date,
    new_insp_end_date    date,
    file_generated_at    timestamp with time zone,
    updated_at           timestamp with time zone default CURRENT_TIMESTAMP,
    lot_cancelled        boolean                  default false,
    committed_at         timestamp with time zone,
    committed_by         integer,
    plant_code           varchar(6),
    insp_start_date      date,
    id                   serial,
    update_successful    boolean                  default false,
    material_description varchar(255)
);

