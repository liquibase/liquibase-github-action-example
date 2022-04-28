-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_batch_link
(
    linked_item_id          varchar(4),
    end_batch_number        varchar(20),
    batch_number            varchar(20),
    sap_matl_no             varchar(20),
    date_issued             date,
    end_sap_matl_no         varchar(20),
    linked_sap_matl_no      varchar(20),
    generations_from_source integer,
    plant_code              varchar(4),
    linked_batch_number     varchar(20),
    relation                varchar(3)
);

