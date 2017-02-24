/*
fBuchungStatus
fBuchungProblem

*/
use it22Autoverleih
go

if object_id('dbo.fBuchungStatus') > 0 drop function dbo.fBuchungStatus
go
create function fBuchungStatus(@idBuchung int)
returns varchar(10)
as
begin
	declare @anz int
	declare @ret varchar(10)
	select @anz = count(FKBuchung)
	from tblHistorie
	where FKBuchung = @idBuchung

	if @anz < 1
		set @ret = 'erstellt'
	else if @anz < 2
		set @ret = 'abgeholt'
	else if @anz < 3
		set @ret = 'zurueck'
	return @ret

	--return (select case count(*) 
	--			when 0 then 'erstellt'
	--			when 1 then 'abgeholt'
	--			else 'zurueck' end 
	--		from tblHistorie
	--		where FKBuchung = @idBuchung)
end;
go
/*
select * from tblbuchung
select * from tblHistorie

select dbo.fBuchungStatus(1)
SJ: OK
*/

if object_id('dbo.fBuchungProblem') > 0 drop function dbo.fBuchungProblem
go
create FUNCTION fBuchungProblem(@idBuchung int)
RETURNS varchar(50)
AS
BEGIN
	DECLARE @bStatus varchar(10)
	SET @bStatus = dbo.fBuchungStatus(@idBuchung)
	
	DECLARE @ausgabe varchar(50) = ''
	DECLARE @resDateVon date
	DECLARE @resDateBis date

	SELECT @resDateVon = BuchungVon,  @resDateBis = BuchungBis
	FROM tblBuchung 
	WHERE @idBuchung = IDBuchung
	
	IF @bStatus = 'erstellt' AND GETDATE() > @resDateVon
		SET @ausgabe = 'Auto wurde noch nicht abgeholt!'
	ELSE IF @bStatus = 'abgeholt' AND GETDATE() > @resDateBis
				SET @ausgabe = 'Autorückgabe ist überfällig!'
	RETURN @ausgabe
END;
/*
-- bei skalaren Funktionen muss zwingend das Schema beim Aufruf angegeben werden!! 
-- Ansonsten sucht der SQL Server eine integrierte Fkt wie datediff()
print dbo.fBuchungProblem(2)
print dbo.fBuchungStatus(3)

select * from tblHistorie
select * from tblbuchung
SJ: Storno fehlt

*/