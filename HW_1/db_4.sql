DROP DATABASE IF EXISTS new;
CREATE DATABASE new;
USE new;

CREATE TABLE cart (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    manufacturer VARCHAR(30) NOT NULL,
    availablity ENUM('in stock', 'not in stock'),
    amount INT NULL DEFAULT 0,
    UNIQUE (name, manufacturer)
);

INSERT INTO cart (name, manufacturer, availablity, amount) VALUES ('vacuum cleaner', 'panasonic', 'in stock', 9);
INSERT INTO cart (name, manufacturer, availablity) VALUES ('TV-324', 'panasonic', 'in stock');
INSERT INTO cart (name, manufacturer, availablity) VALUES ('vacuum cleaner', 'sony', 'in stock');
INSERT INTO cart (name, manufacturer, availablity) VALUES ('TV-004', 'sony', 'not in stock');
INSERT INTO cart (name, manufacturer, availablity) VALUES ('iron-901', 'lg', 'not in stock');
INSERT INTO cart (name, manufacturer, availablity, amount) VALUES ('iron-113', 'panasonic', 'in stock', 112);
INSERT INTO cart (name, manufacturer, availablity, amount) VALUES ('TV-001', 'panasonic', 'not in stock', 99);
INSERT INTO cart (name, manufacturer, availablity, amount) VALUES ('vacuum cleaner', 'sony', 'in stock', 96);
INSERT INTO cart (name, manufacturer, availablity, amount) VALUES ('TV-654', 'horizont', 'in stock', 13);


SELECT * FROM cart;