-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_mcp_gqts
(
    comments            varchar(1016),
    batch_number        text,
    site_qa_approval_on date,
    responsible_person  varchar(321),
    pr_id               varchar,
    due_date            date,
    reference_field     varchar,
    bu_areas            varchar(1016),
    areas_affected      varchar(4000),
    closed_on           date,
    opu_ql_approval_on  date,
    sqa_contact         text,
    plant_code          varchar(4),
    investigation_type  varchar(1280),
    state               varchar(640),
    qa_final_app_on     date,
    discovery_date      date
);

