use biblio_sihame;

insert into Auteur (NumAuteur, Nom, Adresse) values
('H', 'Hakim', 'Rue 123'),
('M', 'Moujarrib', 'Rue 456'),
('N', 'Neferiti', 'Rue 789'),
('R', 'Ramsis', 'Rue 101'),
('T', 'Tafih', 'RUE 102');

insert into Theme (NumTheme, IntituleTheme) values
('Eco', 'Economie'),
('Info', 'Informatique'),
('Math', 'Mathématiques'),
('Div', 'Divers');

insert into Editeur (NumEditeur, Nom, Adresse) values 
('DAO', 'Dar Al-Oujoum', 'rue abc'),
('NP', 'Nul Part', 'Av DEF'),
('PLB', 'Pour les Bêtes', 'RUE GHI');

insert into Etudiant (NumEtudiant, Nom, Prenom, Age, Tel, Ville) VALUES
(50, 'Kaslani', 'Kassoul', 28, '065555555', 'Tanger'),
(51, 'Kaslani', 'Kassoula', 27, '065555556', 'Tanger'),
(100, 'Abbassi', 'Abbass', 23, '070000607', 'Tanger'),
(101, 'Kaddouri', 'Kaddour', 24, '077777700', 'Chefchaouen'),
(102, 'Jallouli', 'Jalloul', 23, '066666660', 'Tétouan'),
(103, 'Ayyachi', 'Aicha', 22, NULL, 'Tétouan'),
(113, 'Slaoui', 'Salwa', 21, '060000001', 'Tanger'),
(202, 'Khaldouni', 'Khalid', 22, '060000002', 'Tanger'),
(309, 'Karimi', 'Karim', 20, '066600005', 'Casa'),
(310, 'Karimi', 'Karima', 20, NULL, 'Casa'),
(567, 'Moussaoui', 'Moussa', 21, '050070070', 'Tanger'),
(580, 'Moussi', 'Moussa', 22, NULL, 'Casa'),
(998, 'Moujtahida', 'Moujidda', 21, NULL, 'Tanger'),
(999, 'Moujtahid', 'Moujidd', 21, NULL, 'Tanger');

alter table Livre
modify  DateEdition date;

alter table Livre
modify  Titre varchar(100) not null;

insert into Livre (NumLivre, Titre, NumAuteur, NumEditeur, NumTheme, DateEdition) values
('BD1', 'Comment avoir 20 en BD', 'R', 'NP', 'Info', '2015-01-01'),
('BD2', 'Tout sur les BD', 'N', 'NP', 'Info', '2014-12-01'),
('BD3', 'Maitriser les BD', 'R', 'NP', 'Info', '2014-07-07'),
('BD4', 'SGBD Relationnels', 'R', 'DAO', 'Info', '2014-01-01'),
('BD5', 'SI et BD', 'N', 'DAO', 'Info', '2003-02-04'),
('BD6', 'Les BD : Pour les nuls', 'R', 'NP', 'Info', '2014-01-01'),
('ECO1', 'L''économie du Maroc en l\'an 3050', 'M', 'DAO', 'Eco', '2015-04-01'),
('Math1', 'Algèbre', 'H', 'NP', 'Math', '2014-09-02'),
('Math2', 'Analyse', 'H', 'NP', 'Math', '2014-08-02'),
('Math3', 'Algèbre linéaire', 'H', 'DAO', 'Math', '2015-08-02'),
('Math4', 'Aimer les Maths', 'M', 'NP', 'Math', '2014-08-04'),
('SE1', 'Systèmes d\'exploitation', 'R', 'NP', 'Info', '2003-08-06'),
('SE2', 'Maitriser UNIX', 'R', 'DAO', 'Info', '2002-10-02'),
('SE3', 'Tout sur les SE', 'N', 'NP', 'Info', '2001-08-07'),
('TW1', 'Histoire', 'T', 'PLB', 'Div', NULL),
('TW2', 'Personnes fameuses', 'T', 'PLB', 'Div', NULL),
('TW3', 'Comment devenir un bon joueur en 5 jours et sans coach', 'T', 'PLB', 'Div', NULL);

INSERT INTO Pret (NumEtudiant, NumLivre, DatePret, Rendu, DateRetour) VALUES
(50, 'BD1', '2024-05-01', FALSE, NULL),
(51, 'ECO1', '2024-04-15', TRUE, '2024-05-01'),
(100, 'Math1', '2024-03-10', FALSE, NULL),
(101, 'BD2', '2024-02-20', TRUE, '2024-03-01'),
(102, 'SE1', '2024-01-15', TRUE, '2024-02-01'),
(103, 'TW1', '2024-05-10', FALSE, NULL),  -- Prêt non rendu
(202, 'BD3', '2024-04-20', FALSE, NULL);  -- Prêt non rendu


SELECT Nom, Prenom, Age, Ville 
FROM Etudiant 
WHERE Age > 21 
ORDER BY Nom ASC, Age DESC;

SELECT 
    A.Nom AS AuteurNom, 
    L.Titre AS TitreLivre, 
    P.DatePret 
FROM 
    Auteur A
JOIN 
    Livre L ON A.NumAuteur = L.NumAuteur
JOIN 
    Pret P ON L.NumLivre = P.NumLivre
WHERE 
    P.Rendu = FALSE  -- ou P.Rendu = 0, selon comment le booléen est stocké dans votre base de données
ORDER BY 
    A.Nom ASC, 
    P.DatePret DESC;
    
-- RequêteLDD2
CREATE TABLE Professeur (
    CIN numeric primary key,
    Nom varchar(20) not null ,
    Prénom varchar(20) not null,
    Adresse text
);

-- RequêteLDD3
alter table Professeur
add constraint Unique_Nom_Prenom unique (Nom, Prénom);

-- RequêteLDD4
alter table Professeur
add Email varchar(10);


-- RequêteLDD5
alter table  Professeur
 modify Email varchar(50);

-- RequêteLDD6
alter table Professeur
drop column Email;

-- RequêteLDD7
drop table Professeur;




-- Requête LMD1
insert into Etudiant (NumEtudiant, Nom, Prenom, Age, Tel, Ville) values
(1001, 'Hammadi', 'Hamada', 25, '061111111', 'Casa'),
(1002, 'Tahiri', 'Tahir', 24, '066666600', 'Tanger');

-- Requête LMD2
insert into Etudiant (NumEtudiant, Nom, Prenom, Age, Ville) values 
(1003, 'Sallami', 'Salma', 26, 'Tanger'),
(1004, 'Mimouni', 'Mimoun', 23, 'Casa');

-- Requête LMD3
update Etudiant e
join (select NumEtudiant from Etudiant where Ville = 'Casa') as sub
ON e.NumEtudiant = sub.NumEtudiant
SET e.Ville = 'Casablanca';



-- Requête LMD4
update Etudiant
set Age = Age + 1
where NumEtudiant > 1000;

#khasna nrunnewha 3la hssab rapport had shi kaml 
-- Requête LMD5
delete from Etudiant
where NumEtudiant > 1000;

use Biblio_Sihame;
-- Requête 7
select Nom, Prenom, Ville as Adresse
from  Etudiant
where  Nom = 'Moujtahid';

-- Requête 8
select Titre
from Livre
where NumAuteur = 'R';

-- Requête 9
select L.Titre
from Livre L
join Auteur A on L.NumAuteur = A.NumAuteur
where A.Nom = 'Ramsis';

-- Requête 10
select NumAuteur
from Livre
where Titre = 'Comment avoir 20 en BD';

-- Requête 11
select A.Nom, A.Adresse
from Livre L
join Auteur A on L.NumAuteur = A.NumAuteur
where L.Titre = 'Comment avoir 20 en BD';

-- Requête 12
select L.Titre
from Livre L
join Editeur E on L.NumEditeur = E.NumEditeur
where E.Nom = 'Nul Part' and L.NumAuteur = (select NumAuteur from Auteur where Nom = 'Ramsis');

-- Requête 13
select L.Titre
from Livre L
join Auteur A on L.NumAuteur = A.NumAuteur
where A.Nom in ('Ramsis', 'Neferiti');

-- Requête 14
select distinct T.IntituleTheme
from Livre L
join Theme T on L.NumTheme = T.NumTheme
join Editeur E on L.NumEditeur = E.NumEditeur
where E.Nom = 'Nul Part';

-- Requête 15
select T.IntituleTheme, E.Nom as Editeur
from Livre L
join Theme T on L.NumTheme = T.NumTheme
join Editeur E on L.NumEditeur = E.NumEditeur;

-- Requête 16
select L.Titre
from Livre L
join Pret P on L.NumLivre = P.NumLivre
where L.NumAuteur = (select NumAuteur from Auteur where Nom = 'Ramsis') and P.NumEtudiant = (select NumEtudiant from Etudiant where Nom = 'Moujtahid');

-- Requête 17
select L.Titre
from Livre L
left join  Pret P on L.NumLivre = P.NumLivre
where P.NumLivre is null;

-- Requête 18
select L.Titre
from Livre L
left join Pret P on L.NumLivre = P.NumLivre
where L.NumAuteur = (select NumAuteur from Auteur where Nom = 'Ramsis') and P.NumLivre is null;

-- Requête 19
select L.Titre, T.IntituleTheme
from Livre L
join Pret P on L.NumLivre = P.NumLivre
join Theme T on L.NumTheme = T.NumTheme
where P.NumEtudiant in (select NumEtudiant from Etudiant where Nom like '%Moujtahid%');

-- Requête 20
select L.Titre, T.IntituleTheme, E.Nom as EditeurNom
from Livre L
join Pret P on L.NumLivre = P.NumLivre
join Theme T on L.NumTheme = T.NumTheme
join Editeur E on L.NumEditeur = E.NumEditeur
where P.NumEtudiant in (
    select NumEtudiant
    from Etudiant
    where Nom like '%Moujtahid%'
);

-- Requête 21
select distinct T.IntituleTheme
from Theme T
where not exists (
    select 1
    from Pret P
    join Livre L on P.NumLivre = L.NumLivre
    where L.NumTheme = T.NumTheme and P.NumEtudiant = 999
);

-- Requête 22
select L.Titre, P.DatePret
from Pret P
join Livre L on P.NumLivre = L.NumLivre
join Etudiant E on P.NumEtudiant = E.NumEtudiant
where E.Nom like '%Kaslani%';

-- Requête 23
select L.Titre, E.Nom as Emprunteur, P.DatePret
from Pret P
join Livre L on P.NumLivre = L.NumLivre
join Etudiant E on P.NumEtudiant = E.NumEtudiant
where P.Rendu = false
order by  P.DatePret asc
limit 1;

-- Requête 24
select L.Titre, A.Nom as AuteurNom, E.Nom as EditeurNom, T.IntituleTheme
from Livre L
join Auteur A on L.NumAuteur = A.NumAuteur
join Editeur E on L.NumEditeur = E.NumEditeur
join Theme T on L.NumTheme = T.NumTheme;


-- Requête 25
select L.Titre
from Pret P
join Livre L on P.NumLivre = L.NumLivre
where P.DatePret between '2015-01-01' and '2015-05-31';


-- Requête 26
select Titre
from Livre
where Titre like '%BD%';

-- Requête 27
select A.Nom, count(L.NumLivre) as NombreLivres
from Auteur A
join Livre L on A.NumAuteur = L.NumAuteur
group by A.Nom;

-- Requête 28
select Ville, avg(Age) as AgeMoyen
from Etudiant
group by  Ville;

-- Requête 29
select L.Titre, count(*) as NombreEmprunts
from Pret P
join Livre L on P.NumLivre = L.NumLivre
group by  L.Titre
having count(*) > 3;

-- Requête 30
select L.Titre, count(*) AS NombreEmprunts
from Pret P
join Livre L on P.NumLivre = L.NumLivre
where P.Rendu = false
group by  L.Titre
having count(*) > 3;

-- Requête 31
select L.Titre, count(*) as NombreEmprunts
from Pret P
join Livre L on P.NumLivre = L.NumLivre
where L.NumAuteur = (select NumAuteur from Auteur where Nom = 'Ramsis')
group by  L.Titre
having count(*) > 4;

INSERT INTO Pret (NumEtudiant, NumLivre, DatePret, Rendu, DateRetour) VALUES
(100, 'BD1', '2015-01-10', TRUE, '2015-01-20'),
(100, 'BD2', '2015-02-15', TRUE, '2015-02-25'),
(100, 'Math1', '2015-03-10', TRUE, '2015-03-20'),
(100, 'SE1', '2015-04-15', TRUE, '2015-04-25'),
(102, 'TW1', '2015-01-10', TRUE, '2015-01-20'),
(102, 'BD3', '2015-02-15', TRUE, '2015-02-25'),
(102, 'ECO1', '2015-03-10', TRUE, '2015-03-20'),
(102, 'Math2', '2015-04-15', TRUE, '2015-04-25'),
(103, 'Math3', '2015-01-10', TRUE, '2015-01-20'),
(103, 'Math4', '2015-02-15', TRUE, '2015-02-25'),
(103, 'SE2', '2015-03-10', TRUE, '2015-03-20'),
(103, 'SE3', '2015-04-15', TRUE, '2015-04-25'),
(202, 'BD4', '2015-01-10', TRUE, '2015-01-20'),
(202, 'BD5', '2015-02-15', TRUE, '2015-02-25'),
(202, 'Math3', '2015-03-10', TRUE, '2015-03-20'),
(202, 'ECO1', '2015-04-15', TRUE, '2015-04-25');

-- Requête 32
select E.NumEtudiant, E.Nom, count(distinct P.NumLivre) as NombreLivres
from Pret P
join Etudiant E on P.NumEtudiant = E.NumEtudiant
where year(P.DatePret) = 2015 and E.Age < 23
group by  E.NumEtudiant, E.Nom
having count(distinct P.NumLivre) > 3;






