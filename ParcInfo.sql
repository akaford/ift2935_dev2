-- Fichier ParcInfo.sql
-- Alekesandra Maric (1049140) 
-- pour postgres

BEGIN transaction;

DROP SCHEMA IF EXISTS ParcInfo CASCADE; -- est-ce nécessaire
CREATE SCHEMA ParcInfo;
SET search_path to ParcInfo;

CREATE DOMAIN dom_ad as integer -- ad est une chaîne de caractère ????!!!!
	check (value >= 0 and value <= 255);

CREATE DOMAIN dom_prix as real
	check (value >= 0);

CREATE TABLE Segment (
	indIP integer, -- (exemple:130.120.80)
	nomSegment varchar(20) not null,-- varchar varie alors que char est statique
	etage integer
);

CREATE TABLE Salle (
	nSalle integer,
	nomSalle varchar(20) not null,
	nbPoste integer,
	indIP integer
);

CREATE TABLE Poste (
	nPoste integer,
	nomPoste varchar(20) not null,
	indIP integer,
	ad dom_ad not null, --dernier groupe de chiffres IP(exemple:11)
	typePoste varchar(4), --(UNIX,TX,PCWS,PCNT)
	nSalle integer
);

CREATE TABLE Logiciel (
	nLog integer,
	nomLog varchar(20),
	dateAch date,
	version varchar(20),
	typeLog varchar(4), --(UNIX,TX,PCWS,PCNT)
	prix dom_prix
);

CREATE TABLE Installer (
	numIns serial,
	nPoste integer,
	nLog integer,
	dateIns date not null DEFAULT CURRENT_DATE,
	delai integer
);

CREATE TABLE Types (
	typeLP varchar(4),
	nomType varchar(20)
);

COMMIT;



















