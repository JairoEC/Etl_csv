--creando la base de datos y login
USE MASTER;

create database ESPINOZA
on primary
(name=db_espinoza,
filename='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\My_db_dat.mdf',
SIZE = 92160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB
),
filegroup INDICES
(name=db_espinoza_fl1,
filename='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\My_db_fl1.ndf',
SIZE = 14475KB , MAXSIZE = UNLIMITED,
FILEGROWTH = 65536KB

)
log on
(name=db_espinoza_log,
filename='C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\My_db_log.ldf',
SIZE = 14475KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB
)
go

alter database ESPINOZA
	modify filegroup INDICES default;
go

--creando login
CREATE LOGIN jairo WITH PASSWORD = 'ESPINOZA2939';