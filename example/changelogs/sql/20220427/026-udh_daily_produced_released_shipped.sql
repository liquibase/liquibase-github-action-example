-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_daily_produced_released_shipped
(
    puurs_doses_produced     numeric,
    puurs_doses_released     numeric,
    kalamazoo_doses_released numeric,
    kalamazoo_doses_produced numeric,
    mcpherson_doses_produced numeric,
    day                      date,
    mcpherson_doses_released numeric
);

