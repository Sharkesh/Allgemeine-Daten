use it22Autoverleih
go

	--bulk insert dbo.tblLand
	--from'\\192.168.188.2\SicherungenDB\Land.txt'
	--with(
	--errorfile='\\192.168.188.2\SicherungenDB\error.txt',
	--formatfile ='\\192.168.188.2\SicherungenDB\format.fmt');

	bulk insert dbo.tblLand
	from'\\192.168.188.2\SicherungenDB\Land.txt'
	with(
	datafiletype = 'widechar',
	fieldterminator = ';',
	rowterminator=';\n');

delete from dbo.tblLand
