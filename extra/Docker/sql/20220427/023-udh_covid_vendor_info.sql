-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_covid_vendor_info
(
    date_of_mfg  date,
    batch_number varchar(20),
    sap_matl_no  varchar(20),
    vendor_name  text,
    plant_code   varchar(4),
    vendor_key   text
);

