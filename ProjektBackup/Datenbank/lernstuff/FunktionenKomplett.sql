-- KEINE Befehle aus DML, DDL oder DCL
-- also KEIN insert, update, delete, create, alter, drop
-- Möglich in Fkt: Variablen verwenden, if, case, while und Select


-- Skalare Funktion: gibt genau 1 Wert zurück
-- Rückgabewert zB float, varchar, datetime, int

-- erstellen
-- Klammern sind zwingend
-- begin und end in sklaren und TabellenwertFkt
-- return Anweisung darf nur 1x vorkommen
-- Schemaangabe bzw zweiteiliger Name zwingend erforderlich beim Aufruf
create function fAddiere(@x int, @y int) 
returns int
as
begin
	return @x + @y
end


-- Aufruf der Fkt zB mit select
select dbo.faddiere(3,9)


-- ändern der Fkt mit alter

-- löschen einer Fkt - ohne Klammern
drop function dbo.faddiere



-- Inline Fkt
-- vereinfachte Tabellenwertfkt, wie eine View mit Parametern
-- liefert das Ergebnis eines Select Statements zurück (Zeilen, Spalten)
-- besteht aus genau EINER Anweisung - return (select ..), daher
-- KEIN begin und end
alter function fAddressEmployee(@id int)
returns table
as
	return(SELECT c.ContactID, firstname, lastname, a.AddressID, Adresse, PLZ, Stadt, 
			BundeslandCode, Bundesland, 
            LandCode, Land,SickLeaveHours,
			e.Title,HireDate,BirthDate, d.name as Abteilung
			FROM dbo.qryAddressStateCountry a
			join HumanResources.EmployeeAddress ea
				on ea.AddressID = a.AddressID
			join HumanResources.Employee e
				on e.EmployeeID = ea.EmployeeID
			join Person.Contact c
				on c.contactid= e.contactid
			join HumanResources.EmployeeDepartmentHistory edh
				on edh.EmployeeID = e.EmployeeID
			join HumanResources.Department d
				on d.DepartmentID = edh.DepartmentID
			where (e.contactid = @id or @id is null) and edh.enddate is null)
go

-- Tabellenwertfkt:
-- geben eine Tabelle zurück
-- kann mehrere Anweisungen enthalten
-- hier muss der Table deklariert werden

-- alle Angestellten zurück geben, die mehr als @std Krankenstand haben.
create function fTest(@std int)
returns @t table
	(id int,
	 vorname varchar(50),
	 nachname varchar(50),
	 krank int)
as
begin
	-- declare @x int
	-- set @x = 3
	-- hier können mehrere Anweisungen stehen
	-- in Tabellenfkt kann insert, update, delete im Zusammenhang
	-- mit der table Variable stehen. 
	insert into @t
	select contactid, firstname, lastname, sickleavehours
	from dbo.fAddressEmployee(null)
	where sickleavehours > @std

	return
end

select *
from fTest(15)