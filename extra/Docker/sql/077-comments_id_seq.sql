-- liquibase formatted sql changeLogId:8f11c9b6-3071-4e16-9a8e-ac95085200d7
--changeset Davide.Moraschi:20220427_1 labels:batch-tracker-dream context:sandbox dbms:postgresql runAlways:false runOnChange:true runInTransaction:true failOnError:true created:2022-04-27  endDelimiter://
-- public.comments_id_seq definition

-- DROP SEQUENCE public.comments_id_seq;

CREATE SEQUENCE IF NOT EXISTS public.comments_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;


-- public.insp_update_history_id_seq definition

-- DROP SEQUENCE public.insp_update_history_id_seq;

CREATE SEQUENCE IF NOT EXISTS public.insp_update_history_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;


-- public.taggings_id_seq definition

-- DROP SEQUENCE public.taggings_id_seq;

CREATE SEQUENCE IF NOT EXISTS public.taggings_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;


-- public.tags_id_seq definition

-- DROP SEQUENCE public.tags_id_seq;

CREATE SEQUENCE IF NOT EXISTS public.tags_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;


-- public.users_id_seq definition

-- DROP SEQUENCE public.users_id_seq;

CREATE SEQUENCE IF NOT EXISTS public.users_id_seq
	INCREMENT BY 1
	MINVALUE 1
	MAXVALUE 2147483647
	START 1
	CACHE 1
	NO CYCLE;