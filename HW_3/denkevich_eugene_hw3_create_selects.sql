-- 1. Before watching lesson11
WITH t1 AS (SELECT firstname, lastname, MAX(price) AS prices FROM product pr
INNER JOIN purchase p ON pr.id_product=p.product_id
INNER JOIN buyer b ON b.id_buyer=p.buyer_id
GROUP BY id_buyer)

SELECT CONCAT(firstname, ' ', lastname) AS Buyer, p2.product_name AS "Max price product"
FROM t1, product p2
WHERE p2.price=t1.prices
ORDER BY firstname, lastname;

-- 1. Corrected after watching lesson11
WITH t1 AS (SELECT firstname, lastname, MAX(price) AS prices, c.category_name AS Category FROM product pr
INNER JOIN purchase p ON pr.id_product=p.product_id
INNER JOIN buyer b ON b.id_buyer=p.buyer_id
INNER JOIN category c ON pr.category_id=c.id_category
GROUP BY id_buyer, Category),
t2 AS (SELECT firstname, lastname, price AS prices,
category_name AS Category, product_name AS Product FROM product pr
INNER JOIN purchase p ON pr.id_product=p.product_id
INNER JOIN buyer b ON b.id_buyer=p.buyer_id
INNER JOIN category c ON pr.category_id=c.id_category)

SELECT DISTINCT t2.firstname, t2.lastname, t2.prices, t2.Product, t2.Category FROM t2
WHERE EXISTS
(SELECT t1.firstname, t1.lastname, t1.prices FROM t1
WHERE t1.prices=t2.prices AND t1.firstname=t2.firstname
AND t1.lastname=t2.lastname AND t1.Category=t2.Category)
ORDER BY t2.firstname, t2.lastname, t2.Category;

-- 2.
SELECT CONCAT(b.firstname, ' ', b.lastname) AS 'Buyer',
SUM(pr.price) AS 'Total'
FROM buyer b
INNER JOIN purchase p ON p.buyer_id=b.id_buyer
INNER JOIN product pr ON pr.id_product=p.product_id
GROUP BY buyer_id;

-- 3.
WITH t1 AS (SELECT CONCAT(b.firstname, ' ', b.lastname) AS 'Buyer',
cat.category_name AS Category, pr.price AS price
FROM buyer b
INNER JOIN purchase p ON p.buyer_id=b.id_buyer
INNER JOIN product pr ON pr.id_product=p.product_id
INNER JOIN category cat ON pr.category_id=cat.id_category)

SELECT Buyer, Category, ROUND(AVG(price), 2) AS 'AVG price' FROM t1 GROUP BY Buyer, Category
ORDER BY Buyer;

-- 4.
SELECT cat.category_name AS Category, COUNT(pr.price) AS Count
FROM buyer b
INNER JOIN purchase p ON p.buyer_id=b.id_buyer
INNER JOIN product pr ON pr.id_product=p.product_id
INNER JOIN category cat ON pr.category_id=cat.id_category
GROUP BY Category;

-- 5.
SELECT CONCAT(b.firstname, ' ', b.lastname) AS 'Buyer',
product_name AS Product, pr.price AS price
FROM buyer b
INNER JOIN purchase p ON p.buyer_id=b.id_buyer
INNER JOIN product pr ON pr.id_product=p.product_id
INNER JOIN category cat ON pr.category_id=cat.id_category
WHERE (category_name LIKE '%a%' OR category_name LIKE '%o%') AND price > 150;

-- 6.
SELECT product_name AS Product, price*COUNT(product_name) AS Revenue FROM product p
INNER JOIN purchase pur ON pur.product_id=p.id_product
GROUP BY product_name;

-- 7.
SELECT product_name AS Product, COUNT(product_name) AS Count FROM product p
INNER JOIN purchase pur ON pur.product_id=p.id_product
GROUP BY product_name
HAVING Count >= 2 AND Count <=5;

-- 8.
SELECT CONCAT(b.firstname, ' ', b.lastname) AS Buyer, product_name FROM buyer b
LEFT JOIN purchase p ON p.buyer_id=b.id_buyer
LEFT JOIN product pr ON pr.id_product=p.product_id
GROUP BY Buyer, product_name;

-- 9.
SELECT product_name AS Product FROM product pr
LEFT JOIN purchase p ON p.product_id=pr.id_product
WHERE buyer_id IS NULL;

-- 10.
WITH t1 AS (
SELECT category_name AS Category, price AS Price FROM product pr
INNER JOIN category c ON c.id_category=pr.category_id
)

SELECT Category, Price FROM t1
WHERE price IN (SELECT MAX(price) FROM t1 GROUP BY Category)
AND price > 1000 GROUP BY Category;
