CREATE DATABASE Biblio_Sihame;
USE Biblio_Sihame;

CREATE TABLE Etudiant(
    NumEtudiant INT,
    Nom VARCHAR(30) NOT NULL,
    Prenom VARCHAR(30) NOT NULL,
    Age INT,
    Ville VARCHAR(20),
    Tel VARCHAR(20)
);

ALTER TABLE Etudiant
MODIFY Ville VARCHAR(30) NOT NULL;

ALTER TABLE Etudiant ADD CONSTRAINT pk PRIMARY KEY (NumEtudiant);

CREATE TABLE Livre(
    NumLivre VARCHAR(10) PRIMARY KEY,
    Titre VARCHAR(50) NOT NULL,
    NumAuteur VARCHAR(10) NOT NULL,
    NumEditeur VARCHAR(10) NOT NULL,
    NumTheme VARCHAR(10) NOT NULL,
    DateEdition DATE NOT NULL
);

CREATE TABLE Auteur(
    NumAuteur VARCHAR(10) PRIMARY KEY,
    Nom VARCHAR(30) NOT NULL,
    Adresse VARCHAR(50)
);

CREATE TABLE Editeur(
    NumEditeur VARCHAR(10) PRIMARY KEY,
    Nom VARCHAR(30) NOT NULL,
    Adresse VARCHAR(50)
);

SHOW CREATE TABLE Auteur;
SHOW CREATE TABLE Editeur;

ALTER TABLE Livre
ADD CONSTRAINT FK_Livre_Auteur
FOREIGN KEY (NumAuteur) REFERENCES Auteur (NumAuteur)
ON DELETE CASCADE
ON UPDATE CASCADE;

ALTER TABLE Livre
ADD CONSTRAINT FK_Livre_Editeur
FOREIGN KEY (NumEditeur) REFERENCES Editeur (NumEditeur)
ON DELETE CASCADE
ON UPDATE CASCADE;

SELECT
    TABLE_NAME,
    CONSTRAINT_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'Livre' AND TABLE_SCHEMA = 'Biblio_Sihame';

CREATE TABLE Theme(
    NumTheme VARCHAR(10) PRIMARY KEY,
    IntituleTheme VARCHAR(20) NOT NULL
);

CREATE TABLE Pret(
    NumEtudiant INT,
    NumLivre VARCHAR(10),
    DatePret DATE,
    Rendu BOOLEAN DEFAULT FALSE,
    DateRetour DATE,
    PRIMARY KEY (NumEtudiant, NumLivre, DatePret),
    CONSTRAINT FK_Pret_Etudiant FOREIGN KEY (NumEtudiant) REFERENCES Etudiant (NumEtudiant),
    CONSTRAINT FK_Pret_Livre FOREIGN KEY (NumLivre) REFERENCES Livre (NumLivre)
);

ALTER TABLE Pret
ADD CONSTRAINT UQ_Pret_UniqueDate
UNIQUE (NumLivre, DatePret);

use Biblio_Sihame;
ALTER TABLE Pret
ADD CONSTRAINT UQ_NumLivre_Rendu_DateRetour unique  (NumLivre, Rendu, DateRetour);

show index from Pret;

use Biblio_Sihame;
alter table Etudiant
add constraint CHK_Age check (Age between 15 and 30);

alter table Pret
add constraint CHK_Pret_DateRetour
check (DateRetour is null or (DateRetour >= DatePret and Rendu));

insert into Etudiant (NumEtudiant, Nom, Prenom, Age, Ville, Tel) VALUES (1, 'alami', 'Sihame', 17, 'Tanger', '0676792260');
INSERT INTO Auteur (NumAuteur, Nom, Adresse) VALUES ('NumAuteurE', 'Nom de l’Auteur', 'Adresse de l’Auteur');

INSERT INTO Editeur (NumEditeur, Nom, Adresse) VALUES ('NumEditeur', 'Nom de l’Éditeur', 'Adresse de l’Éditeur');

INSERT INTO Livre (NumLivre, Titre, NumAuteur, NumEditeur, NumTheme, DateEdition) VALUES ('R11', 'Antigone', 'NumAuteurE', 'NumEditeur', 'NumTheme', '2020-01-01');



insert into Pret (NumEtudiant, NumLivre, DatePret, Rendu, DateRetour) values (1, 'S1', '2024-05-01', TRUE, '2024-04-30');
insert into Pret (NumEtudiant, NumLivre, DatePret, Rendu, DateRetour) values (1, 'R11','2024-03-01', TRUE, '2024-04-30');

insert into Theme(NumTheme, IntituleTheme) values ("T001", "roman");

