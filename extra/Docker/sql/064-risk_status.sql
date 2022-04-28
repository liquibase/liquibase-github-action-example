-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
DO $$
BEGIN
IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'risk_status') THEN
create type public.risk_status as enum ('late', 'at_risk', 'on_time');
END IF;
END$$;
