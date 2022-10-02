-- You can copy all the code in the shell and press ENTER
-- (if you don't have the base named 'new' of course)

DROP DATABASE IF EXISTS new;
CREATE DATABASE new; USE new;

CREATE TABLE student (id INT NOT NULL AUTO_INCREMENT, first_name VARCHAR(30) NOT NULL,
second_name VARCHAR(30) NOT NULL, speciality VARCHAR(100), age INT,
education_form ENUM('full-time', 'extramural'), PRIMARY KEY(id, second_name));
INSERT INTO student (first_name, second_name, speciality, age, education_form)
VALUES ('Stepan', 'Razin', 'Mining foreman', '59', 'full-time'),
('Mitya', 'Famin', 'Driver', '18', 'full-time'),
('Eugene', 'Denkevich', 'This table creator', '31', 'extramural'),
('Mad', 'Max', 'Time killer', '45', 'full-time'),
('Tony', 'Stark', 'Iron Man', '96', 'extramural'),
('Incredible', 'Hulk', 'Green', '23', 'extramural'),
('Vladimir', 'Lenin', 'October Lead', '66', 'full-time'),
('My', 'Hamster', 'Fast runner in the wheel', '1', 'full-time'),
('Vanya', 'Aynav', 'Programmer', '19', 'extramural');

SELECT  *
FROM student;