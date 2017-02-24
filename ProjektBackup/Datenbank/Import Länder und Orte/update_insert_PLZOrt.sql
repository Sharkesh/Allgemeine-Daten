use it22Autoverleih
go

drop table dbo.PLZOrt_mehrerePLZ

--UPDATE tblBulkPLZOrt
--SET PLZEN = Substring(PLZEN,1,4)

INSERT INTO tblPLZOrt (PLZ,Ort,FKLand)
SELECT PLZEN,ORT,'AT' from tblBulkPLZOrt 

--UPDATE tblPLZOrt
--SET Ort = SUBSTRING(Ort,1,4) FROM tblPLZOrt WHERE PLZ >= '1010' and PLZ <= '1230' and Ort like 'Wien%'

SELECT *
FROM tblPLZOrt
ORDER BY PLZ

DELETE FROM tblPLZOrt