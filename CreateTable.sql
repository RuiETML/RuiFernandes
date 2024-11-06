CREATE TABLE JOUEURS(
   joueurs_id INT,
   pseudo VARCHAR(20),
   nb_points INT,
   PRIMARY KEY(joueurs_id)
);

CREATE TABLE ARMES(
   armes_id INT,
   nom VARCHAR(20),
   description VARCHAR(60),
   prix INT,
   force_armes INT,
   nb_max_coups INT,
   PRIMARY KEY(armes_id)
);

CREATE TABLE COMMANDE_ACHAT_ARMES(
   commande_id INT,
   numero_commande INT,
   date_commande DATE,
   joueurs_id INT NOT NULL,
   PRIMARY KEY(commande_id),
   UNIQUE(numero_commande),
   FOREIGN KEY(joueurs_id) REFERENCES JOUEURS(joueurs_id)
);

CREATE TABLE posséder(
   joueurs_id INT,
   armes_id INT,
   nb_coups_restants INT,
   PRIMARY KEY(joueurs_id, armes_id),
   FOREIGN KEY(joueurs_id) REFERENCES JOUEURS(joueurs_id),
   FOREIGN KEY(armes_id) REFERENCES ARMES(armes_id)
);

CREATE TABLE contenir(
   armes_id INT,
   commande_id INT,
   quantite_armes INT,
   PRIMARY KEY(armes_id, commande_id),
   FOREIGN KEY(armes_id) REFERENCES ARMES(armes_id),
   FOREIGN KEY(commande_id) REFERENCES COMMANDE_ACHAT_ARMES(commande_id)
);
