--creando el store procedure y function requeridas
use ESPINOZA;

create procedure Base.uSp_ListaAlcance_Facebook
@FechaInicio datetime, @FechaFin datetime
as
	select fecha, alcance_fb
	from Base.Resultados
	where fecha between @FechaInicio and @FechaFin
go

create function Base.fn_Alcance_Ig (@fecha_busq datetime)
returns int
as
begin
	declare @resultado int;
	set @resultado=(select sum(alcance_ig) from Base.Resultados
					where fecha=@fecha_busq);
	return @resultado;
end