-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists public.tags
(
    color            varchar(255),
    background_color varchar(255),
    updated_at       timestamp with time zone,
    name             varchar(255),
    created_at       timestamp with time zone,
    plant_code       varchar(255),
    fixed            boolean default false,
    id               serial,
    deleted_at       timestamp with time zone
);

