-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists public.sites
(
    site_desc                  varchar(255),
    timezone                   varchar(255),
    latitude                   numeric(10, 7),
    created_at                 timestamp with time zone,
    cascade_priority           boolean default false,
    dsh_node_id                text,
    disable_caching            boolean default false,
    cascade_need_by            boolean default false,
    hide_from_site_menu        boolean default false,
    cascade_priority_order     boolean default false,
    last_cache_at              timestamp with time zone,
    last_import_at             timestamp with time zone,
    updated_at                 timestamp with time zone,
    plant_code                 varchar(255),
    manual_entry_qc_activities boolean default false,
    longitude                  numeric(10, 7)
);

