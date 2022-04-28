-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
/*
create materialized view if not exists dream.receipting as
WITH m_or_s AS (
    SELECT mo.plant_code
         , mo.sap_matl_no
         , mo.batch_number
         , min(mo.movement_date) AS custom_first_gr
         , max(mo.movement_date) AS custom_last_gr
    FROM dream.udh_movements mo
    WHERE mo.movement_type = 101::numeric
      AND NOT (mo.quantity = 0::numeric AND NOT (mo.plant_code::text = ANY
                                                 (ARRAY ['GC52'::character varying::text, 'AN32'::character varying::text])))
    GROUP BY mo.plant_code, mo.sap_matl_no, mo.batch_number
)
   , all_gr AS (
    SELECT m.plant_code
         , m.sap_matl_no
         , m.batch_number
         , max(m.movement_date) AS last_gr
    FROM dream.udh_movements m
    WHERE m.movement_type = 101::numeric
    GROUP BY m.plant_code, m.sap_matl_no, m.batch_number
)
   , nonzero AS (
    SELECT m.plant_code
         , m.sap_matl_no
         , m.batch_number
         , max(m.movement_date) AS last_nonzero_gr
    FROM dream.udh_movements m
    WHERE m.movement_type = 101::numeric
      AND NOT m.quantity = 0::numeric
    GROUP BY m.plant_code, m.sap_matl_no, m.batch_number
)
   , zero AS (
    SELECT m.plant_code
         , m.sap_matl_no
         , m.batch_number
         , max(m.movement_date) AS last_zero_gr
    FROM dream.udh_movements m
    WHERE m.movement_type = 101::numeric
      AND m.quantity = 0::numeric
    GROUP BY m.plant_code, m.sap_matl_no, m.batch_number
)
SELECT ms.plant_code
     , ms.sap_matl_no
     , ms.batch_number
     , ms.custom_first_gr
     , ms.custom_last_gr
     , ag.last_gr
     , nz.last_nonzero_gr
     , z.last_zero_gr
FROM m_or_s ms
         LEFT JOIN nonzero nz
                   ON ms.plant_code::text = nz.plant_code::text AND ms.sap_matl_no::text = nz.sap_matl_no::text AND
                      ms.batch_number::text = nz.batch_number::text
         LEFT JOIN zero z ON ms.plant_code::text = z.plant_code::text AND ms.sap_matl_no::text = z.sap_matl_no::text AND
                             ms.batch_number::text = z.batch_number::text
         JOIN all_gr ag ON ms.plant_code::text = ag.plant_code::text AND ms.sap_matl_no::text = ag.sap_matl_no::text AND
                           ms.batch_number::text = ag.batch_number::text;

create unique index if not exists receipting_id
    on dream.receipting (plant_code, sap_matl_no, batch_number);

*/