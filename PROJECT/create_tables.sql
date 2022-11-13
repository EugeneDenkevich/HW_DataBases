DROP DATABASE IF EXISTS grocery_store;
CREATE DATABASE grocery_store;
USE grocery_store;

CREATE TABLE suplier (
id_sup INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sup_name VARCHAR(100)
)
ENGINE = InnoDB;

CREATE TABLE department (
id_dep INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(100) NOT NULL
)
ENGINE = InnoDB;

CREATE TABLE product (
id_product INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
prod_name VARCHAR(100),
price DECIMAL(10,2),
quantity INT UNSIGNED,
added TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
ENGINE = InnoDB;

CREATE TABLE product_additional (
id_prod_add INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
prod_id INT UNIQUE,
sup_id INT,
dep_id INT,
FOREIGN KEY (prod_id) REFERENCES product (id_product),
FOREIGN KEY (sup_id) REFERENCES suplier (id_sup),
FOREIGN KEY (dep_id) REFERENCES department (id_dep)
)
ENGINE = InnoDB;

CREATE TABLE client (
id_client INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(100),
lastname VARCHAR(100),
discount_percent INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
ENGINE = InnoDB;

CREATE TABLE purchase (
id_purchase INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
client_id INT,
product_id INT,
purchase_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (client_id) REFERENCES client (id_client) ON DELETE CASCADE,
FOREIGN KEY (product_id) REFERENCES product (id_product) ON DELETE CASCADE
)
ENGINE = InnoDB;

CREATE TABLE client_additional_info (
id_info INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
client_id INT UNIQUE,
email VARCHAR(100) UNIQUE,
birthday DATETIME,
eyes_color VARCHAR(100),
FOREIGN KEY (client_id) REFERENCES client (id_client) ON DELETE CASCADE
)
ENGINE = InnoDB;


CREATE TABLE deleted_client (
firstname VARCHAR(100),
lastname VARCHAR(100),
deleted_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)
ENGINE = InnoDB;

