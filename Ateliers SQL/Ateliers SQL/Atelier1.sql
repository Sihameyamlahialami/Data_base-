
create Database TP_DSEF_yamlahialami;
USE TP_DSEF_yamlahialami;

create table Employes (
	NumEmploye int auto_increment primary key,
    Nom char(35),
    Prénom char(35),
    Tél char(13)
);

insert into Employes (NumEmploye, Nom ,Prénom ,  Tél) 
values
		(15 , "yamlahi" , "Sanae" , "0690088237"),
		(1 , "Radi" , "FAtima" , "0626799777");

USE TP_DSEF_yamlahialami;

create table Clients(
	RefClient char(20) primary key,
    NomSociete char(50),
    ville char (30),
    CodePostale char(10)
);

insert into Clients (RefClient, NomSociete , ville ,  CodePostale) 
values
		("C1" , "Acom" , "Tangier" , "9000"),
		("C2" , "B2C" , "CASA" , "40000"),
		("C3", "Tcom" , "Rabat" , "40000");


select * from Clients;



create table Commandes (
	RefCom int auto_increment primary key,
    Societe char(35),
    Date date,
    Somme decimal(10,2),
    TVA decimal(5,2)
);

ALTER table Commandes 
add foreign KEY (Societe) references Clients(RefClient);

Select constraint_name 
from information_schema.KEY_COLUMN_USAGE
where table_name = 'Commandes' and table_schema = 'TP_DSEF_yamlahialami';

USE TP_DSEF_yamlahialami;
alter table Commandes drop foreign key commandes_ibfk_1;

alter table Commandes 
add column RefClient char, 
add foreign key (RefClient) references Clients(RefClient);

alter table Commandes 
add constraint FK_CommandesClients foreign key (RefClient) references Clients(RefClient);

alter table Commandes drop foreign key FK_CommandesClients;

show create table Commandes;

select c.NomSociete, o.RefCom, o.Societe, o.Date, o.Somme, o.TVA
from Clients c
join Commandes o on c.RefClient = o.RefClient
order by c.NomSociete, o.Date;
