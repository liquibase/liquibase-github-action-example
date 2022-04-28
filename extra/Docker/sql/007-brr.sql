-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create type public.progress as enum ('not_started', 'incomplete', 'completed');

create type public.risk_status as enum ('late', 'at_risk', 'on_time');

create table batches
(
    id                                             uuid,
    purchase_order_id                              text,
    batch_number                                   varchar(20),
    record_type                                    text,
    material_code_sap                              varchar(20),
    name                                           varchar(255),
    material_id                                    varchar(4),
    material_id_desc                               text,
    mpg_code_desc                                  varchar(75),
    mrp_controller                                 text,
    mrp_controller_desc                            text,
    unreleased_inputs_flag                         text,
    goods_receipt_proc_time                        numeric,
    days_of_supply                                 numeric,
    statistical_delivery_date                      date,
    source_planned_start                           date,
    source_actual_start                            date,
    source_planned_finish                          date,
    source_actual_finish                           date,
    mfg_planned_start                              date,
    mfg_actual_start                               date,
    mfg_planned_finish                             date,
    mfg_actual_finish                              date,
    mfg_brr_planned_start                          date,
    mfg_brr_actual_start                           date,
    mfg_brr_planned_finish                         date,
    mfg_brr_actual_finish                          date,
    qa_brr_planned_start                           date,
    qa_brr_actual_start                            date,
    qa_brr_planned_finish                          date,
    qa_brr_actual_finish                           date,
    sample_planned_start                           date,
    sample_actual_start                            date,
    sample_planned_finish                          date,
    sample_actual_finish                           date,
    test_planned_start                             date,
    test_actual_start                              date,
    test_planned_finish                            date,
    test_actual_finish                             date,
    dispo_planned_start                            date,
    dispo_actual_start                             date,
    dispo_planned_finish                           date,
    dispo_actual_finish                            date,
    ship_planned_start                             date,
    ship_actual_start                              date,
    ship_planned_finish                            date,
    ship_actual_finish                             date,
    due_date                                       date,
    revised_due_date                               date,
    need_by                                        date,
    qty_shipped                                    numeric,
    qty_issued                                     numeric,
    created_at                                     timestamp with time zone,
    updated_at                                     timestamp with time zone,
    deleted_at                                     timestamp with time zone,
    priority                                       integer,
    source_estimated_start                         date,
    source_estimated_finish                        date,
    mfg_estimated_start                            date,
    mfg_estimated_finish                           date,
    mfg_brr_estimated_start                        date,
    mfg_brr_estimated_finish                       date,
    qa_brr_estimated_start                         date,
    qa_brr_estimated_finish                        date,
    sample_estimated_start                         date,
    sample_estimated_finish                        date,
    test_estimated_start                           date,
    test_estimated_finish                          date,
    dispo_estimated_start                          date,
    dispo_estimated_finish                         date,
    ship_estimated_start                           date,
    ship_estimated_finish                          date,
    orig_dispo_planned_start                       date,
    dispo_start_estimate_offset                    integer,
    comments_count                                 integer,
    plant_code                                     varchar(6),
    insp_lot_no                                    varchar(40),
    insp_type                                      text,
    average_inspection_duration                    numeric,
    batch_status                                   text,
    old_id                                         text,
    custom_flag                                    text,
    market_segment                                 text,
    inputs_planned_start                           date,
    inputs_planned_finish                          date,
    inputs_estimated_start                         date,
    inputs_estimated_finish                        date,
    inputs_actual_start                            date,
    inputs_actual_finish                           date,
    detailed_test_status_flag                      text,
    ud_code                                        varchar(16),
    date_order_released                            date,
    requirement_date                               date,
    out_of_stock                                   date,
    queued_for_sap_export                          boolean,
    insp_start_date                                date,
    purchase_order_line_no                         integer,
    vendor_batch_number                            text,
    process_order_number                           text,
    purchasing_group                               text,
    market_code                                    text,
    material_category                              text,
    active_due_date                                date,
    tests_percent_approved                         integer,
    test_risk_status                               risk_status,
    expiration_date                                date,
    ud_code_description                            text,
    market_segment_description                     text,
    insp_type_description                          text,
    lot_hold_flag                                  text,
    lot_hold_details                               text,
    dispo_notes_1                                  text,
    dispo_notes_2                                  text,
    dispo_notes_3                                  text,
    full_mrp_controller                            text,
    full_market_segment                            text,
    full_insp_type                                 text,
    queueable_for_sap_export                       boolean,
    risk_status_due_date                           risk_status,
    risk_status_revised_due_date                   risk_status,
    dispo_active_finish_revised_due_date_diff_days integer,
    ready_for_release                              boolean,
    batch_number_or_purchase_order_id              text,
    is_purchase_order                              boolean,
    full_ud_code                                   text,
    earliest_date                                  date,
    latest_date                                    date,
    longest_tag_length                             integer,
    source_risk_status                             risk_status,
    sample_risk_status                             risk_status,
    mfg_risk_status                                risk_status,
    mfg_brr_risk_status                            risk_status,
    qa_brr_risk_status                             risk_status,
    dispo_risk_status                              risk_status,
    inputs_risk_status                             risk_status,
    ship_risk_status                               risk_status,
    source_progress                                progress,
    sample_progress                                progress,
    test_progress                                  progress,
    mfg_progress                                   progress,
    mfg_brr_progress                               progress,
    qa_brr_progress                                progress,
    dispo_progress                                 progress,
    inputs_progress                                progress,
    ship_progress                                  progress,
    auto_move_dispo_and_queue                      boolean,
    inventory_status                               text,
    lot_cancelled                                  boolean,
    queued_for_sap_export_by_user_id               integer,
    queued_for_sap_export_at                       timestamp with time zone,
    production_scheduler                           text,
    external_test_planned_start                    date,
    external_test_planned_finish                   date,
    external_test_actual_start                     date,
    external_test_actual_finish                    date,
    external_sample_planned_start                  date,
    external_sample_planned_finish                 date,
    external_sample_actual_start                   date,
    external_sample_actual_finish                  date,
    external_sample_progress                       progress,
    external_sample_risk_status                    risk_status,
    external_test_progress                         progress,
    external_test_risk_status                      risk_status,
    external_sample_estimated_start                date,
    external_sample_estimated_finish               date,
    external_test_estimated_start                  date,
    external_test_estimated_finish                 date,
    auto_queue_if_applicable                       boolean,
    disable_auto_updates                           boolean,
    quantity_delivered                             numeric,
    proc_order_status                              text,
    full_material_code_sap                         text,
    vendor_name                                    text,
    need_by_updated_by_user_id                     integer,
    need_by_updated_at                             date,
    target_quantity                                numeric,
    sample_machine_estimated_finish                date,
    test_machine_estimated_finish                  date,
    mfg_brr_machine_estimated_finish               date,
    qa_brr_machine_estimated_finish                date,
    dispo_machine_estimated_finish                 date,
    date_of_mfg                                    date,
    priority_manufacturing_at_risk                 date
);

alter table batches
    owner to postgres;

/*
create materialized view if not exists dream.brr as
WITH puurs_brr_delivery AS (
    SELECT s.plant_code
         , s.insp_lot_no
         , min(s.sample_online_date) AS br_delivery_date
    FROM dream.udh_sql_lims s
    WHERE s.plant_code::text = 'BE37'::text
      AND (s.stage_name = ANY (ARRAY ['QA'::text, 'PBR-QO'::text]))
    GROUP BY s.plant_code, s.insp_lot_no
)
   , puurs_gr_brr AS (
    SELECT s.plant_code
         , s.insp_lot_no
         , min(s.sample_online_date)   AS br_delivery_date
         , max(s.date_sample_reviewed) AS gr_brr_actual_finish
    FROM dream.udh_sql_lims s
    WHERE s.plant_code::text = 'BE37'::text
      AND s.stage_name = 'WHS'::text
    GROUP BY s.plant_code, s.insp_lot_no
)
   , tuas_mfg_brr_finish AS (
    SELECT b_1.plant_code
         , b_1.batch_number
         , max(b_1.mfg_brr_actual_finish) AS mfg_brr_actual_finish
    FROM batches b_1
    WHERE b_1.plant_code::text = 'SG02'::text
      AND b_1.deleted_at IS NULL
      AND b_1.mfg_brr_actual_finish IS NOT NULL
    GROUP BY b_1.plant_code, b_1.batch_number
)
   , incomplete_ascoli_brr AS (
    SELECT DISTINCT s.insp_lot_no
    FROM dream.udh_sql_lims s
    WHERE s.plant_code::text = 'IT10'::text
      AND s.supervisor::text = 'IPDOC'::text
      AND s.test_date_completed IS NULL
      AND (s.operation::text ~~ '%REVIEW%'::text AND s.sap_matl_no::text ~~ 'F%'::text OR
           NOT s.sap_matl_no::text ~~ 'F%'::text)
)
   , ascoli_puurs_qa_brr_finish AS (
    SELECT s.plant_code
         , s.insp_lot_no
         , max(s.test_date_completed) AS qa_brr_actual_finish
    FROM dream.udh_sql_lims s
    WHERE s.plant_code::text = 'IT10'::text
      AND s.supervisor::text = 'IPDOC'::text
      AND (s.operation::text ~~ '%REVIEW%'::text AND s.sap_matl_no::text ~~ 'F%'::text OR
           NOT s.sap_matl_no::text ~~ 'F%'::text)
      AND NOT (s.insp_lot_no::text IN (SELECT incomplete_ascoli_brr.insp_lot_no
                                       FROM incomplete_ascoli_brr))
    GROUP BY s.plant_code, s.insp_lot_no
    UNION ALL
    SELECT s.plant_code
         , s.insp_lot_no
         , max(s.date_sample_reviewed) AS qa_brr_actual_finish
    FROM dream.udh_sql_lims s
    WHERE s.plant_code::text = 'BE37'::text
      AND (s.stage_name = ANY (ARRAY ['QA'::text, 'PBR-QO'::text]))
    GROUP BY s.plant_code, s.insp_lot_no
    UNION ALL
    SELECT s.plant_code
         , s.insp_lot_no
         , max(s.date_sample_reviewed) AS qa_brr_actual_finish
    FROM dream.udh_sql_lims s
    WHERE s.plant_code::text = 'US06'::text
      AND ((s.supervisor::text = ANY
            (ARRAY ['BRR API'::character varying, 'BRR DP FG'::character varying, 'BRR DP MFG'::character varying]::text[])) OR
           s.operation::text ~~ '%BATCH REC REV%'::text)
      AND NOT (s.insp_lot_no::text IN (SELECT DISTINCT s_1.insp_lot_no
                                       FROM dream.udh_sql_lims s_1
                                       WHERE ((s_1.supervisor::text = ANY
                                               (ARRAY ['BRR API'::character varying, 'BRR DP FG'::character varying, 'BRR DP MFG'::character varying]::text[])) OR
                                              s_1.operation::text ~~ '%BATCH REC REV%'::text)
                                         AND s_1.date_sample_reviewed IS NULL))
    GROUP BY s.plant_code, s.insp_lot_no
)
   , lrt_sql_lims_crossover AS (
    SELECT DISTINCT lrt_1.lrt_login
                  , lrt_1.batch_number
                  , lrt_1.sap_matl_no
                  , lrt_1.tic_review
                  , lrt_1.plant_code
    FROM dream.pgsdw_lrt lrt_1
             JOIN dream.udh_sql_lims s
                  ON lrt_1.plant_code::text = s.plant_code::text AND lrt_1.sap_matl_no::text = s.sap_matl_no::text AND
                     lrt_1.batch_number::text = s.batch_number::text
    WHERE (s.supervisor::text = ANY
           (ARRAY ['BRR API'::character varying, 'BRR DP FG'::character varying, 'BRR DP MFG'::character varying]::text[]))
       OR s.operation::text ~~ '%BATCH REC REV%'::text
)
   , lrt_only_batches AS (
    SELECT pgsdw_lrt.lrt_login
         , pgsdw_lrt.batch_number
         , pgsdw_lrt.sap_matl_no
         , pgsdw_lrt.tic_review
         , pgsdw_lrt.plant_code
    FROM dream.pgsdw_lrt
    WHERE NOT (pgsdw_lrt.sap_matl_no::text || pgsdw_lrt.batch_number::text IN
               (SELECT lrt_sql_lims_crossover.sap_matl_no::text || lrt_sql_lims_crossover.batch_number::text
                FROM lrt_sql_lims_crossover))
)
   , informa_batches AS (
    SELECT 'AN32'::text                                AS plant_code
         , informa_andover_brr.batch_number
         , min(informa_andover_brr.mfg_review_date)    AS mfg_review_date
         , max(informa_andover_brr.receipt_date)       AS mfg_brr_actual_finish
         , min(informa_andover_brr.receipt_date)       AS qa_brr_actual_start
         , max(informa_andover_brr.qa_review_end_date) AS qa_brr_actual_finish
    FROM dream.informa_andover_brr
    GROUP BY informa_andover_brr.batch_number
)
   , freiburg_qa_brr_finish AS (
    SELECT s.plant_code
         , s.insp_lot_no
         , max(s.date_sample_reviewed) AS qa_brr_actual_finish
    FROM dream.udh_sql_lims s
    WHERE s.plant_code::text = 'DE22'::text
      AND s.operation::text = 'BATCH RECORD REVIEW'::text
    GROUP BY s.plant_code, s.insp_lot_no
    UNION ALL
    SELECT g.plant_code
         , g.insp_lot_no
         , max(g.sample_date_reviewed) AS qa_brr_actual_finish
    FROM dream.udh_glims g
    WHERE g.plant_code::text = 'DE22'::text
      AND g.reported_name::text = 'Batch record review'::text
      AND NOT (g.sap_matl_no::text = ANY
               (ARRAY ['F000055943'::character varying, 'F000054658'::character varying, 'F000054453'::character varying, 'F000054454'::character varying, 'F000054455'::character varying, 'F000055205'::character varying, 'F000054989'::character varying]::text[]))
    GROUP BY g.plant_code, g.insp_lot_no
    UNION ALL
    SELECT f.plant_code
         , f.insp_lot_no
         , (f.first_recorded_true_value - '06:00:00'::interval)::date AS date
    FROM dream.freiburg_glims_dispo_checklist_complete_history f
             JOIN dream.udh_inspection_lots il_1 ON il_1.insp_lot_no::text = f.insp_lot_no::text
    WHERE (il_1.sap_matl_no::text = ANY
           (ARRAY ['F000055943'::character varying, 'F000054658'::character varying, 'F000054453'::character varying, 'F000054454'::character varying, 'F000054455'::character varying, 'F000055205'::character varying, 'F000054989'::character varying]::text[]))
      AND NOT (f.insp_lot_no::text = ANY
               (ARRAY ['30002064770'::character varying, '30002064356'::character varying, '30002063797'::character varying, '30002062942'::character varying, '30002063463'::character varying, '30002063096'::character varying, '30002063071'::character varying, '30002062179'::character varying]::text[]))
)
   , freiburg_p2c2_end_of_packaging AS (
    SELECT p_1.charge
         , p_1.order_number
         , max(p_1.endtime) AS finish
    FROM dream.freiburg_p2c2 p_1
    WHERE p_1.vts_name = 'Produktionsende'::text
    GROUP BY p_1.charge, p_1.order_number
)
   , freiburg_p2c2_manager_review AS (
    SELECT p_1.charge
         , p_1.order_number
         , max(p_1.endtime) AS finish
    FROM dream.freiburg_p2c2 p_1
    WHERE p_1.vts_name = 'Review Leiter Herstellung'::text
    GROUP BY p_1.charge, p_1.order_number
)
SELECT DISTINCT il.plant_code
              , il.insp_lot_no
              , CASE
                    WHEN (il.plant_code::text = ANY
                          (ARRAY ['IT10'::character varying, 'IN01'::character varying]::text[])) AND
                         gr.last_nonzero_gr IS NOT NULL AND il.production_order_no IS NOT NULL
                        THEN gr.last_nonzero_gr::timestamp without time zone
                    WHEN (il.plant_code::text = ANY
                          (ARRAY ['IE14'::character varying, 'US06'::character varying, 'SG02'::character varying]::text[])) AND
                         il.production_order_no IS NOT NULL THEN gr.custom_last_gr::timestamp without time zone
                    WHEN il.plant_code::text = 'BE37'::text AND il.production_order_no IS NOT NULL AND
                         p.hist_pdo_status_code ~~ '% CNF %'::text THEN gr.custom_last_gr::timestamp without time zone
                    WHEN il.plant_code::text = 'BE37'::text THEN pgr.br_delivery_date::timestamp without time zone
                    WHEN il.plant_code::text = 'AN32'::text THEN COALESCE(gr.custom_last_gr, ib.mfg_review_date,
                                                                          ib.mfg_brr_actual_finish)::timestamp without time zone
                    WHEN il.plant_code::text = 'DE22'::text AND p.production_order_no IS NOT NULL AND
                         (m.item_id::text = 'FERT'::text OR m.sap_matl_no::text = 'H000025722'::text) THEN pp.finish
                    WHEN il.plant_code::text = 'DE22'::text AND p.production_order_no IS NOT NULL AND
                         m.item_id::text = 'HALB'::text AND NOT m.sap_matl_no::text = 'H000025722'::text
                        THEN gr.custom_last_gr::timestamp without time zone
                    ELSE NULL::date::timestamp without time zone
    END AS mfg_brr_actual_start
              , CASE
                    WHEN (il.plant_code::text = ANY
                          (ARRAY ['IT10'::character varying, 'IN01'::character varying]::text[])) AND
                         gr.last_zero_gr IS NOT NULL AND il.production_order_no IS NOT NULL
                        THEN gr.last_zero_gr::timestamp without time zone
                    WHEN il.plant_code::text = 'US06'::text AND gr.custom_last_gr IS NOT NULL AND
                         il.production_order_no IS NOT NULL AND
                         NOT (COALESCE(m.mrp_controller, ''::character varying)::text = ANY
                              (ARRAY ['K30'::character varying, 'K31'::character varying, 'K40'::character varying, 'K41'::character varying, 'K60'::character varying]::text[])) AND
                         NOT (COALESCE(m.mrp_controller, ''::character varying)::text = 'K50'::text AND
                              m.item_id::text = 'HALB'::text) THEN lrt.lrt_login::timestamp without time zone
                    WHEN il.plant_code::text = 'BE37'::text AND il.production_order_no IS NOT NULL
                        THEN p.teco_date::timestamp without time zone
                    WHEN il.plant_code::text = 'BE37'::text THEN pgr.gr_brr_actual_finish::timestamp without time zone
                    WHEN il.plant_code::text = 'AN32'::text THEN ib.mfg_brr_actual_finish::timestamp without time zone
                    WHEN il.plant_code::text = 'DE22'::text AND p.production_order_no IS NOT NULL AND
                         (m.item_id::text = 'FERT'::text OR m.sap_matl_no::text = 'H000025722'::text) THEN pm.finish
                    WHEN il.plant_code::text = 'DE22'::text AND m.item_id::text = 'HALB'::text AND
                         NOT m.sap_matl_no::text = 'H000025722'::text THEN te.receipt_of_production_documents
                    ELSE NULL::date::timestamp without time zone
    END AS mfg_brr_actual_finish
              , CASE
                    WHEN (il.plant_code::text = ANY
                          (ARRAY ['IT10'::character varying, 'IN01'::character varying]::text[])) AND
                         gr.last_zero_gr IS NOT NULL AND il.production_order_no IS NOT NULL
                        THEN gr.last_zero_gr::timestamp without time zone
                    WHEN il.plant_code::text = 'US06'::text AND gr.custom_last_gr IS NOT NULL AND
                         il.production_order_no IS NOT NULL THEN lrt.lrt_login::timestamp without time zone
                    WHEN il.plant_code::text = 'BE37'::text THEN pbd.br_delivery_date::timestamp without time zone
                    WHEN il.plant_code::text = 'AN32'::text THEN ib.qa_brr_actual_start::timestamp without time zone
                    WHEN il.plant_code::text = 'SG02'::text THEN t.mfg_brr_actual_finish::timestamp without time zone
                    WHEN il.plant_code::text = 'DE22'::text AND p.production_order_no IS NOT NULL AND
                         (m.item_id::text = 'FERT'::text OR m.sap_matl_no::text = 'H000025722'::text) THEN pm.finish
                    WHEN il.plant_code::text = 'DE22'::text AND m.item_id::text = 'HALB'::text AND
                         NOT m.sap_matl_no::text = 'H000025722'::text THEN te.receipt_of_production_documents
                    ELSE NULL::date::timestamp without time zone
    END AS qa_brr_actual_start
              , CASE
                    WHEN il.plant_code::text = 'IT10'::text AND gr.last_zero_gr IS NOT NULL AND
                         il.production_order_no IS NOT NULL OR il.plant_code::text = 'BE37'::text
                        THEN ab.qa_brr_actual_finish
                    WHEN il.plant_code::text = 'US06'::text AND gr.custom_last_gr IS NOT NULL AND
                         il.production_order_no IS NOT NULL THEN COALESCE(ab.qa_brr_actual_finish, lrto.tic_review)
                    WHEN il.plant_code::text = 'AN32'::text THEN ib.qa_brr_actual_finish
                    WHEN il.plant_code::text = 'DE22'::text AND (m.item_id::text = ANY
                                                                 (ARRAY ['HALB'::character varying, 'FERT'::character varying]::text[])) AND
                         il.production_order_no IS NOT NULL THEN fb.qa_brr_actual_finish
                    ELSE NULL::date
    END AS qa_brr_actual_finish
              , CASE
                    WHEN (il.plant_code::text = ANY
                          (ARRAY ['IT10'::character varying, 'IN01'::character varying]::text[])) AND
                         gr.last_nonzero_gr IS NOT NULL AND il.production_order_no IS NOT NULL THEN false
                    WHEN (il.plant_code::text = ANY
                          (ARRAY ['US06'::character varying, 'IE14'::character varying, 'BE37'::character varying, 'AN32'::character varying, 'SG02'::character varying]::text[])) AND
                         gr.custom_last_gr IS NOT NULL THEN false
                    WHEN il.plant_code::text = 'DE22'::text AND
                         (m.item_id::text = ANY (ARRAY ['HALB'::character varying, 'FERT'::character varying]::text[]))
                        THEN false
                    ELSE true
    END AS mfg_brr_actual_start_write_once
              , CASE
                    WHEN (il.plant_code::text = ANY
                          (ARRAY ['IT10'::character varying, 'IN01'::character varying]::text[])) AND
                         gr.last_nonzero_gr IS NOT NULL AND il.production_order_no IS NOT NULL THEN false
                    WHEN il.plant_code::text = 'US06'::text AND gr.custom_last_gr IS NOT NULL AND
                         il.production_order_no IS NOT NULL AND
                         NOT (COALESCE(m.mrp_controller, ''::character varying)::text = ANY
                              (ARRAY ['K30'::character varying, 'K31'::character varying, 'K40'::character varying, 'K41'::character varying, 'K60'::character varying]::text[])) AND
                         NOT (COALESCE(m.mrp_controller, ''::character varying)::text = 'K50'::text AND
                              m.item_id::text = 'HALB'::text) THEN false
                    WHEN il.plant_code::text = ANY
                         (ARRAY ['BE37'::character varying, 'AN32'::character varying]::text[]) THEN false
                    WHEN il.plant_code::text = 'DE22'::text AND
                         (m.item_id::text = ANY (ARRAY ['HALB'::character varying, 'FERT'::character varying]::text[]))
                        THEN false
                    ELSE true
    END AS mfg_brr_actual_finish_write_once
              , CASE
                    WHEN (il.plant_code::text = ANY
                          (ARRAY ['IT10'::character varying, 'IN01'::character varying, 'SG02'::character varying]::text[])) AND
                         gr.last_nonzero_gr IS NOT NULL AND il.production_order_no IS NOT NULL THEN false
                    WHEN il.plant_code::text = 'US06'::text AND gr.custom_last_gr IS NOT NULL AND
                         il.production_order_no IS NOT NULL AND
                         NOT (COALESCE(m.mpg_code_desc, ''::character varying)::text = 'Comirnaty'::text AND
                              COALESCE(m.item_id, ''::character varying)::text = 'FERT'::text) THEN false
                    WHEN il.plant_code::text = ANY
                         (ARRAY ['BE37'::character varying, 'AN32'::character varying]::text[]) THEN false
                    WHEN il.plant_code::text = 'DE22'::text AND
                         (m.item_id::text = ANY (ARRAY ['HALB'::character varying, 'FERT'::character varying]::text[]))
                        THEN false
                    ELSE true
    END AS qa_brr_actual_start_write_once
              , CASE
                    WHEN COALESCE(ab.qa_brr_actual_finish, lrt.tic_review, ib.qa_brr_actual_finish,
                                  fb.qa_brr_actual_finish) IS NOT NULL THEN false
                    ELSE true
    END AS qa_brr_actual_finish_write_once
FROM dream.udh_inspection_lots il
         JOIN dream.udh_material m ON il.plant_code::text = m.plant_code::text AND il.sap_matl_no::text = m.sap_matl_no::text
         JOIN dream.udh_batches b
              ON il.plant_code::text = b.plant_code::text AND il.sap_matl_no::text = b.sap_matl_no::text AND
                 il.batch_number::text = b.batch_number::text
         LEFT JOIN dream.udh_process_orders p
                   ON il.plant_code::text = p.plant_code::text AND il.sap_matl_no::text = p.sap_matl_no::text AND
                      il.production_order_no::text = p.production_order_no
         LEFT JOIN dream.receipting gr
                   ON il.plant_code::text = gr.plant_code::text AND il.sap_matl_no::text = gr.sap_matl_no::text AND
                      il.batch_number::text = gr.batch_number::text
         LEFT JOIN ascoli_puurs_qa_brr_finish ab
                   ON il.plant_code::text = ab.plant_code::text AND il.insp_lot_no::text = ab.insp_lot_no::text
         LEFT JOIN lrt_only_batches lrto
                   ON il.plant_code::text = lrto.plant_code::text AND il.sap_matl_no::text = lrto.sap_matl_no::text AND
                      il.batch_number::text = lrto.batch_number::text
         LEFT JOIN dream.pgsdw_lrt lrt
                   ON il.plant_code::text = lrt.plant_code::text AND il.sap_matl_no::text = lrt.sap_matl_no::text AND
                      il.batch_number::text = lrt.batch_number::text
         LEFT JOIN puurs_brr_delivery pbd
                   ON il.plant_code::text = pbd.plant_code::text AND il.insp_lot_no::text = pbd.insp_lot_no::text
         LEFT JOIN puurs_gr_brr pgr
                   ON il.plant_code::text = pgr.plant_code::text AND il.insp_lot_no::text = pgr.insp_lot_no::text
         LEFT JOIN informa_batches ib ON il.plant_code::text = ib.plant_code AND il.batch_number::text = ib.batch_number
         LEFT JOIN freiburg_qa_brr_finish fb
                   ON il.plant_code::text = fb.plant_code::text AND il.insp_lot_no::text = fb.insp_lot_no::text
         LEFT JOIN tuas_mfg_brr_finish t
                   ON t.plant_code::text = il.plant_code::text AND t.batch_number::text = il.batch_number::text
         LEFT JOIN dream.tevila_document_receipts te ON il.insp_lot_no::text = te.insp_lot_no
         LEFT JOIN freiburg_p2c2_end_of_packaging pp
                   ON il.batch_number::text = pp.charge AND il.production_order_no::text = pp.order_number AND
                      il.plant_code::text = 'DE22'::text
         LEFT JOIN freiburg_p2c2_manager_review pm
                   ON il.batch_number::text = pm.charge AND il.production_order_no::text = pm.order_number AND
                      il.plant_code::text = 'DE22'::text
WHERE il.production_order_no IS NOT NULL
   OR il.plant_code::text = 'BE37'::text;

*/