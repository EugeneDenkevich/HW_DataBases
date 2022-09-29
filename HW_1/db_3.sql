-- You can copy all the code IN the shell AND press ENTER
-- (if you don't have the base named 'new' of course)

DROP DATABASE IF EXISTS new;
CREATE DATABASE new; USE new;

CREATE TABLE grocery_store (id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, name VARCHAR(20) NOT NULL, category VARCHAR(20), shop_address VARCHAR(50), suplier VARCHAR(20), placement_date DATETIME NOT NULL);
INSERT INTO grocery_store (id, name, category, shop_address, suplier, placement_date) VALUES (1, 'APPLE', 'FUITS', 'Leinna 1', 'Fruit-Company', '2022-05-15 08:22:23');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('POTATOE', 'VEGETABLE', 'Kozlova 5', 'Vegetable-Company', '2022-06-19 12:23:01');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('PEAR', 'FUITS', 'Leinna 1', 'Fruit-Company', '2022-05-15 08:27:18');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('CABBAGE', 'VEGETABLE', 'Ybileinaya 8', 'Vegetable-Company', '2022-08-22 09:23:11');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('BANANA', 'FUITS', 'Leinna 1', 'Fruit-Company', '2022-05-15 08:54:33');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('BEETROOT', 'VEGETABLE', 'Ybileinaya 8', 'Vegetable-Company', '2022-05-15 08:22:23');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('GARLIC', 'VEGETABLE', 'Ybileinaya 8', 'Vegetable-Company', '2022-08-22 11:51:12');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('MILK', 'DAIRY', 'Kozlova 5', 'Diary-Company', '2022-06-19 12:28:51');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('ONION', 'FUITS', 'Kozlova 5', 'Vegetable-Company', '2022-06-19 16:19:08');
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date) VALUES ('CHEESE', 'DAIRY', 'Leinna 1', 'Diary-Company', '2022-05-15 08:24:01');

SELECT  *
FROM grocery_store;