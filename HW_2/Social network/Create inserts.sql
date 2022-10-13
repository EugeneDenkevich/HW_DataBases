-- Fill in all the tables

INSERT INTO user_data
(id_data, day_of_birth, gender)
VALUES
(1, '1991-01-24', 'male'),
(2, '1991-04-14', 'male'),
(3, '1991-09-18', 'male'),
(4, '1991-02-26', 'male'),
(5, '1991-01-24', 'female'),
(6, '1991-02-03', 'male');

INSERT INTO users
(id_user, firstname, lastname, login, password_hash, rate, data_id)
VALUES
(1, 'Eugene', 'Denkevich', 'Bison', 'Medrab123', 100, 1),
(2, 'Maxim', 'Novik', 'MAD MAX', 'Koleno41234', 100, 2),
(3, 'Ivan', 'Gvizdocsky', 'Polyak', 'Belarus1', 100, 3),
(4, 'Leonid', 'Borushko', 'Lavin', 'Minsk000', 100, 4),
(5, 'Darya', 'Alshevskaya', 'Krasotka', 'Kudri007', 100, 5),
(6, 'Evgeny', 'Shoshin', 'Bandit', 'Karate-pacan_666', 10, 6);

INSERT INTO posts
(id_post, user_id, text_area)
VALUES
(1, 1, "Hi! This is my first post. Aaaaaand... it's already ended");

INSERT INTO photos
(id_photo, id_creater, title)
VALUES
(1, 1, 'The best friends');

INSERT INTO users_has_photo
(id_uhp, photo_id, user_id)
VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4);

INSERT INTO comments
(id_comment, user_id, post_id, text_area)
VALUES
(1, 5, 1, "Ooh, I'm so admired of your post! It's the best thing that I've seen!");

INSERT INTO comments
(id_comment, user_id, post_id, comment_id, text_area)
VALUES
(2, 4, 1, 1, "I'm not.");

INSERT INTO comments
(id_comment, user_id, photo_id, text_area)
VALUES
(3, 5, 1, "You look wery cool!");

INSERT INTO ganres
(ganre_id, ganre)
VALUES
(1, 'Rock'),
(2, 'Hip-Hop'),
(3, 'Bard music'),
(4, 'Dark embient');

INSERT INTO artists
(artist_id, name, ganre_id)
VALUES
(1, 'Queen', 1),
(2, 'DECL', 2),
(3, 'Vladimir Visocky', 3),
(4, 'Akira Yamaoka', 4),
(5, 'Timur Shaov', 3),
(6, 'Non-standart option', 2),
(7, 'Nogano', 2);

INSERT INTO music
(id_track, track_name, artist_id)
VALUES
(1, 'Love of my life', 1),
(2, 'Another one bite the dust', 1),
(3, 'No one loves you', 4),
(4, 'Alone in the town', 4),
(5, 'Theme for Laura', 4),
(6, 'Morninh song of city', 5),
(7, "Don't go", 5),
(8, 'Homeless', 6),
(9, 'Non-slast word is forever', 6),
(10, 'Peak', 3),
(11, 'Blood my blood', 2);

INSERT INTO user_has_music
(id_us_mus, id_user, id_music) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 7),
(4, 2, 9),
(5, 2, 8),
(6, 4, 7),
(7, 4, 9),
(8, 5, 1),
(9, 5, 4),
(10, 6, 11),
(11, 1, 3);
