--liquibase formatted sql

--changeset kz:1
--rollback DROP TABLE person;
create table person (
    id int primary key,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)

--changeset kz:2
--rollback DROP TABLE company;
create table company (
    id int primary key,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)

--changeset kz:3
--rollback ALTER TABLE person DROP COLUMN country;
alter table person add column country varchar(2)

--changeset kz:4
--rollback ALTER TABLE person DROP COLUMN state;
alter table person add column state varchar(2)

--changeset kz:5
--rollback ALTER TABLE company DROP COLUMN country;
alter table company add column country varchar(2)