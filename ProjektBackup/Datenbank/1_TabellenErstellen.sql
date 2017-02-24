use it22Autoverleih
go

create table tblLogin(
	IDLogin int identity(1,1) primary key,
	Email varchar(100) NOT NULL unique,
	Passwort varchar(100) NOT NULL,
	Rolle char NOT NULL check(Rolle='M' or Rolle='K' or Rolle='A'),
	Deaktiviert bit NOT NULL default(0)
);

create table tblMitarbeiter(
	IDMitarbeiter int primary key foreign key references tblLogin(IDLogin),
	MAVorname varchar(100) NOT NULL,
	MANachname varchar(100) NOT NULL,
	MAAnrede char(4) NOT NULL check(MAAnrede in('Frau','Herr'))
);

create table tblLand(
	IDLand char(3) primary key,
	Land varchar(100) NOT NULL unique
);

create table tblPLZOrt(
	IDPLZOrt int identity(1,1) primary key,
	PLZ varchar(30) NOT NULL,
	Ort varchar(100) NOT NULL,
	FKLand char(3) foreign key references tblLand (IDLand)
);

create table tblKunde(
	IDKunde int primary key foreign key references tblLogin (IDLogin),
	Vorname nvarchar(100) NOT NULL,
	Nachname nvarchar(100) NOT NULL,
	Strasse nvarchar(100) NOT NULL,
	Telefon varchar(100) NOT NULL,
	Anrede char(4) NOT NULL check(Anrede in('Frau','Herr')),
	GebDatum date NOT NULL check(DATEDIFF(hour,GebDatum,GETDATE())/8766 >= 18),
	ReisepassNr varchar(50), 
	FKPLZOrt int foreign key references tblPLZOrt (IDPLZOrt)
);

create table tblMarke(
	IDMarke int identity(1,1) primary key,
	Marke varchar(100) NOT NULL unique
);

create table tblTyp(
	IDTyp int identity(1,1) primary key,
	Typ varchar(100) NOT NULL unique,
	FKMarke int foreign key references tblMarke (IDMarke)
);

create table tblTreibstoff(
	IDTreibstoff int identity(1,1) primary key,
	Treibstoff varchar(100) NOT NULL unique
);

create table tblAusstattung(
	IDAusstattung int identity(1,1) primary key,
	Ausstattung varchar(100) NOT NULL unique
);

create table tblKategorie(
	IDKategorie int identity(1,1) primary key,
	Kategorie varchar(50) NOT NULL unique
);

create table tblAuto(
	IDAuto int identity(1,1) primary key,
	Baujahr smallint NOT NULL check(Baujahr>1900 and Baujahr<=Year(getDate())),
	PS varchar(5) NOT NULL,
	Getriebe varchar(9) NOT NULL check(Getriebe in('Automatik','Manuell')),
	Tueren varchar(20) NOT NULL,
	Sitze tinyint NOT NULL check(Sitze>=2),
	MietPreis decimal(6,2) NOT NULL check(MietPreis>=0),
	VerkaufPreis decimal(9,2) NOT NULL check(VerkaufPreis>=0) default(0),
	Kilometerstand decimal(10,0) NOT NULL,
	AutoBild varbinary(max),
	Anzeigen bit NOT NULL default(1),
	FKTreibstoff int NOT NULL foreign key references tblTreibstoff (IDTreibstoff),
	FKTyp int NOT NULL foreign key references tblTyp (IDTyp), 
	FKKategorie int NOT NULL foreign key references tblKategorie (IDKategorie)
);

create table tblAutodetail(
	FKAuto int NOT NULL foreign key references tblAuto (IDAuto),
	FKAusstattung int NOT NULL foreign key references tblAusstattung (IDAusstattung),
	primary key(FKAuto, FKAusstattung)
);

create table tblBuchung
(
	IDBuchung int identity(1,1) primary key,
	BuchungAm smalldatetime NOT NULL default(getdate()),
	BuchungVon date NOT NULL,
	BuchungBis date NOT NULL,
	constraint DatumsVergleich check (BuchungBis >= BuchungVon),
	Versicherung bit NOT NULL default(0),
	FKKunde int NOT NULL foreign key references tblKunde (IDKunde),
	FKAuto int NOT NULL foreign key references tblAuto (IDAuto),
	Tage as datediff(day,BuchungVon,BuchungBis)+1,
	BuchungStatus varchar(10) default('erstellt'),
	Storno bit NOT NULL default(0)
);

create table tblHistorie
(
	IDHistorie int identity(1,1) primary key,
	FKMitarbeiter int NOT NULL foreign key references tblMitarbeiter (IDMitarbeiter),
	FKBuchung int NOT NULL foreign key references tblBuchung (IDBuchung),
	AenderungsDatum smalldatetime default(getdate())
);

-- Standalone Tables : Eyecatcher
create table tblEyecatcher
(
	IDEyecatcher int identity primary key,
	GUIDBild uniqueidentifier rowguidcol not null unique default newID(),
	Eyecatcher varbinary(max) filestream
);
