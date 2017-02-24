USE it22Autoverleih
GO

CREATE TABLE tblBulkPLZOrt
(
PLZEN nvarchar(100) NOT NULL,
ORT nvarchar(100) NOT NULL
)

DROP TABLE tblBulkPLZOrt

BULK INSERT dbo.tblBulkPLZOrt
FROM '\\192.168.188.2\SicherungenDB\PLZOrt1.txt'
WITH(
datafiletype = 'widechar',
fieldterminator = ';',
rowterminator='\n');

SELECT * 
FROM tblBulkPLZOrt

delete from dbo.tblPLZOrt