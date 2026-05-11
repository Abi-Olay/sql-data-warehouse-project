---create Database 'Datawarehouse'
USE MASTER;
CREATE DATABASE Datawarehouse;
USE Datawarehouse;

CREATE SCHEMA BRONZE;
go
CREATE SCHEMA Silver;
go
CREATE SCHEMA Gold;
go
