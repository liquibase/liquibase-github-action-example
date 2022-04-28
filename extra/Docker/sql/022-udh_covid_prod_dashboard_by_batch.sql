-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
create table if not exists dream.udh_covid_prod_dashboard_by_batch
(
    kalamazoo_doses_on_hand                 numeric,
    puurs_doses_on_hand                     numeric,
    mcpherson_doses_on_hand                 numeric,
    pleasent_prairie_released_doses_on_hand numeric,
    batch_number                            text,
    doses_produced_2021_s2                  numeric,
    sap_matl_no                             text,
    karlsruhe_released_doses_on_hand        numeric,
    doses_produced_2021_s1                  numeric,
    threshold_date_for_75_percent           date,
    presentation                            text,
    karlsruhe_doses_on_hand                 numeric,
    eaches_externally_released_2020         numeric,
    pleasent_prairie_doses_on_hand          numeric,
    jde_matl_no                             text,
    final_gr_date                           date,
    puurs_released_doses_on_hand            numeric,
    eaches_externally_released_2021         numeric,
    doses_externally_released_2020          numeric,
    eaches_produced_2021                    numeric,
    eaches_produced_2020                    numeric,
    external_release_date                   date,
    kalamazoo_released_doses_on_hand        numeric,
    site                                    text,
    mcpherson_released_doses_on_hand        numeric,
    doses_produced_2020                     numeric,
    doses_externally_released_2021_s1       numeric,
    doses_externally_released_2021_s2       numeric,
    actual_confirmed_date                   date
);

