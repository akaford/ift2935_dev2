-- Fichier ParcInfo.sql
-- Alekesandra Maric (1049140) 
-- pour postgres

BEGIN transaction;

DROP SCHEMA IF EXISTS ParcInfo CASCADE; -- est-ce nécessaire --- utile si jamais on veut faire des modifications. 
CREATE SCHEMA ParcInfo;
SET search_path to ParcInfo;

CREATE DOMAIN dom_ad as varchar(20) -- ad est une chaîne de caractère ????!!!! --- oui parce que sinon '01' va être cast en 1 par exemple
	check (value >= '0' and value <= '255');

CREATE DOMAIN dom_prix as real
	check (value >= 0);

CREATE TABLE Segment (
	indIP integer primary key, -- (exemple:130.120.80)  --- ajout de la clé primaire
	nomSegment varchar(20) not null,-- varchar varie alors que char est statique
	etage integer
);

CREATE TABLE Salle (
	nSalle integer primary key, --- ajout de la clé primaire
	nomSalle varchar(20) not null,
	nbPoste integer,
	indIP integer
);

CREATE TABLE Poste (
	nPoste integer primary key, --- ajout de la clé primaire
	nomPoste varchar(20) not null,
	indIP integer,
	ad dom_ad, --dernier groupe de chiffres IP(exemple:11) --- pourquoi not null?
	typePoste varchar(4), --(UNIX,TX,PCWS,PCNT)
	nSalle integer
);

CREATE TABLE Logiciel (
	nLog integer primary key, --- ajout de la clé primaire
	nomLog varchar(20),
	dateAch date,
	version varchar(20),
	typeLog varchar(4), --(UNIX,TX,PCWS,PCNT)
	prix dom_prix
);

CREATE TABLE Installer (
	numIns serial primary key, --- ajout de la clé primaire
	nPoste integer,
	nLog integer,
	dateIns timestamp not null DEFAULT CURRENT_TIMESTAMP, --- dateIns est un Timestamp
	delai integer
);

CREATE TABLE Types (
	typeLP varchar(4) primary key, --- ajout de la clé primaire
	nomType varchar(20)
);

COMMIT;



















