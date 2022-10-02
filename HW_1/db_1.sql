-- You can copy all the code in the shell and press ENTER
-- (if you don't have the base named 'new' of course)

DROP DATABASE IF EXISTS new;
CREATE DATABASE new; USE new;

CREATE TABLE hamsters (ham_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, name VARCHAR(20) UNIQUE,
breeds VARCHAR(20), birth DATE, the_weight FLOAT NOT NULL, coat_color VARCHAR(20));
INSERT INTO hamsters (name, breeds, birth, the_weight, coat_color) 
VALUES ('Arnold', 'jungarik', '2022-03-14', '52.7', 'grey'), 
('Chack', 'sirian', '2022-06-01', '29.1', 'brown'),
('Brus', 'chinese', '2022-06-17', '100.8', 'mandarine'),
('Stiven', 'jungarik', '2022-08-06', '33.5', 'white'),
('Silvestr', 'chinese', '2022-12-31', '61.1', 'mandarine'),
('Keanu', 'chinese', '2022-12-31', '26.9', 'orange'),
('Nikolas', 'campbell', '2022-12-31', '113.54', 'tan'),
('John', 'robkovsy', '2022-12-31', '59.2', 'cream'),
('Will', 'jungarik', '2022-12-31', '58.7', 'moss'),
('Eugene', 'campbell', '2022-12-31', '64.3', 'white');

SELECT  *
FROM hamsters;








 

