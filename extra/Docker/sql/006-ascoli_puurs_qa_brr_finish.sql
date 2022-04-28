-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
/*
create materialized view if not exists dream.ascoli_puurs_qa_brr_finish as
WITH incomplete_ascoli_brr AS (
    SELECT DISTINCT s.insp_lot_no
    FROM dream.udh_sql_lims s
    WHERE s.plant_code::text = 'IT10'::text
      AND s.supervisor::text = 'IPDOC'::text
      AND s.test_date_completed IS NULL
      AND (s.operation::text ~~ '%REVIEW%'::text AND s.sap_matl_no::text ~~ 'F%'::text OR
           NOT s.sap_matl_no::text ~~ 'F%'::text)
)
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
        (ARRAY ['BRR API'::character varying::text, 'BRR DP FG'::character varying::text, 'BRR DP MFG'::character varying::text])) OR
       s.operation::text ~~ '%BATCH REC REV%'::text)
  AND NOT (s.insp_lot_no::text IN (SELECT DISTINCT s_1.insp_lot_no
                                   FROM dream.udh_sql_lims s_1
                                   WHERE ((s_1.supervisor::text = ANY
                                           (ARRAY ['BRR API'::character varying::text, 'BRR DP FG'::character varying::text, 'BRR DP MFG'::character varying::text])) OR
                                          s_1.operation::text ~~ '%BATCH REC REV%'::text)
                                     AND s_1.date_sample_reviewed IS NULL))
GROUP BY s.plant_code, s.insp_lot_no;

create unique index if not exists ascoli_puurs_qa_brr_finish_plant_code_idx
    on dream.ascoli_puurs_qa_brr_finish (plant_code, insp_lot_no);

*/