-- Creating all the tables
DROP DATABASE IF EXISTS social_network;
CREATE DATABASE social_network;
USE social_network;

CREATE TABLE user_data (
id_data INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
day_of_birth DATE,
gender ENUM('male', 'female')
);

CREATE TABLE users (
id_user int NOT NULL AUTO_INCREMENT PRIMARY KEY,
firstname varchar(50) DEFAULT NULL,
lastname varchar(50) DEFAULT NULL,
login VARCHAR(25) NOT NULL UNIQUE,
password_hash VARCHAR(50) NOT NULL,
rate INT,
data_id INT UNIQUE,
FOREIGN KEY (data_id) REFERENCES user_data (id_data)
);

CREATE TABLE posts (
id_post INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
user_id INT,
text_area TEXT,
media BLOB,
FOREIGN KEY (user_id) REFERENCES users (id_user)
);

CREATE TABLE photos (
id_photo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
id_creater INT,
title VARCHAR(100),
image BLOB,
FOREIGN KEY (id_creater) REFERENCES users (id_user),
UNIQUE (id_photo, id_creater)
);

CREATE TABLE users_has_photo (
id_uhp INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
photo_id INT,
user_id INT,
FOREIGN KEY (photo_id) REFERENCES photos (id_photo),
FOREIGN KEY (user_id) REFERENCES users (id_user)
);

CREATE TABLE comments (
id_comment INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
user_id INT,
post_id INT,
photo_id INT,
comment_id INT,
text_area TEXT,
media BLOB,
FOREIGN KEY (user_id) REFERENCES users (id_user),
FOREIGN KEY (post_id) REFERENCES posts (id_post),
FOREIGN KEY (comment_id) REFERENCES comments (id_comment),
FOREIGN KEY (photo_id) REFERENCES photos (id_photo)
);

CREATE TABLE ganres (
ganre_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ganre VARCHAR(25)
);

CREATE TABLE artists (
artist_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
name VARCHAR(50),
ganre_id int,
FOREIGN KEY (ganre_id) REFERENCES ganres (ganre_id)
);

CREATE TABLE music (
id_track INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
track_name VARCHAR(50) NOT NULL,
file BLOB,
artist_id INT,
FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE user_has_music (
id_us_mus INt PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_user INT NOT NULL,
id_music INT NOT NULL,
FOREIGN KEY (id_user) REFERENCES users (id_user),
FOREIGN KEY (id_music) REFERENCES music (id_track),
UNIQUE (id_user, id_music)
);