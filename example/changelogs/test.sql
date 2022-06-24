-- changeset activity.8:a8b.1
create table person_a8b (
    id int primary key,
    name varchar(50) not null,
    address1 varchar(50),
    address2 varchar(50),
    city varchar(30)
)
-- rollback drop table person_a8b