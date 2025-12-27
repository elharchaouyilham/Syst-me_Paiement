create database payment;

CREATE TABLE clients (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE commandes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    client_id INT NOT NULL,
    montantTotal float NOT NULL,
    status ENUM('Pending', 'Out for Delivery', 'Delivered') NOT NULL ,

   FOREIGN KEY (client_id)REFERENCES clients(id)     
);

CREATE TABLE  paiements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    commande_id int,
    montant float NOT NULL,
    status ENUM('Unpaid', 'Paid') NOT NULL ,
    date_paiement DATE DEFAULT CURRENT_DATE ,

    FOREIGN KEY (commande_id)REFERENCES commandes(id)
);

create table virements (
paiement_id INT ,
 rib VARCHAR (50),
 FOREIGN KEY (paiment_id)REFERENCES  paiements(id)
);
create table cartebancaires (
 paiement_id INT ,
 creditCardNumber int,
 FOREIGN KEY (paiment_id)REFERENCES  paiements(id)
);
create table paypals (
paiement_id INT ,
paymentEmail VARCHAR (20),
paymentPassword VARCHAR (30),
 FOREIGN KEY (paiment_id)REFERENCES  paiements(id)
);

