create database payment;

CREATE TABLE Clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE Commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    montant_total float NOT NULL,
    statut VARCHAR(50) NOT NULL DEFAULT 'EN_ATTENTE',

   FOREIGN KEY (client_id)REFERENCES Clients(id)     
);

CREATE TABLE Paiements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id INT NOT NULL UNIQUE,
    type_paiement ENUM('CARTE', 'PAYPAL', 'VIREMENT') NOT NULL,
    montant float NOT NULL,
    statut VARCHAR(50) NOT NULL DEFAULT 'EN_ATTENTE',
    date_paiement date NULL,

    FOREIGN KEY (commande_id)REFERENCES Commandes(id)
);
