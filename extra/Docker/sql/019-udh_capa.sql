-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_capa
(
    pr_state                      varchar,
    site_qa_approval_on           date,
    responsible_person            varchar,
    parent_pr_id                  text,
    pr_id                         text,
    qa_acknowledgement_needed     varchar,
    due_date                      date,
    qa_acknowledgement_on         date,
    opu_quality_lead_approved_on  date,
    date_opened                   date,
    is_capa_required_to_release   varchar,
    title_short_description       varchar,
    site_quality_lead_approved_on date,
    bu_areas                      varchar,
    capa_type                     varchar,
    action_completed_on           date,
    areas_affected                varchar,
    closed_on                     date,
    action_completed_by           varchar,
    sqa_contact                   varchar,
    plant_code                    varchar(4)
);

