drop database TER;
CREATE database TER;
USE TER;


drop table if exists Block_FACULTATIVE;
drop table if exists Block_OPTIONNELLE;
drop table if exists Block_OBLIGATOIRE;
drop table if exists UE;
drop table if exists PST;
drop table if exists PARCOURS;
drop table if exists ETUDIANT;
drop table if exists UTILISATEUR;



CREATE TABLE UTILISATEUR(
	Num_Id int (20),
	U_Nom varchar(20),
	U_Prenom varchar (10),
	CONSTRAINT UTILISATEUR_PK PRIMARY KEY(Num_Id));

CREATE TABLE PARCOURS(
	Code_PARCOURS int(20),
	Nom_PARCOURS varchar(20),
	Annee int (4),
	Nom_Responsable_PARCOURS_1 varchar(20),
	Nom_Responsable_PARCOURS_2 varchar(20),
	CONSTRAINT PARCOURS_PK PRIMARY KEY(Code_PARCOURS));

CREATE TABLE ETUDIANT(
	Num_ETUDIANT int (20),
	Num_INE_ETUDIANT varchar (20),
	Nom_ETUDIANT varchar(20),
	Prenom_ETUDIANT varchar (10),
	Date_Naissances_ETUDIANT date,
	Telephone_Portable_ETUDIANT int (15),
	Email_Personnel_ETUDIANT varchar (30),
	Email_Institutionnel_ETUDIANT varchar (30),
	Password_ETUDIANT varchar (20),
	Adresse_ETUDIANT varchar (50),
	Parcours_ETUDIANT int (20),
	CONSTRAINT ETUDIANT_PK PRIMARY KEY(Num_ETUDIANT),
	CONSTRAINT ETUDIANT_FK1 FOREIGN KEY (Num_ETUDIANT) REFERENCES UTILISATEUR(Num_Id),
	CONSTRAINT ETUDIANT_FK2 FOREIGN KEY (Parcours_ETUDIANT) REFERENCES PARCOURS(Code_PARCOURS));

CREATE TABLE PST(
	Code_PST varchar(20),
	Nom_PST varchar(20),
	SEMESTRE_PST int(1),
	Annee_PST varchar (10),
	Parcours_PST int (20),
	CONSTRAINT PST_PK PRIMARY KEY(Code_PST),
	CONSTRAINT PST_FK2 FOREIGN KEY (Parcours_PST) REFERENCES PARCOURS(Code_PARCOURS),
	CONSTRAINT PST_CH CHECK (SEMESTRE_PST in (1,2)));


CREATE TABLE UE(
	Code_UE varchar(20),
	Nom_UE varchar(20),
	Etat varchar (20),
	Nombre_ECTS int(2),
	Nom_Responsable_UE_1 varchar(20),
	Nom_Responsable_UE_2 varchar(20),
	CONSTRAINT UE_PK PRIMARY KEY(Code_UE),
	CONSTRAINT Etat_CH CHECK (Etat in ('ouvert','fermee')));

CREATE TABLE Block_OBLIGATOIRE(
	Code_Block_OBLIGATOIRE varchar (20),
	Code_PST_OBLIGATOIRE varchar (20),
	Nombre_ECTS int(20),
	CONSTRAINT Block_OBLIGATOIRE_PK PRIMARY KEY(Code_Block_OBLIGATOIRE),
	CONSTRAINT Block_OBLIGATOIRE_FK1 FOREIGN KEY (Code_PST_OBLIGATOIRE) REFERENCES PST(Code_PST));

CREATE TABLE UE_Block_OBLIGATOIRE(
	Code_UE_Block_OBLIGATOIRE varchar (20),
	Code_UE_OBLIGATOIRE varchar(20),
	CONSTRAINT UE_Block_OBLIGATOIRE_PK PRIMARY KEY(Code_UE_Block_OBLIGATOIRE,Code_UE_OBLIGATOIRE),
	CONSTRAINT UE_Block_OBLIGATOIRE_FK1 FOREIGN KEY (Code_UE_Block_OBLIGATOIRE) REFERENCES Block_OBLIGATOIRE(Code_Block_OBLIGATOIRE),
	CONSTRAINT UE_Block_OBLIGATOIRE_FK2 FOREIGN KEY (Code_UE_OBLIGATOIRE) REFERENCES UE(Code_UE));





CREATE TABLE Block_OPTIONNEL(
	Code_Block_OPTIONNEL varchar (20),
	Code_PST_OPTIONNEL varchar (20),
	Nombre_ECTS int(20),
	CONSTRAINT Block_OPTIONNEL_PK PRIMARY KEY(Code_Block_OPTIONNEL),
	CONSTRAINT Block_OPTIONNEL_FK1 FOREIGN KEY (Code_PST_OPTIONNEL) REFERENCES PST(Code_PST));

CREATE TABLE UE_Block_OPTIONNEL(
	Code_UE_Block_OPTIONNEL varchar (20),
	Code_UE_OPTIONNELLE varchar(20),
	CONSTRAINT UE_Block_OPTIONNEL_PK PRIMARY KEY(Code_UE_Block_OPTIONNEL,Code_UE_OPTIONNELLE),
	CONSTRAINT UE_Block_OPTIONNEL_FK1 FOREIGN KEY (Code_UE_Block_OPTIONNEL) REFERENCES Block_OPTIONNEL(Code_Block_OPTIONNEL),
	CONSTRAINT UE_Block_OPTIONNEL_FK2 FOREIGN KEY (Code_UE_OPTIONNELLE) REFERENCES UE(Code_UE));



CREATE TABLE Block_FACULTATIF(
	Code_Block_FACULTATIF varchar (20),
	Code_PST_FACULTATIF varchar (20),
	Nombre_ECTS int(20),
	CONSTRAINT Block_FACULTATIF_PK PRIMARY KEY(Code_Block_FACULTATIF),
	CONSTRAINT Block_FACULTATIF_FK1 FOREIGN KEY (Code_PST_FACULTATIF) REFERENCES PST(Code_PST));

CREATE TABLE UE_Block_FACULTATIF(
	Code_UE_Block_FACULTATIF varchar (20),
	Code_UE_FACULTATIVE varchar(20),
	CONSTRAINT UE_Block_FACULTATIF_PK PRIMARY KEY(Code_UE_Block_FACULTATIF,Code_UE_FACULTATIVE),
	CONSTRAINT UE_Block_FACULTATIF_FK1 FOREIGN KEY (Code_UE_Block_FACULTATIF) REFERENCES Block_FACULTATIF(Code_Block_FACULTATIF),
	CONSTRAINT UE_Block_FACULTATIF_FK2 FOREIGN KEY (Code_UE_FACULTATIVE) REFERENCES UE(Code_UE));





INSERT INTO UTILISATEUR VALUES (21511042,"Ba","Khaled");
INSERT INTO UTILISATEUR VALUES (20112046,"Bonnabaud La Bruyere","Thierry");
INSERT INTO UTILISATEUR VALUES (20135784,"Boualem","Ibrahim");
INSERT INTO UTILISATEUR VALUES (20114463,"Boulakhlas","Salim");
INSERT INTO UTILISATEUR VALUES (20136901,"Challal","Kamelia");
INSERT INTO UTILISATEUR VALUES (21513892,"Chopelet","Julien");
INSERT INTO UTILISATEUR VALUES (21218987,"Dechache","Nesrine");
INSERT INTO UTILISATEUR VALUES (21511611,"Djaber","Mohammed");
INSERT INTO UTILISATEUR VALUES (21511730,"Haddad","Djazia");
INSERT INTO UTILISATEUR VALUES (21512320,"Haddadj","Abdelkarim");
INSERT INTO UTILISATEUR VALUES (20147210,"Hammouche","Yamina");
INSERT INTO UTILISATEUR VALUES (20073264,"Hammoudi","Alaaeddine");
INSERT INTO UTILISATEUR VALUES (21512322,"Houadj","Mohamed");
INSERT INTO UTILISATEUR VALUES (21514375,"Ibrahim","Waseem");
INSERT INTO UTILISATEUR VALUES (21513620,"walid","Khetab");
INSERT INTO UTILISATEUR VALUES (21514421,"Mekhoukhe","Siham");
INSERT INTO UTILISATEUR VALUES (21505827,"Mokdad","Samia");
INSERT INTO UTILISATEUR VALUES (20909384,"Ndiaye","Bara");
INSERT INTO UTILISATEUR VALUES (20113671,"Sarajian","Meysam");
INSERT INTO UTILISATEUR VALUES (21307389,"Shih","Yu-Ju");
INSERT INTO UTILISATEUR VALUES (21511625,"Sodjinou","Agossou");
INSERT INTO UTILISATEUR VALUES (21003952,"Yan","Shi");


INSERT INTO PARCOURS VALUES (1,"IPS","2015/2016","Pompidor",null);


INSERT INTO ETUDIANT VALUES (21511042,"0","Ba","Khaled","0000-00-00",0,"khaled.ba@etu.umontpellier.fr","khaled.ba@etu.umontpellier.fr","123KB","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (20112046,"0","Bonnabaud La Bruyere","Thierry","0000-00-00",0,"thierry.bonnabaud-la-bruyere@etu.umontpellier.fr","thierry.bonnabaud-la-bruyere@etu.umontpellier.fr","123TB","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (20135784,"0","Boualem","Ibrahim","0000-00-00",0,"ibrahim.boualem@etu.umontpellier.fr","ibrahim.boualem@etu.umontpellier.fr","123IB","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (20114463,"0","Boulakhlas","Salim","0000-00-00",0,"salim.boulakhlas@etu.umontpellier.fr","salim.boulakhlas@etu.umontpellier.fr","123SB","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (20136901,"0","Challal","Kamelia","0000-00-00",0,"kamelia.challal@etu.umontpellier.fr","kamelia.challal@etu.umontpellier.fr","123KC","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21513892,"0","Chopelet","Julien","0000-00-00",0,"julien.chopelet@etu.umontpellier.fr","julien.chopelet@etu.umontpellier.fr","123JC","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21218987,"0","Dechache","Nesrine","0000-00-00",0,"nesrine.dechache@etu.umontpellier.fr","nesrine.dechache@etu.umontpellier.fr","123ND","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21511611,"0","Djaber","Mohammed","0000-00-00",0,"mohammed.djaber@etu.umontpellier.fr","mohammed.djaber@etu.umontpellier.fr","123MD","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21511730,"0","Haddad","Djazia","0000-00-00",0,"djazia.haddad@etu.umontpellier.fr","djazia.haddad@etu.umontpellier.fr","123DH","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21512320,"0","Haddadj","Abdelkarim","0000-00-00",0,"abdelkarim.haddadj@etu.umontpellier.fr","abdelkarim.haddadj@etu.umontpellier.fr","123AH","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (20147210,"0","Hammouche","Yamina","0000-00-00",0,"yamina.hammouche@etu.umontpellier.fr","yamina.hammouche@etu.umontpellier.fr","123YH","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (20073264,"0","Hammoudi","Alaaeddine","0000-00-00",0,"alaaeddine.hammoudi@etu.umontpellier.fr","alaaeddine.hammoudi@etu.umontpellier.fr","123AH","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21512322,"0","Houadj","Mohamed","0000-00-00",0,"mohamed.houadj@etu.umontpellier.fr","mohamed.houadj@etu.umontpellier.fr","123NH","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21514375,"0","Ibrahim","Waseem","0000-00-00",0,"Ibrahim,waseem.ibrahi@etu.umontpellier.fr","Ibrahim,waseem.ibrahi@etu.umontpellier.fr","123WI","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21513620,"0","walid","Khetab","0000-00-00",0,"walid.khetab@etu.umontpellier.fr","walid.khetab@etu.umontpellier.fr","123KW","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21514421,"0","Mekhoukhe","Siham","0000-00-00",0,"siham.mekhoukhetu.umontpellier.fr","siham.mekhoukhetu.umontpellier.fr","123X","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21505827,"0","Mokdad","Samia","0000-00-00",0,"samia.mokdad@etu.umontpellier.fr","samia.mokdad@etu.umontpellier.fr","123SM","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (20909384,"0","Ndiaye","Bara","0000-00-00",0,"bara.ndiaye@etu.umontpellier.fr","bara.ndiaye@etu.umontpellier.fr","123BN","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (20113671,"0","Sarajian","Meysam","0000-00-00",0,"meysam.sarajian@etu.umontpellier.fr","meysam.sarajian@etu.umontpellier.fr","123MS","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21307389,"0","Shih","Yu-Ju","0000-00-00",0,"yu-ju.shih@etu.umontpellier.fr","yu-ju.shih@etu.umontpellier.fr","123YS","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21511625,"0","Sodjinou","Agossou","0000-00-00",0,"agossou.sodjinou@etu.umontpellier.fr","agossou.sodjinou@etu.umontpellier.fr","123AS","MONTPELLIER",1);
INSERT INTO ETUDIANT VALUES (21003952,"0","Yan","Shi","0000-00-00",0,"shi.yan@etu.umontpellier.fr","shi.yan@etu.umontpellier.fr","123SY","MONTPELLIER",1);




INSERT INTO PST VALUES ("HM1INE_S1","PST_IPS_S1",1,"2015/2016",1);
INSERT INTO PST VALUES ("HM1INE_S2","PST_IPS_S2",2,"2015/2016",1);
INSERT INTO PST VALUES ("HM2INE_S1","PST_IPS_S1",1,"2015/2016",1);
INSERT INTO PST VALUES ("HM2INE_S2","PST_IPS_S2",2,"2015/2016",1);




INSERT INTO UE VALUES ("HMIN114M","Prolégomènes	algorithmiques","ouvert",0,"A","B");
INSERT INTO UE VALUES ("HMIN111M","Programmation","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN112M","Système d'information et de bases de données","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN113M","Système","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN115M","Technologies du web","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN116","Réseaux","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN101L","Anglais","ouvert",5,"A","B");

INSERT INTO UE VALUES ("HMIN215","Structures de données","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN216M","Analyse et conduite de projet","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN217","TER","ouvert",10,"A","B");
INSERT INTO UE VALUES ("HMIN218","Interface homme-machine","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN219","Réseaux avancés","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN211","Analyse et traitement des images","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN212","Modélisation et programmation 3D","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN213","Algorithmes d'exploration et de mouvement","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN214","Algorithmes géométriques et géométrie discrète","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN220M","Bases de données spatiales","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN221M","Calculabilité","ouvert",5,"A","B");

INSERT INTO UE VALUES ("HMIN325M","Technologies avancées du web","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN329","Algorithmique	et complexité","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN327","Programmation	avancée","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN324M","Logiciel embarqué","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN326M","Fouille de données","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN328","Administration de bases de données","ouvert",5,"A","B");

INSERT INTO UE VALUES ("HMIN402","Enjeux juridiques et déontologiques de l'informatique","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN403","Stage industriel","ouvert",25,"A","B");
INSERT INTO UE VALUES ("HMIN401","Étude bibliographique","ouvert",5,"A","B");
INSERT INTO UE VALUES ("HMIN404","Stage académique","ouvert",20,"A","B");


INSERT INTO Block_OBLIGATOIRE VALUES("ob_S1_M1","HM1INE_S1",30);

INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M1","HMIN111M");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M1","HMIN112M");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M1","HMIN113M");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M1","HMIN114M");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M1","HMIN115M");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M1","HMIN116");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M1","HMIN101L");


INSERT INTO Block_OBLIGATOIRE VALUES("ob_S2_M1","HM1INE_S2",20);

INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S2_M1","HMIN215");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S2_M1","HMIN216M");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S2_M1","HMIN217");


INSERT INTO Block_OBLIGATOIRE VALUES("ob_S1_M2","HM2INE_S1",15);

INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M2","HMIN325M");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M2","HMIN329");
INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S1_M2","HMIN327");


INSERT INTO Block_OBLIGATOIRE VALUES("ob_S2_M2","HM2INE_S2",5);

INSERT INTO UE_Block_OBLIGATOIRE VALUES("ob_S2_M2","HMIN402");



INSERT INTO Block_OPTIONNEL VALUES("opt_S1_M1","HM1INE_S1",0);


INSERT INTO Block_OPTIONNEL VALUES("opt_S2_M1","HM1INE_S2",10);

INSERT INTO UE_Block_OPTIONNEL VALUES("opt_S2_M1","HMIN218");
INSERT INTO UE_Block_OPTIONNEL VALUES("opt_S2_M1","HMIN219");


INSERT INTO Block_OPTIONNEL VALUES("opt_S1_M2","HM2INE_S1",15);

INSERT INTO UE_Block_OPTIONNEL VALUES("opt_S1_M2","HMIN324M");
INSERT INTO UE_Block_OPTIONNEL VALUES("opt_S1_M2","HMIN326M");
INSERT INTO UE_Block_OPTIONNEL VALUES("opt_S1_M2","HMIN328");


INSERT INTO Block_OPTIONNEL VALUES("opt_S2_M2","HM2INE_S2",25);

INSERT INTO UE_Block_OPTIONNEL VALUES("opt_S2_M2","HMIN403");
INSERT INTO UE_Block_OPTIONNEL VALUES("opt_S2_M2","HMIN401");
INSERT INTO UE_Block_OPTIONNEL VALUES("opt_S2_M2","HMIN404");
