/* 
	In this project you can add any of the following views, triggers, procedures, functions and indexes.
	There are many useful notes in this file so enjoy! =)
*/
	
    
    -- INDEXES:
    
    -- Before we'll start it's need to add these indexes
	CREATE INDEX client_name ON client(firstname, lastname);
    CREATE INDEX email_name ON client_additional_info(email);
	

	-- VIEWS:
    
	-- 1. Who bought what and how much? This view will use in the following bloks of code so e sure that this view is created.
	CREATE OR REPLACE ALGORITHM = TEMPTABLE VIEW total_products
	AS
	SELECT CONCAT(firstname, ' ', lastname) AS Client, Product, COUNT(Product) AS Count
	FROM (SELECT c.id_client, c.firstname, c.lastname, pd.prod_name AS Product FROM client c
	INNER JOIN purchase p ON p.client_id=c.id_client
	INNER JOIN product pr ON p.product_id=pr.id_product
	INNER JOIN prod_data pd ON pd.id_data=pr.data_id) main_table
	GROUP BY Client, Product;

	SELECT * FROM total_products;

	-- 2. Some interesting information
    
    CREATE OR REPLACE ALGORITHM = TEMPTABLE VIEW interesting_information
    AS
	SELECT CONCAT(firstname, ' ', lastname) AS Client,
	email, DATE_FORMAT(birthday, '%d %b %Y') AS 'Birthday', eyes_color AS 'Eyes color'
	FROM client_additional_info, client WHERE client_id=id_client;
    
    SELECT * FROM interesting_information;
    
	-- TRIGGERS:
    
	-- 1. Forbid Helen to buy cookies
	DELIMITER $$
	CREATE TRIGGER check_product_count
	BEFORE INSERT
	ON purchase
	FOR EACH ROW
	IF NEW.product_id=11 AND NEW.client_id=8 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'HELEN, STOP EAT COOKIE!';
	END IF $$
	DELIMITER ;
	
    -- Lets check what do we have for the present:
    EXPLAIN SELECT * FROM total_products WHERE Client='Helen Horovez'; /* Use view from VIEWS.
																If you get an empty table try to create and fiil tables again. */ 
    
    -- Helen can try to buy beef
	INSERT INTO purchase
	(client_id, product_id)
	VALUES
	(8, 10);
	-- and she succeeded in doing it,
    -- checking after:
    SELECT * FROM total_products WHERE Client='Helen Horovez';
    
    -- But now she try to do some forbidden
	INSERT INTO purchase
	(client_id, product_id)
	VALUES
	(8, 11);
	-- As expected it didn't happen 
     -- checking after:
    SELECT * FROM total_products WHERE Client='Helen Horovez'; /* No cookies for Helen */
    
	-- 2. (just in case Helen tries to trick us)
	DELIMITER //
	CREATE TRIGGER stop_update_purchase
	BEFORE UPDATE
	ON purchase
	FOR EACH ROW
	IF (NEW.product_id=11 or OLD.product_id=11) AND OLD.client_id=8 THEN
	SIGNAL SQLSTATE '45000'
	SET MESSAGE_TEXT = 'HELEN, YOU WON"T FOOL ME! I SAD STOP IT!';
	END IF //
	DELIMITER ;
	
    -- If Eugene Alhovik will try to trick us so it's a quite normal.
	UPDATE purchase SET product_id=11
    WHERE client_id=(SELECT DISTINCT id_client FROM client
    WHERE firstname='Eugene' AND lastname='Alhovik')
    LIMIT 1;
    
    -- If this person bought something - now it has changed to "cookie"
	SELECT * FROM total_products WHERE Client='Eugene Alhovik';
        
    -- But we can't allowed to Helen to do it!
	UPDATE purchase SET product_id=11
    WHERE client_id=(SELECT DISTINCT id_client FROM client
    WHERE firstname='Helen' AND lastname='Horovez')
    LIMIT 1;
    
    -- No cookie for Helen. Off course if she didn't buy it befor in create_inserts file.
	SELECT * FROM total_products WHERE Client='Helen Horovez';

	-- 3. Insert *** if we try to add new client without firstname or lastname or each of it:
    DELIMITER %%
    CREATE TRIGGER check_if_noname
    BEFORE INSERT
    ON client
    FOR EACH ROW
    IF NEW.firstname IS NULL AND NEW.lastname IS NULL THEN
    SET NEW.firstname = '***', NEW.lastname = '***';
    ELSEIF
    NEW.firstname IS NULL THEN
    SET NEW.firstname = '***';
    ELSEIF
    NEW.lastname IS NULL THEN
    SET NEW.lastname = '***';
    END IF %%
    DELIMITER ;
    
    -- There are we have inserts *** instead lastname.
	INSERT INTO client
    (firstname)
    VALUES
    ('Viktor');
	
    -- There are we have inserts *** instead firstname.
    INSERT INTO client
    (lastname)
    VALUES
    ('Gusev');

	-- There are we have inserts ***, *** instead firstname and lastname.
    INSERT INTO client
    (id_client)
    VALUES
    ((SELECT (SELECT MAX(c1.id_client) FROM client c1) + 1)); /* manual autoincrement =) */

	-- Check changes
	SELECT id_client, firstname, lastname FROM client;
	
    -- 4. Delete a client with his purchases and insert him into an additional table    
    DELIMITER **
    CREATE TRIGGER delete_client_with_purchases
    BEFORE DELETE
    ON client
    FOR EACH ROW
    DELETE FROM purchase WHERE client_id=OLD.id_client
    **
    DELIMITER ;
       
    DELIMITER **
    CREATE TRIGGER save_deleted_client
    AFTER DELETE
    ON client
    FOR EACH ROW
    INSERT INTO deleted_client (firstname, lastname) VALUES (OLD.firstname, OLD.lastname)
    **
    DELIMITER ;
    
	-- Checking...
    SELECT * FROM total_products; /* Don't forget about that it's a view!
									Create it in the beginning if you didn't do it =) */
    SELECT * FROM deleted_client;
    
    -- Make some delete-magick...
    DELETE FROM client WHERE firstname='Eugene' AND lastname='Denkevich' LIMIT 1; /* There is our index will help us successfuly */
    -- or
    DELETE FROM client WHERE firstname='Leonid' AND lastname='Borushko';
    -- or someone who bought at least something! =)
    -- Look again
    SELECT * FROM total_products; /* remember: it is a view! =) */
	SELECT * FROM deleted_client;
	
    
    -- PROCEDURES:
    
    -- 1. It returns who bought pointed product and how many times
    DELIMITER $$
    CREATE PROCEDURE get_cliets_who_bought_product_some_number_of_times (pr_nm VARCHAR(100))
    BEGIN
		SELECT CONCAT(firstname, ' ', lastname) AS 'Client who bought...', pr_nm AS '...this product...',
        COUNT(pd.prod_name) AS '...this number of times' FROM client c
        INNER JOIN purchase p ON p.client_id=c.id_client
        INNER JOIN product pr ON pr.id_product=p.product_id
        INNER JOIN prod_data pd ON pd.id_data=pr.data_id
        WHERE pd.prod_name = pr_nm
        GROUP BY c.id_client;
	END $$
    DELIMITER ;
    
    -- Call it:
    CALL get_cliets_who_bought_product_some_number_of_times('Pears');

	-- 2. Split all the clients by discount size:
    DELIMITER //
    CREATE PROCEDURE split_by_discount(disc INT)
    BEGIN
		CASE
        WHEN disc = 0
        THEN
			SELECT CONCAT(firstname, ' ', lastname) AS Client, discount_percent AS Discount FROM client
            WHERE discount_percent = 0;
        WHEN disc = 5
		THEN
			SELECT CONCAT(firstname, ' ', lastname) AS Client, discount_percent AS Discount FROM client
            WHERE discount_percent = 5;
		WHEN disc = 10
        THEN
			SELECT CONCAT(firstname, ' ', lastname) AS Client, discount_percent AS Discount FROM client
            WHERE discount_percent = 10;
		WHEN disc = 20
        THEN
			SELECT CONCAT(firstname, ' ', lastname) AS Client, discount_percent AS Discount FROM client
            WHERE discount_percent = 20;
            
		WHEN disc > 20
        THEN
			SELECT CONCAT(firstname, ' ', lastname) AS Client, discount_percent AS Discount, 'Lucky you!' FROM client
            WHERE discount_percent > 20;
		END CASE;
    END //
    DELIMITER ;

	CALL split_by_discount(10);
    
    -- 3. Find out how many times a particular product was bought
    DELIMITER $$
    CREATE PROCEDURE get_number_of_purchased_product(IN prod_nm VARCHAR(100), OUT number INT)
    BEGIN
		SET number = (SELECT COUNT(pr.prod_name) FROM prod_data pr
					INNER JOIN product p ON p.data_id=pr.id_data
                    INNER JOIN purchase pur ON pur.product_id=p.id_product
                    INNER JOIN client c ON c.id_client=pur.client_id
                    WHERE pr.prod_name = prod_nm);
	END $$
    DELIMITER ;
    
    -- Assign the result of this function to a varible
    CALL get_number_of_purchased_product('Beetroot', @num);
	-- And display it =D
    SELECT @num;
    
    -- 4. Assign the discount to a particular client
    DELIMITER //
    CREATE PROCEDURE set_discount(client_name VARCHAR(100), disc INT)
    BEGIN
    UPDATE client SET discount_percent = disc WHERE CONCAT(firstname, ' ', lastname) = client_name;
    END //
    DELIMITER ;
    
    -- Set 100% discoun to Eugene Denkevich (why not? you can set that number you want)
    CALL set_discount('Eugene Denkevich', 100);
	-- Check if it works
    SELECT CONCAT(firstname, ' ', lastname) AS Client, discount_percent AS Discount
    FROM client WHERE firstname='Eugene' AND lastname='Denkevich';
    
    -- 5. Where is this product?
    DELIMITER $$
    CREATE PROCEDURE where_prod(IN name_pr VARCHAR(100))
    BEGIN
		SELECT name_pr AS Product, name AS "Department's name" FROM department INNER JOIN prod_data ON dep_id=id_dep WHERE prod_name=name_pr LIMIT 1;
    END $$
    DELIMITER ;
    
    -- So lets find out where are the apples?
    CALL where_prod('Apples');
    
    -- 6. Find a client by email (with index that we created in the begining)
    DELIMITER $$
    CREATE PROCEDURE find_client_by_email(email_name VARCHAR(100))
    BEGIN
		SELECT CONCAT(firstname, ' ', lastname) AS Client, email AS Email FROM client_additional_info
        INNER JOIN client ON id_client=client_id WHERE email = email_name;
	END $$
    DELIMITER ;
	
    -- Lets find some client
    CALL find_client_by_email('ivanivan@mail.com');


-- Thank's for attention! =)