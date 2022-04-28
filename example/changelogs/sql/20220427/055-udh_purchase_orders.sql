-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_purchase_orders
(
    goods_receipt_date         date,
    sche_line_planned_del_date date,
    target_del_qty             numeric,
    sap_matl_no                varchar(20),
    expected_delivery_date     date,
    po_creation_date           date,
    vendor_name                text,
    actual_gr_qty              numeric,
    statistical_delivery_date  date,
    po_line_number             numeric,
    sch_line_number            text,
    plant_code                 varchar(4),
    receipt_complete_flg       varchar(1),
    purchase_order_no          varchar(12)
);

