-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists _qa.udh_data_metrics_tests
(
    metric_id     integer      not null,
    test_id       integer      not null,
    test_name     varchar(250) not null,
    min_limit     double precision,
    max_limit     double precision,
    min_limit_sql varchar(2000),
    max_limit_sql varchar(2000),
    constraint pk_udh_data_metrics_tests
        primary key (metric_id, test_id),
    constraint fk_udh_data_metrics_tests_data_metrics_lookup
        foreign key (metric_id) references _qa.udh_data_metrics_lookup
);

