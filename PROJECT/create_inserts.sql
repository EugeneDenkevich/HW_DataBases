INSERT INTO suplier
(id_sup, sup_name)
VALUES
(1, 'Fruits-Company'),
(2, 'Vegitables-Incorporated'),
(3, 'United-Cereals'),
(4, 'Flour-Industrial');

INSERT INTO prod_data
(id_data, prod_name, price_kg, count_kg, sup_id)
VALUES
(1, 'Apples', 2.34, 100.00, 1),
(2, 'Cucumbers', 9.97, 2000.00, 2),
(3, 'Oranges', 5.55, 15.50, 1),
(4, 'Buckwheet', 1.25, 54.90, 3),
(5, 'Potatoes', 6.54, 5050.20, 2);

INSERT INTO prod_data
(id_data, prod_name, price_pcs, count_pcs, sup_id)
VALUES
(6, 'Pita', 99.7, 90, 4),
(7, 'Pie', 45.01, 50, 4);

INSERT INTO product
(id_product, data_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

