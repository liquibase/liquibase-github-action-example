-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_jde_batches_sap_inspection_lots
(
    status_description text,
    batch_number       text,
    sap_matl_no        text,
    insp_lot_no        text,
    insp_end_date      date,
    ud_last_date       date,
    ud_first_date      date,
    insp_lot_qty       numeric,
    actual_lot         numeric,
    insp_type          text,
    plant_code         text,
    insp_start_date    date,
    ud_code            text
);

