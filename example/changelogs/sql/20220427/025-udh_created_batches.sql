-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_created_batches
(
    mfg_scheduled_start    date,
    batch_number           text,
    sap_matl_no            text,
    gr_processing_days     numeric,
    market_segment         text,
    target_qty             numeric,
    stock_out_date         date,
    mfg_scheduled_finish   date,
    processed_aid          numeric,
    material_desc          text,
    proc_order_status      text,
    purchased_aid          numeric,
    requirement_date       date,
    mrp_controller_desc    text,
    plant_code             text,
    mpg_code_desc          text,
    status_desc            text,
    item_id                text,
    gi_processing_time     numeric,
    mrp_controller         text,
    market_code            text,
    item_id_desc           text,
    avg_insp_duration_days numeric,
    production_scheduler   text,
    teco_flag              boolean,
    process_order          text
);

