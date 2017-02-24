use it22Autoverleih
go

INSERT INTO tblLogin(Email,Passwort,Rolle)
VALUES
('max.muster@muster.com','123user!','K'),
('peter.rudolf@peter.de','456user!','M'),
('ludwig.hans@ludwig.de','789user!','A'),
('christian@muster.com','123user!','K'),
('Mario@patrick.com','123user!','K'),
('martin@stefan.de','456user!','M'),
('ralph@hansi.de','456user!','M');

INSERT INTO tblMitarbeiter
VALUES
((select idlogin from tbllogin where email = 'peter.rudolf@peter.de'),'Peter','Rudolf','Herr'),
((select idlogin from tbllogin where email = 'martin@stefan.de'),'Martin','Stefan','Herr'),
((select idlogin from tbllogin where email = 'ralph@hansi.de'),'Ralph','Hansi','Frau');
/*
INSERT INTO tblLand
VALUES
('AUT','Austria'),
('GER','Germany'),
('SRB','Serbia')

INSERT INTO tblPLZOrt
VALUES
('1020','Wien','AUT'),
('45550','Berlin','GER'),
('65501','Belgrad','SRB')
*/
INSERT INTO tblKunde
VALUES
((select idlogin from tbllogin where email = 'max.muster@muster.com'),'Max','Muster','Belgradstrasse','010101010','Herr','19.5.1992','00001',(select IDPLZOrt from tblPLZOrt where PLZ = '1110')),
((select idlogin from tbllogin where email = 'christian@muster.com'),'Christian','Muster','Wienerstrasse','020202020','Frau','23.4.1998','00002',(select IDPLZOrt from tblPLZOrt where PLZ = '4400')),
((select idlogin from tbllogin where email = 'Mario@patrick.com'),'Mario','Patrick','Berlinerstrasse','030303030','Herr','01.01.1990','00003',(select IDPLZOrt from tblPLZOrt where PLZ = '1220'))

INSERT INTO tblMarke
VALUES
('Audi'),
('BMW'),
('Mercedes')

INSERT INTO tblTyp
VALUES
('312d', (select idmarke from tblMarke where Marke = 'BMW')),
('A4',(select idmarke from tblMarke where Marke = 'Audi')),
('C63',(select idmarke from tblMarke where Marke = 'Mercedes'))

INSERT INTO tblTreibstoff
VALUES
('Diesel'),
('Benzin'),
('Gas')

INSERT INTO tblAusstattung
VALUES
('Klima'),
('Leder Sitze'),
('Schiebedach')

INSERT INTO tblKategorie
VALUES
('Kleinwagen'),
('Mittelklasse'),
('Luxusklasse')

INSERT INTO tblAuto
VALUES
(2003,'180','Manuell','5','5',300,0,20000,0,1,(select idtreibstoff from tblTreibstoff where treibstoff = 'Diesel'),(select idtyp from tblTyp where typ = '312d'),(select idkategorie from tblKategorie where kategorie = 'Mittelklasse')),
(2012,'350','Automatik','3','2',500,0,5000,0,1,(select idtreibstoff from tblTreibstoff where treibstoff = 'Benzin'),(select idtyp from tblTyp where typ = 'C63'),(select idkategorie from tblKategorie where kategorie = 'Luxusklasse')),
(1999,'120','Manuell','5','5',150,0,100000,0,0,(select idtreibstoff from tblTreibstoff where treibstoff = 'Gas'),(select idtyp from tblTyp where typ = '312d'),(select idkategorie from tblKategorie where kategorie = 'Kleinwagen'))

INSERT INTO tblAutodetail
VALUES
((select idauto from tblAuto where baujahr = '2003'),(select idausstattung from tblAusstattung where ausstattung = 'Schiebedach')),
((select idauto from tblAuto where baujahr = '2012'),(select idausstattung from tblAusstattung where ausstattung = 'Leder Sitze')),
((select idauto from tblAuto where baujahr = '1999'),(select idausstattung from tblAusstattung where ausstattung = 'Klima'))

INSERT INTO tblBuchung(BuchungVon,BuchungBis,FKKunde,FKAuto)
VALUES
('09.02.2017','15.02.2017',(select idkunde from tblKunde where GebDatum = '23.4.1998'),(select idauto from tblAuto where Baujahr = '2012')),
('28.01.2017','02.02.2017',(select idkunde from tblKunde where GebDatum = '01.01.1990'),(select idauto from tblAuto where Baujahr = '1999')),
('10.02.2017','20.02.2017',(select idkunde from tblKunde where GebDatum = '19.5.1992'),(select idauto from tblAuto where Baujahr = '2003'))

INSERT INTO tblHistorie(FKMitarbeiter,FKBuchung)
VALUES
((select idmitarbeiter from tblMitarbeiter where MANachname = 'hansi'),(select idbuchung from tblBuchung where BuchungVon = '28.01.2017')),
((select idmitarbeiter from tblMitarbeiter where MANachname = 'Stefan'),(select idbuchung from tblBuchung where BuchungVon = '09.02.2017')),
((select idmitarbeiter from tblMitarbeiter where MANachname = 'Rudolf'),(select idbuchung from tblBuchung where BuchungVon = '10.02.2017'))
