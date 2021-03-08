-- Fichier references.sql
-- Alekesandra Maric (1049140) & Thomas Bui (20055825)
-- pour postgres

BEGIN transaction;

SET search_path to ParcInfo;

delete from Logiciel where typeLog not in (select typeLP from Types);
delete from Salle where indIP not in (select indIP from Segment);


ALTER TABLE Poste
	ADD CONSTRAINT poste_indIPfk
	foreign key (indIP) references segment(indIP);

ALTER TABLE Poste
	ADD CONSTRAINT poste_typePostefk
	foreign key (typePoste) references types(typeLP);

ALTER TABLE Poste
	ADD CONSTRAINT poste_nSallefk
	foreign key (nSalle) references salle(nSalle);

ALTER TABLE Installer
	ADD CONSTRAINT installer_nPostefk
	foreign key (nPoste) references poste(nPoste);

ALTER TABLE Installer
	ADD CONSTRAINT installer_nLogfk
	foreign key (nLog) references logiciel(nLog);

ALTER TABLE Logiciel 
	ADD CONSTRAINT logiciel_typeLogfk
	foreign key (typelog) references types(typeLP);

ALTER TABLE Salle 
	ADD CONSTRAINT salle_indIpfk
	foreign key (indIP) references segment(indIP); 

COMMIT;