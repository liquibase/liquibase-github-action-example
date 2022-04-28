-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists _qa.udh_data_metrics_lookup
(
    metric_id       integer      not null,
    metric_name     varchar(250) not null,
    table_schema    name         not null,
    table_name      name         not null,
    column_name     name         not null,
    calculation_sql varchar(2000),
    constraint pk_udh_data_metrics_lookup
        primary key (metric_id)
);

