DROP DATABASE IF EXISTS new;
CREATE DATABASE new; USE new;

CREATE TABLE student (first_name VARCHAR(30) NOT NULL, second_name VARCHAR(30) NOT NULL, speciality VARCHAR(100), age INT, education_form ENUM('full-time', 'extramural'), PRIMARY KEY(first_name, second_name));

INSERT INTO student (first_name, second_name, speciality, age, education_form) VALUES ('Stepan', 'Razin', 'Mining foreman', '59', 'full-time');
INSERT INTO student (first_name, second_name, speciality, age, education_form) VALUES ('Mitya', 'Famin', 'Driver', '18', 'full-time');
INSERT INTO student (first_name, second_name, speciality, age, education_form) VALUES ('Eugene', 'Denkevich', 'This table creator', '31', 'extramural');
INSERT INTO student (first_name, second_name, speciality, age, education_form) VALUES ('Mad', 'Max', 'Time killer', '45', 'full-time');
INSERT INTO student (first_name, second_name, speciality, age, education_form) VALUES ('Tony', 'Stark', 'Iron Man', '96', 'extramural');
INSERT INTO student (first_name, second_name, speciality, age, education_form) VALUES ('Incredible', 'Hulk', 'Green', '23', 'extramural');

SELECT * FROM student;