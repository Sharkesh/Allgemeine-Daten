use it22Autoverleih
go


-- Variable für das Bild erstellen
DECLARE @cnt INT = 1;

-- hier die anzahl an bildern im ordner
DECLARE @cnt_total INT = 3;
declare @execVariable as varchar(500);


-- Schleife, die alle Bilder in die Tabelle lädt

WHILE @cnt <= @cnt_total
BEGIN
	set @execVariable = 'insert into tbleyecatcher(eyecatcher) SELECT CAST(bulkcolumn AS VARBINARY(MAX))
		  FROM OPENROWSET(
				BULK 
				''D:\SicherungenDB\pics\Kamel' + convert(varchar(2),@cnt) +'.jpg'',
				SINGLE_BLOB ) AS x ' ;
	-- Bild der Var zuweisen

	exec(@execVariable)

           
	   SET @cnt = @cnt + 1;
END;

select * from tbleyecatcher


--delete from tbleyecatcher
--where IDEyecatcher between 35 and 52

