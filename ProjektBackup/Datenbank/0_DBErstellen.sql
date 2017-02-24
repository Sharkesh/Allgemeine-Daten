USE master   	--muss bei der Erstellung von DB eingestellt werden
GO

-- Filestream muss zuerst im ConfigManager aktiviert werden unter den
-- Eigenschaften des Dienstes, dann in den Eigenschaften der Instanz
-- nochmal aktivieren. 

CREATE DATABASE it22Autoverleih
 ON PRIMARY					--Standarddateigruppe, muss man nicht erstellen,da immer vorhanden
	(NAME = it22Autoverleih,		-- logischer Name der Datendatei
	--physischer Name = Pfad    für diese Eigenschaft braucht man einen Text, der unter Apostroph steht
	 FILENAME = 'D:\DB\MSSQL11.MSSQLSERVER\MSSQL\DATA\it22Autoverleih_data.mdf',
	 SIZE = 15MB,		 		--Anfangsgröße, immer in MB
	 -- MAXSIZE = 20,				-- bei Nichtverwendung unbeschränkt vergrößerbar
	 FILEGROWTH = 2			-- um wieviel soll die DB jeweils vergrößert werden, in MB
	),

FILEGROUP AutoverleihFiles contains filestream default			-- sekundäre Dateigruppe erstellen
	(NAME = N'AutoverleihFiles',
	 FILENAME = 'D:\DB\MSSQL11.MSSQLSERVER\MSSQL\DATA\it22AutoverleihFiles'	
	 			
	)
	
LOG ON 					-- Protokolldatei, ca 10-20% von Datendatei
	(NAME = it22Autoverleih_log,
	 FILENAME = 'D:\DB\MSSQL11.MSSQLSERVER\MSSQL\DATA\it22Autoverleih_1.ldf',	
	 SIZE = 3MB,		 		
	 FILEGROWTH = 20%			
	)
	
GO















