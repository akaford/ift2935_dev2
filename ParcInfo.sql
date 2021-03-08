-- Fichier ParcInfo.sql
-- Alekesandra Maric (1049140) & Thomas Bui (20055825)
-- pour postgres

BEGIN transaction;

DROP SCHEMA IF EXISTS ParcInfo CASCADE; 
CREATE SCHEMA ParcInfo;
SET search_path to ParcInfo;

CREATE DOMAIN dom_ad as varchar(255)
	check (value >= '0' and value <= '255');

CREATE DOMAIN dom_prix as real
	check (value >= 0);

CREATE TABLE Segment (
	indIP integer primary key, -- (exemple:130.120.80)  
	nomSegment varchar(255) not null,
	etage integer
);

CREATE TABLE Salle (
	nSalle integer primary key, 
	nomSalle varchar(255) not null,
	nbPoste integer,
	indIP integer
);

CREATE TABLE Poste (
	nPoste integer primary key, 
	nomPoste varchar(255) not null,
	indIP integer,
	ad dom_ad, --dernier groupe de chiffres IP(exemple:11) 
	typePoste varchar(4), --(UNIX,TX,PCWS,PCNT)
	nSalle integer
);

CREATE TABLE Logiciel (
	nLog integer primary key, 
	nomLog varchar(255),
	dateAch date,
	version varchar(255),
	typeLog varchar(4), --(UNIX,TX,PCWS,PCNT)
	prix dom_prix
);

CREATE TABLE Installer (
	numIns serial primary key, 
	nPoste integer,
	nLog integer,
	dateIns timestamp not null DEFAULT CURRENT_TIMESTAMP, 
	delai integer
);

CREATE TABLE Types (
	typeLP varchar(4) primary key, 
	nomType varchar(255)
);

COMMIT;



















