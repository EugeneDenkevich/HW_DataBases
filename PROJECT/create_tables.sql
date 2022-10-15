DROP DATABASE IF EXISTS grocery_store;
CREATE DATABASE grocery_store;
USE grocery_store;

CREATE TABLE suplier (
id_sup INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sup_name VARCHAR(100)
);

CREATE TABLE prod_data (
id_data INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
prod_name VARCHAR(100),
price_kg DECIMAL(4,2),
price_pcs DECIMAL(4,2),
count_kg DECIMAL(6,2),
count_pcs DECIMAL(6,2),
sup_id INT,
FOREIGN KEY (sup_id) REFERENCES suplier (id_sup) 
);

CREATE TABLE product (
id_product INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_id INT UNIQUE,
added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (data_id) REFERENCES prod_data (id_data)
);

CREATE TABLE like_it (
id_like INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
user_id INT,
photo_id INT,
comment_id INT,
FOREIGN KEY (user_id) REFERENCES users (id_user),
FOREIGN KEY (photo_id) REFERENCES photos (id_photo),
FOREIGN KEY (comment_id) REFERENCES comments (id_comment),
UNIQUE (user_id, photo_id),
UNIQUE (user_id, comment_id)
);


