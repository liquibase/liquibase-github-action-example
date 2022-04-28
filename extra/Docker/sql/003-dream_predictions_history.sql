-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists _qa.dream_predictions_history
(
    batch_number  text,
    insp_lot_no   text                                                  not null,
    estimate      double precision                                      not null,
    estimate_type varchar(10)                                           not null,
    _ts           timestamp(2) with time zone default CURRENT_TIMESTAMP not null,
    constraint pk_dream_predictions_history
        primary key (insp_lot_no, _ts),
    constraint dream_predictions_history_estimate_type_check
        check ((estimate_type)::text = ANY
               ((ARRAY ['testing'::character varying, 'qa_brr'::character varying, 'mfg_brr'::character varying, 'dispo'::character varying])::text[]))
);

