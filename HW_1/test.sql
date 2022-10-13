CREATE TABLE manufacturer (
    id_manufacturer INT NOT NULL AUTO_INCREMENT,
    model VARCHAR(25) NOT NULL,
    PRIMARY KEY (id_manufacturer)
);

CREATE TABLE shop (
    id_shop INT NOT NULL AUTO_INCREMENT,
    country VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    manufacturer_id INT NULL UNIQUE,
    PRIMARY KEY (id_shop),
    FOREIGN KEY (manufacturer_id) REFERENCES
    manufacturer (id_manufacturer)
);

INSERT INTO manufacturer (
    model
) VALUES 
    ('x-3'),
    ('b-4'),
    ('p-0'),
    ('g-9');

INSERT INTO manufacturer (
    model
) VALUES 
    ('o-10');
    
INSERT INTO shop (
    country, address, manufacturer_id
) VALUES
('belarus', 'Kozlova 44b', '1'),
('russia', 'Lenina 2', '2'),
('germany', 'Stalina 14a', '3'),
('finland', 'Baranova 118', '4');

INSERT INTO shop (
    country, address
) VALUES
('england', 'Priterkina 9b');

CREATE TABLE model (
    id_model INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    model_name VARCHAR(25) NOT NULL,
    year_of_manufacture INT NULL,
    manufacturer_id INT NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer
    (id_manufacturer),
    CHECK (year_of_manufacture>=1910),
    CHECK (year_of_manufacture<=2023)
);

DROP TABLE model;

CREATE TABLE model (
    id_model INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    model_name VARCHAR(25) NOT NULL,
    year_of_manufacture INT NULL,
    manufacturer_id INT NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer
    (id_manufacturer),
    CHECK (year_of_manufacture>=1910),
    CHECK (year_of_manufacture<=2023)
);

INSERT INTO model (
    model_name, year_of_manufacture, manufacturer_id
) VALUES
('90-g', 1991, 1),
('18-g', 1983, 1),
('35-g', 2002, 2),
('46-g', 2004, 2),
('99-g', 2019, 3);

SELECT shop.country, shop.address, shop.manufacturer_id, model.model_name FROM shop LEFT JOIN model ON shop.manufacturer_id= model.manufacturer_id;

DROP TABLE shop_has_clien;
DROP TABLE shops;
DROP TABLE clients;

CREATE TABLE shop_has_clien (
    id_sh_cl INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    shop_id INT NOT NULL,
    client_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (shop_id) REFERENCES shops (id_shop),
    FOREIGN KEY (client_id) REFERENCES clients (id_client),
    UNIQUE (shop_id, client_id)
);

CREATE TABLE shops (
    id_shop INT NOT NULL PRIMARY KEY,
    country VARCHAR(25) NOT NULL
);

CREATE TABLE clients (
    id_client INT PRIMARY KEY,
    name VARCHAR(25)
);

INSERT INTO shops (
    id_shop, country
) VALUES 
    (1122, 'Belarus'),
    (0056, 'Belarus'),
    (0169, 'Ukraine');

INSERT INTO clients (
    id_client, name
) VALUES
    (0023, 'Eugene'),
    (0029, 'Vitalya'),
    (0124, 'Sanya'),
    (0002, 'Alhovik');

INSERT INTO shop_has_clien (
    shop_id, client_id
) VALUES
(1122, 0023),
(0056, 0023),
(1122, 0029),
(1122, 0124),
(0169, 0002);

SELECT DISTINCT shop_has_clien.shop_id, shops.country
FROM shops
LEFT JOIN shop_has_clien
ON shop_has_clien.shop_id=shops.id_shop;






CREATE TABLE client (
    client_id INT NOT NULL PRIMARY KEY,
    name VARCHAR(50),
);

CREATE TABLE gym (
    gym_id INT NOT NULL PRIMARY KEY,
    address VARCHAR(25) NOT NULL,
    client_id INT NOT NULL,
    FOREIGN KEY (client_id) REFERENCES
    client (client_id)
);

INSERT INTO gym (
    gym_id, address, cliend_id
) VALUES
    (0001, 'Kozlova 2', 0032),
    (0002, 'Lenina 7', 0019),
    (0003, 'Stalina 8', 0111),
    (0004, 'Volgina 10', 0009),

INSERT INTO client






CREATE TABLE car (
    id_manufacturer INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    manufacturer_name VARCHAR(25) NOT NULL
);

INSERT INTO car (
    manufacturer_name
) VALUES
    ('Mersedes-Benz'),
    ('KIA'),
    ('Volvo'),
    ('Renault'),
    ('Volga'),
    ('RAF'),
    ('Warburg'),
    ('Zaporozec');


CREATE TABLE model (
    id_manufacturer INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    manufacturer_name VARCHAR(25) NOT NULL
);

INSERT INTO model (
    id_model, model_name, year_of_manufacture, manufacturer_id
) VALUES 
    (1, '01-J', 2022, 4);

INSERT INTO model (
    model_name, year_of_manufacture, manufacturer_id
) VALUES 

    ('01-J', 2022, 4),
    ('19-O', 2022, 5),
    ('19-O1', 2022, 5),
    ('20-O1)', 2022, 5),
    ('34-K', 2022, 6),
    ('02-19-G', 2022, 7);



SELECT mod.model_name AS 'Model name', mod.year_of_manufacture AS 'Year', c.manufacturer_name AS 'Manufacturer name'
FROM model mod
INNER JOIN car c
ON mod.manufacturer_id=c.id_manufacturer;


SELECT mod.model_name, mod.year_of_manufacture, c.manufacturer_name
FROM model mod
INNER JOIN car c
ON mod.manufacturer_id=c.id_manufacturer;









DROP TABLE manufacturer1;

DROP TABLE model1;

CREATE TABLE model1 (
    id_model INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    model_name VARCHAR(25) NOT NULL,
    year_of_manufacture INT NULL,
    manufacturer_id INT NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer1 (id_manufacturer),
    CHECK (year_of_manufacture>=1910),
    CHECK (year_of_manufacture<=2023)
);

INSERT INTO model1 (
    model_name, year_of_manufacture, manufacturer_id
) VALUES 
    ('90-g', 1991, 1),
    ('18-g', 1983, 1),
    ('35-g', 2002, 2),
    ('46-g', 2004, 2),
    ('99-g', 2019, 3),
    ('01-J', 2022, 4),
    ('19-O', 2022, 5),
    ('19-O1', 2022, 5),
    ('20-O1)', 2022, 5),
    ('34-K', 2022, 6),
    ('02-19-G', 2022, 7);

INSERT INTO model1 (
    model_name, year_of_manufacture, manufacturer_id
) VALUES 
    ('90-o', 1991, 8);


CREATE TABLE manufacturer1 (
    id_manufacturer INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    manufacturer_name VARCHAR(25) NOT NULL
);

INSERT INTO manufacturer1 (
    manufacturer_name
) VALUES
    ('Mersedes-Benz'),
    ('KIA'),
    ('Volvo'),
    ('Renault'),
    ('Volga'),
    ('RAF'),
    ('Warburg'),
    ('Zaporozec');


SELECT model1.model_name AS 'Model name', model1.year_of_manufacture AS 'Year', manufacturer1.manufacturer_name AS 'Manufacturer name'
FROM model1
LEFT OUTER JOIN manufacturer1
ON model1.manufacturer_id=manufacturer1.id_manufacturer;



















