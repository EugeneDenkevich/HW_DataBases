DROP DATABASE IF EXISTS grocery_store2;
CREATE DATABASE grocery_store2;
USE grocery_store2;

CREATE TABLE category (
id_category INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
category_name VARCHAR(100)
);

CREATE TABLE product (
id_product INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
product_name VARCHAR(100),
price DECIMAL(10,2),
category_id INT,
FOREIGN KEY (category_id) REFERENCES category (id_category)
);

CREATE TABLE buyer (
id_buyer INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
firstname VARCHAR(100),
lastname VARCHAR(100)
);

CREATE TABLE purchase (
id_order INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
buyer_id INT,
product_id INT,
FOREIGN KEY (buyer_id) REFERENCES buyer (id_buyer),
FOREIGN KEY (product_id) REFERENCES product (id_product)
);





