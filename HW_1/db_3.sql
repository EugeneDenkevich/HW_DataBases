-- You can copy all the code in the shell and press ENTER
-- (if you don't have the base named 'new' of course)

DROP DATABASE IF EXISTS new;
CREATE DATABASE new; USE new;

CREATE TABLE grocery_store (id INT AUTO_INCREMENT NOT NULL PRIMARY KEY, name VARCHAR(20) NOT NULL,
category VARCHAR(20), shop_address VARCHAR(50), suplier VARCHAR(20), placement_date DATETIME NOT NULL);
INSERT INTO grocery_store (name, category, shop_address, suplier, placement_date)
VALUES ('APPLE', 'FUITS', 'Leinna 1', 'Fruit-Company', '2022-05-15 08:22:23'),
('POTATOE', 'VEGETABLE', 'Kozlova 5', 'Vegetable-Company', '2022-06-19 12:23:01'),
('PEAR', 'FUITS', 'Leinna 1', 'Fruit-Company', '2022-05-15 08:27:18'),
('CABBAGE', 'VEGETABLE', 'Ybileinaya 8', 'Vegetable-Company', '2022-08-22 09:23:11'),
('BANANA', 'FUITS', 'Leinna 1', 'Fruit-Company', '2022-05-15 08:54:33'),
('BEETROOT', 'VEGETABLE', 'Ybileinaya 8', 'Vegetable-Company', '2022-05-15 08:22:23'),
('GARLIC', 'VEGETABLE', 'Ybileinaya 8', 'Vegetable-Company', '2022-08-22 11:51:12'),
('MILK', 'DAIRY', 'Kozlova 5', 'Diary-Company', '2022-06-19 12:28:51'),
('ONION', 'FUITS', 'Kozlova 5', 'Vegetable-Company', '2022-06-19 16:19:08'),
('CHEESE', 'DAIRY', 'Leinna 1', 'Diary-Company', '2022-05-15 08:24:01');

SELECT  *
FROM grocery_store;