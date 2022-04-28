-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_scar
(
    comments                      varchar(1016),
    batch_number                  text,
    responsible_person            varchar(321),
    pr_id                         varchar,
    defect_discovery_date         date,
    due_date                      date,
    scar_issued_on                date,
    date_opened                   date,
    original_supplier_target_date date,
    bu_areas                      varchar(1016),
    supplier_target_date          date,
    closed_on                     date,
    sqa_contact                   text,
    plant_code                    varchar(4),
    investigation_type            varchar(1280),
    state                         varchar(640)
);

