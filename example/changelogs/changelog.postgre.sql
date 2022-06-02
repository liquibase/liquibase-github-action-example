-- liquibase formatted sql changeLogId:ab77c6f4-dc93-4029-85fb-3d21fc2cc1fe

-- changeset ohamu:1654087846874-1
CREATE TABLE "public"."test2_table" ("test_id" INTEGER NOT NULL, "test_column" VARCHAR, CONSTRAINT "test2_table_pkey" PRIMARY KEY ("test_id"));

-- changeset ohamu:1654087846874-2
CREATE TABLE "public"."test3_table" ("test_id" INTEGER NOT NULL, "test_column" VARCHAR, CONSTRAINT "test3_table_pkey" PRIMARY KEY ("test_id"));

-- changeset ohamu:1654087846874-3
CREATE TABLE "public"."test4_table" ("test_id" INTEGER NOT NULL, "test_column" VARCHAR, CONSTRAINT "test4_table_pkey" PRIMARY KEY ("test_id"));

-- changeset ohamu:1654087846874-4
CREATE TABLE "public"."test_table" ("test_id" INTEGER NOT NULL, "test_column" VARCHAR, CONSTRAINT "test_table_pkey" PRIMARY KEY ("test_id"));
-- changeset ohamu:1654087846874-5
CREATE TABLE "public"."test5_table" ("test_id" INTEGER NOT NULL, "test_column" VARCHAR, CONSTRAINT "test5_table_pkey" PRIMARY KEY ("test_id"));
-- rollback DROP TABLE "public"."test5_table";
CREATE TABLE "public"."test6_table" ("test_id" INTEGER NOT NULL, "test_column" VARCHAR, CONSTRAINT "test6_table_pkey" PRIMARY KEY ("test_id"));
-- rollback DROP TABLE "public"."test6_table";

