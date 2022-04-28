-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_covid_workcenters
(
    site                 text,
    work_center_resource text,
    sap_matl_no          text,
    operation_desc       text,
    batch                text,
    operation_number     text,
    process_order        text
);

