-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_prod_refresh_status
(
    sql_lims_count       numeric,
    latest_qts_date      timestamp,
    teco_date_latest     date,
    latest_labware_date  timestamp,
    latest_insp_date     date,
    labware_count        numeric,
    qts_count            numeric,
    latest_glims_date    timestamp,
    insp_count           numeric,
    glims_count          numeric,
    teco_date_count      numeric,
    inserted_at          timestamp,
    latest_sql_lims_date timestamp,
    movements_count      numeric,
    veeva_count          numeric
);

