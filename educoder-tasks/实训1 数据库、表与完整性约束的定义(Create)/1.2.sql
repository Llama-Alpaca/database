CREATE DATABASE TestDb;
USE TestDb;
CREATE TABLE t_emp(
    id int primary key,
    name varchar(32),
    deptId int,
    salary float
);