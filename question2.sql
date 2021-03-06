-- Fichier ParcInfo.sql
-- Alekesandra Maric (1049140) 
-- pour postgres

BEGIN transaction;

SET search_path to ParcInfo;


ALTER TABLE Segment
	ALTER COLUMN indIP TYPE varchar(20);

ALTER TABLE Salle
	ALTER COLUMN indIP TYPE varchar(20);

ALTER TABLE Poste
	ALTER COLUMN indIP TYPE varchar(20);



ALTER TABLE Salle
	ALTER COLUMN nSalle TYPE varchar(20);

ALTER TABLE Poste
	ALTER COLUMN nSalle TYPE varchar(20);


ALTER TABLE Logiciel
	ALTER COLUMN nLog TYPE varchar(20);

ALTER TABLE Installer
	ALTER COLUMN nLog TYPE varchar(20);

ALTER TABLE Poste
	ALTER COLUMN nPoste TYPE varchar(20);
	
ALTER TABLE Installer
	ALTER COLUMN nPoste TYPE varchar(20);


ALTER TABLE Installer
	ALTER COLUMN dateIns drop not null;

COMMIT;