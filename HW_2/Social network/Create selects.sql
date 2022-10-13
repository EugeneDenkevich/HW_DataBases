-- When will be MAD MAX's Lavin's and  birthdays?
SELECT CONCAT(u.firstname, ' ', u.lastname) AS 'User', u.login AS 'Login', ud.day_of_birth 'Bith day'
FROM users u
INNER JOIN user_data ud
ON u.data_id=ud.id_data
WHERE u.login='MAD MAX' OR u.login='Lavin';

-- How much girls in this social network?
SELECT COUNT(gender) AS 'Total girls' FROM user_data WHERE gender='female';

-- Login and passwords?
SELECT CONCAT(u.firstname, ' ', u.lastname) AS 'User', u.login AS 'Login', u.password_hash AS 'Password'
FROM users u;

-- What is the rating of the person who added the first photo?
SELECT CONCAT(u.firstname, ' ', u.lastname) AS 'User', u.rate AS "Rating" FROM users u
INNER JOIN photos p ON p.id_creater=u.id_user;

-- How much persons present on the first photo?
SELECT COUNT(u.id_user) AS 'Total persons' FROM users u
INNER JOIN users_has_photo uhp ON uhp.user_id=u.id_user;

-- Who listens to dark-embient ganre?
SELECT DISTINCT CONCAT(u.firstname, ' ', u.lastname) AS 'User' FROM users u
INNER JOIN user_has_music uhm ON uhm.id_user=u.id_user
INNER JOIN music m ON m.id_track=uhm.id_music
INNER JOIN artists a ON a.artist_id=m.artist_id
INNER JOIN ganres g ON g.ganre_id=a.ganre_id
WHERE ganre='Dark embient';

-- Who left a comment on the first Eugene's Denkevich photo? And what does it contains?
SELECT CONCAT(u.firstname, ' ', u.lastname) AS 'User', c.text_area AS 'Comment' FROM users u
INNER JOIN comments c ON u.id_user=c.user_id
INNER JOIN photos p ON p.id_photo=c.photo_id
WHERE id_creater=1;

-- Who comented on the Darya comment? And what did he write?
SELECT CONCAT(u.firstname, ' ', u.lastname) AS 'User', c1.text_area AS 'Comment' FROM users u
INNER JOIN comments c1 ON u.id_user=c1.user_id
INNER JOIN comments c2 ON c1.comment_id=c2.id_comment
WHERE c2.user_id=5;

-- Music