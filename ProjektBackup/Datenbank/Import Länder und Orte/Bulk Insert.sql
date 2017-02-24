-- bulk insert entweder in eine Tabelle, die 1:1 gleich aussieht wie
-- das File
-- oder sonst muss man Formatfile verwenden - Aufbau siehe Hilfe
-- https://msdn.microsoft.com/en-us/library/ms191516.aspx
-- https://msdn.microsoft.com/en-us/library/ms179250.aspx
-- Grundlegendes zu nicht XML-Formatfiles

-- Trennzeichen standardmäßig Tabulator
-- tabelle muss bereits vorhanden sein
-- Firstrow wenn Spaltenüberschriften im Textfile

-- im Formatfile müssen alle Spalten aus der Quelle referenziert werden. Wenn eine Spalte nicht
-- importiert werden soll, kann man als Zielreferenzspalte 0 angeben
/*
9.0
2
1       SQLCHAR       0       7       ","     2     test     ""
2       SQLCHAR       0       100     "\r\n"     0     preis             ""
*/

use dbbuchung
go

bulk insert tblImportKunde from 'S:\G\DO\SQL Statements\HQ\Bulk Insert\import.txt'
with 
(
fieldterminator = ';',
firstrow = 2,
order (vorname asc)
)

--delete from ImportKunde
select *
from tblImportKunde

-- mit Formatdatei
bulk insert tblImportKunde from 'S:\G\DO\SQL Statements\HQ\Bulk Insert\import.txt'
with 
(
firstrow = 2,
formatfile = 'S:\G\DO\SQL Statements\HQ\Bulk Insert\format.fmt'
)



-- bcp: über Kommandozeile, läuft in einem externen Prozess
bcp dbbuchung.dbo.tblkunde out "Test.txt" -T
-- -T verwendet vertraute Verbindung


-- andere Methode über openrowset
--insert into tbltest
select vorname 
from openrowset(BULK'S:\G\import.txt',FORMATFILE ='S:\G\format.fmt',
firstrow = 2) as temp

-- xml Datei
insert into tblXML
select * 
from openrowset(BULK'S:\G\neukunden.xml', single_blob) as temp
-- single_blob weist SQL Server an, das Ergebnis als Einheit zu sehen 
-- wird ohne Analyse in ein Feld der Tab gespeichert.


select *
from tblxmldaten
