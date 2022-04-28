-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists _qa.udh_data_metrics_history
(
    metric_id           integer                     not null,
    current_value_float double precision,
    _ts                 timestamp(2) with time zone not null,
    constraint pk_udh_data_metrics_history
        primary key (metric_id, _ts),
    constraint fk_udh_data_metrics_history_data_metrics_lookup
        foreign key (metric_id) references _qa.udh_data_metrics_lookup
);

