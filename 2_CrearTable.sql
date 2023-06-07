--crear el schema y la tabla
use ESPINOZA;

create schema Base;

create table Base.Resultados
(fecha date,
alcance_fb int,
alcance_ig int,
nombre varchar(30),
fecha_carga datetime
)
--agregar el indice clusterizado a la tabla indicada
create clustered index Cls_Idx_Fecha
on Base.Resultados (fecha)
go

--creando un usuario y otorgando los permisos
CREATE USER jairo FOR LOGIN jairo;

GRANT INSERT ON Base.Resultados TO jairo;