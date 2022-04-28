-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_scn
(
    comments            varchar,
    site_qa_approval_on date,
    responsible_person  varchar,
    pr_id               varchar,
    due_date            date,
    reference_field     varchar,
    description         varchar,
    date_opened         date,
    bu_areas            varchar,
    areas_affected      varchar,
    closed_on           date,
    plant_code          varchar(4),
    investigation_type  varchar,
    state               varchar
);

