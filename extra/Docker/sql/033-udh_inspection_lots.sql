-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_inspection_lots
(
    status_description     varchar(100),
    insp_type_description  varchar,
    production_order_no    varchar,
    batch_number           varchar(20),
    sap_matl_no            varchar(20),
    insp_lot_no            varchar(40),
    insp_end_date          date,
    ud_last_date           date,
    purchase_order_line_no varchar,
    ud_first_date          date,
    insp_lot_qty           numeric,
    actual_lot             numeric,
    insp_type              varchar(8),
    plant_code             varchar(4),
    insp_start_date        date,
    ud_code                varchar(16),
    test_date              date,
    purchase_order_no      varchar
);

