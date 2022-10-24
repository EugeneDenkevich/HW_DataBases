-- 1. It's almost correct. =)
WITH t1 AS (SELECT CONCAT(b.firstname, ' ', b.lastname) AS 'Buyer', 
pr.price, pr.product_name AS Product
FROM buyer b
LEFT JOIN purchase p ON p.buyer_id=b.id_buyer
LEFT JOIN product pr ON pr.id_product=p.product_id)

SELECT Buyer, Product, MAX(price) FROM t1
WHERE price IN (SELECT MAX(price) FROM t1 GROUP BY Buyer)
GROUP BY Buyer;

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
INNER JOIN purchase p ON p.product_id=pr.id_product
INNER JOIN category c ON c.id_category=pr.category_id
)

SELECT Category, Price FROM t1
WHERE price IN (SELECT MAX(price) FROM t1 GROUP BY Category)
AND price > 1000 GROUP BY Category;
