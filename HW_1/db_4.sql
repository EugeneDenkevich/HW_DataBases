-- You can copy all the code in the shell and press ENTER
-- (if you don't have the base named 'new' of course)

DROP DATABASE IF EXISTS new;
CREATE DATABASE new;
USE new;

CREATE TABLE cart (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(30) NOT NULL,
manufacturer VARCHAR(30) NOT NULL, availablity ENUM('in stock', 'not in stock'),
amount INT DEFAULT 0, UNIQUE (name, manufacturer));
INSERT INTO cart (name, manufacturer, availablity)
VALUES ('TV-324', 'panasonic', 'in stock'),
('vacuum cleaner', 'sony', 'in stock'),
('TV-004', 'sony', 'not in stock'),
('iron-901', 'lg', 'not in stock');
INSERT INTO cart (name, manufacturer, availablity, amount)
VALUES ('iron-113', 'panasonic', 'in stock', 112),
('TV-001', 'panasonic', 'not in stock', 99),
('iron-900', 'sony', 'in stock', 96),
('TV-654', 'horizont', 'in stock', 13);

SELECT * FROM cart;