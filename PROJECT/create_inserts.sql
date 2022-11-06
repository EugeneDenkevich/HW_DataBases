INSERT INTO department
(id_dep, name)
VALUES
(1, 'Fruits and vegetables'),
(2, 'Bakery products'),
(3, 'Meat products'),
(4, 'Diet products'),
(5, 'Cereals');


INSERT INTO suplier
(id_sup, sup_name)
VALUES
(1, 'Fruits-Company'),
(2, 'Vegitables-Incorporated'),
(3, 'United-Cereals'),
(4, 'Flour-Industrial'),
(5, 'The Whole Meat'),
(6, 'Your Best Body');

SET @MAX_pr=600.00;
SET @MIN_pr=0.00;
SET @MAX_q=100;
SET @MIN_q=0;

INSERT INTO prod_data
(id_data, prod_name, price, quantity, sup_id, dep_id)
VALUES
	(1, 'Apples',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	1, 1),
	(2, 'Cucumbers',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	2, 1),
	(3, 'Oranges',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	1, 1),
	(4, 'Beetroot',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	2, 1),
	(5, 'Potatoes',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	2, 1),
    (6, 'Pears',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	1, 1),
    (7, 'Bran',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	6, 4),
    (8, 'Fructose',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	6, 4),
    (9, 'Diet cereal',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	6, 4),
    (10, 'Beef',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	5, 3),
    (11, 'Cookie',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	4, 2),
    (12, 'Chicken',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	5, 3),
    (13, 'Pork',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	5, 3),
    (14, 'Oatmeal',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	3, 5),
    (15, 'Buckwheat',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	3, 5),
	(16, 'Pita', 
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	4, 2),
	(17, 'Pie',
	ROUND((RAND()*(@MAX_pr-@MIN_pr)+@MIN_pr), 2),
	ROUND((RAND()*(@MAX_q-@MIN_q)+@MIN_q)),
	4, 2);

INSERT INTO product
(id_product, data_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17);

INSERT INTO client
(id_client, firstname, lastname, discount_percent)
VALUES
(1, 'Eugene', 'Denkevich', 5),
(2, 'Maxim', 'Novik', 5),
(3, 'Leonid', 'Borushko', 5),
(4, 'Ivan', 'Gvozdovsky', 5),
(5, 'Eugene', 'Alhovik', 10),
(6, 'Eugene', 'Gusak', 10),
(7, 'Darya', 'Alshevskaya', 10),
(8, 'Helen', 'Horovez', 10),
(9, 'Tamara', 'Marchenko', 20),
(10, 'Ivan', 'Zhukov', 20),
(11, 'Orders', 'Nothing', 0);

SET @MAX_prod = 1;
SET @MIN_prod = 17;
SET @MAX_client = 1;
SET @MIN_client = 10;

INSERT INTO purchase
(client_id, product_id)
VALUES
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod)),
(ROUND(RAND()*(@MAX_client-@MIN_client)+@MIN_client), ROUND(RAND()*(@MAX_prod-@MIN_prod)+@MIN_prod));

INSERT INTO client_additional_info
(client_id, email, birthday, eyes_color)
VALUES
(1, 'eugene@mail.ru', '1991-01-24', 'blue'),
(2, 'max@gmail.com', '1991-04-10', 'green'),
(3, 'leo21@leonid.ru', '1993-07-11', 'grey'),
(4, 'ivanivan@mail.com', '1996-09-01', 'brown'),
(5, 'alchovik@tut.com', '1991-09-20', 'black'),
(6, 'gusak@mail.ru', '1990-12-25', 'blue'),
(7, 'dasha@rambler.ru', '1999-02-09', 'grey'),
(8, 'horovez@mail.by', '1994-02-12', 'blue'),
(9, 'tamara@common.su', '1991-01-20', 'white'),
(10, 'zhuk@noname.by', '1991-06-15', 'white'),
(11, 'nothing@order.net', '2000-04-23', 'colorless');




