-- You can copy all the code IN the shell AND press ENTER
-- (if you don't have the base named 'new' of course)

DROP DATABASE IF EXISTS new;
CREATE DATABASE new; USE new;

CREATE TABLE hamsters (ham_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, the_weight FLOAT NOT NULL, name VARCHAR(20) UNIQUE, coat_color VARCHAR(20), breeds VARCHAR(20), birth DATE);
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('1', '52.7', 'Arnold', 'grey', 'jungarik', '2022-03-14');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('29.1', 'Chack', 'brown', 'sirian', '2022-06-01');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('100.8', 'Brus', 'mandarine', 'chinese', '2022-06-17');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('33.5', 'Stiven', 'white', 'jungarik', '2022-08-06');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('61.1', 'Silvestr', 'mandarine', 'chinese', '2022-12-31');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('26.9', 'Mel', 'orange', 'chinese', '2022-12-31');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('113.54', 'Keanu', 'tan', 'campbell', '2022-12-31');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('59.2', 'Nikolas', 'cream', 'robkovsy', '2022-12-31');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('58.7', 'John', 'moss', 'jungarik', '2022-12-31');
INSERT INTO hamsters (the_weight, name, coat_color, breeds, birth) VALUES ('64.3', 'Will', 'white', 'campbell', '2022-12-31');

SELECT  *
FROM hamsters;