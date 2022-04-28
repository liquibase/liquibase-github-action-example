-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists public.users
(
    node_location         text,
    node_company          text,
    disabled_at           timestamp with time zone,
    last_name             varchar(255),
    created_at            timestamp with time zone,
    admin                 boolean                  default false,
    node_fetched_at       timestamp with time zone,
    welcome_email_sent_at timestamp with time zone,
    site_affiliation      varchar(255),
    activated_at          timestamp with time zone default now(),
    password              varchar(60),
    ntid                  varchar(255),
    node_labels           jsonb,
    updated_at            timestamp with time zone,
    anonymous_stats       boolean                  default false,
    requested_account_at  timestamp with time zone,
    last_activity_at      timestamp with time zone default now(),
    request_account_token text                     default uuid_generate_v4(),
    id                    serial,
    first_name            varchar(255),
    email                 varchar(254)
);

