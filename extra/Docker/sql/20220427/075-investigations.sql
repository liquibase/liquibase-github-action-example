-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.investigations
(
    plant_code                 varchar(4),
    batch_number               varchar(50),
    pr_id                      numeric,
    investigation_type         varchar(50),
    state                      varchar(50),
    investigate_planned_start  date,
    investigate_actual_start   date,
    investigate_planned_finish date,
    investigate_actual_finish  date,
    responsible_person         varchar(4000),
    comments                   varchar(1016),
    bu_areas                   varchar(1016),
    areas_affected             varchar(4000)
);

create index if not exists investigations_1
    on dream.investigations (plant_code, batch_number);

create table if not exists public.investigations
(
    id                       varchar(255)                             not null,
    batch_num                varchar(50),
    pr_id                    varchar(255),
    investigation_type       varchar(50),
    state                    varchar(50),
    planned_start            date,
    estimated_start          date,
    actual_start             date,
    planned_finish           date,
    estimated_finish         date,
    actual_finish            date,
    responsible_person       varchar(40),
    comments                 text,
    bu_areas                 text,
    areas_affected           text,
    created_at               timestamp with time zone,
    updated_at               timestamp with time zone,
    deleted_at               timestamp with time zone,
    plant_code               varchar(6) default ''::character varying not null,
    risk_status              risk_status,
    progress                 progress,
    sqa_contact              varchar(255),
    covid_auto_estimated     boolean    default false                 not null,
    machine_estimated_finish date,
    primary key (id)
);

create index if not exists investigations_batch_num_index
    on public.investigations (batch_num);

create index if not exists investigations_deleted_at_index
    on public.investigations (deleted_at);

create index if not exists investigations_id_index
    on public.investigations (id);

create index if not exists investigations_plant_code_index
    on public.investigations (plant_code);

create index if not exists investigations_pr_id_index
    on public.investigations (pr_id);

create index if not exists investigations_progress_index
    on public.investigations (progress);

create index if not exists investigations_risk_status_index
    on public.investigations (risk_status);

