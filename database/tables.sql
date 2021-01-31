#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: utilisateur
#------------------------------------------------------------

CREATE TABLE utilisateur(
        id_utilisateur       Int  Auto_increment  NOT NULL ,
        pseudo_utilisateur   Varchar (50) NOT NULL ,
        mail_utilisateur     Varchar (200) NOT NULL ,
        password_utilisateur Varchar (200) NOT NULL
	,CONSTRAINT utilisateur_PK PRIMARY KEY (id_utilisateur)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: categorie
#------------------------------------------------------------

CREATE TABLE categorie(
        id_categorie  Int  Auto_increment  NOT NULL ,
        nom_categorie Varchar (255) NOT NULL
	,CONSTRAINT categorie_PK PRIMARY KEY (id_categorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: defi
#------------------------------------------------------------

CREATE TABLE defi(
        id_defi         Int  Auto_increment  NOT NULL ,
        contexte_defi   Text NOT NULL ,
        type_defi       TinyINT NOT NULL ,
        date_debut_defi Datetime NOT NULL ,
        date_fin_defi   Datetime NOT NULL ,
        id_categorie    Int NOT NULL
	,CONSTRAINT defi_PK PRIMARY KEY (id_defi)

	,CONSTRAINT defi_categorie_FK FOREIGN KEY (id_categorie) REFERENCES categorie(id_categorie)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: photo
#------------------------------------------------------------

CREATE TABLE photo(
        id_photo         Int  Auto_increment  NOT NULL ,
        likes_photo      Int NOT NULL ,
        path_photo       Varchar (255) NOT NULL ,
        date_publication Datetime NOT NULL ,
        id_utilisateur   Int NOT NULL ,
        id_defi          Int NOT NULL
	,CONSTRAINT photo_PK PRIMARY KEY (id_photo)

	,CONSTRAINT photo_utilisateur_FK FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
	,CONSTRAINT photo_defi0_FK FOREIGN KEY (id_defi) REFERENCES defi(id_defi)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: classement
#------------------------------------------------------------

CREATE TABLE classement(
        id_classement Int  Auto_increment  NOT NULL ,
        id_defi       Int NOT NULL
	,CONSTRAINT classement_PK PRIMARY KEY (id_classement)

	,CONSTRAINT classement_defi_FK FOREIGN KEY (id_defi) REFERENCES defi(id_defi)
	,CONSTRAINT classement_defi_AK UNIQUE (id_defi)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: effectuer
#------------------------------------------------------------

CREATE TABLE effectuer(
        id_utilisateur Int NOT NULL ,
        id_defi        Int NOT NULL
	,CONSTRAINT effectuer_PK PRIMARY KEY (id_utilisateur,id_defi)

	,CONSTRAINT effectuer_utilisateur_FK FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
	,CONSTRAINT effectuer_defi0_FK FOREIGN KEY (id_defi) REFERENCES defi(id_defi)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: appartenir
#------------------------------------------------------------

CREATE TABLE appartenir(
        id_utilisateur Int NOT NULL ,
        id_classement  Int NOT NULL ,
        rang           Int
	,CONSTRAINT appartenir_PK PRIMARY KEY (id_utilisateur,id_classement)

	,CONSTRAINT appartenir_utilisateur_FK FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
	,CONSTRAINT appartenir_classement0_FK FOREIGN KEY (id_classement) REFERENCES classement(id_classement)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: aimer
#------------------------------------------------------------

CREATE TABLE aimer(
        id_photo       Int NOT NULL ,
        id_utilisateur Int NOT NULL
	,CONSTRAINT aimer_PK PRIMARY KEY (id_photo,id_utilisateur)

	,CONSTRAINT aimer_photo_FK FOREIGN KEY (id_photo) REFERENCES photo(id_photo)
	,CONSTRAINT aimer_utilisateur0_FK FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur)
)ENGINE=InnoDB;

