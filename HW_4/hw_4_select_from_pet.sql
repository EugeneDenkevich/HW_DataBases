-- Method #1
SELECT v.name FROM veterinarian v
INNER JOIN pet p ON v.veterinarian_id=p.veterinarian_id WHERE species='dog' AND weight>30
UNION
SELECT v.name FROM veterinarian v
INNER JOIN pet p ON v.veterinarian_id=p.veterinarian_id WHERE species='cat' AND weight<7;

-- Method #2
WITH t AS (
SELECT v.name, p.species, p.weight FROM veterinarian v
INNER JOIN pet p ON v.veterinarian_id=p.veterinarian_id)

SELECT name FROM t WHERE species='dog' AND weight>30
UNION
SELECT name FROM t WHERE species='cat' AND weight<7;

-- Method #3
WITH t AS (
SELECT v.name, p.species, p.weight FROM veterinarian v, pet p
WHERE v.veterinarian_id=p.veterinarian_id)

SELECT name FROM t WHERE species='dog' AND weight>30
UNION
SELECT name FROM t WHERE species='cat' AND weight<7;