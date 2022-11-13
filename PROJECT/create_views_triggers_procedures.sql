	-- In this project you can add any of the following views, triggers, procedures, functions and indexes by this file.
    
    
    -- INDEXES:
    
    CREATE INDEX client_name ON client(firstname, lastname);
    CREATE INDEX email_name ON client_additional_info(email);
    
    
    -- VIEWS:
    
    CREATE OR REPLACE ALGORITHM = TEMPTABLE VIEW total_products
	AS
	SELECT CONCAT(firstname, ' ', lastname) AS Client, Product, COUNT(Product) AS Count
	FROM (SELECT c.firstname, c.lastname, pr.prod_name AS Product FROM client c
	INNER JOIN purchase p ON p.client_id=c.id_client
	INNER JOIN product pr ON p.product_id=pr.id_product) main_table
	GROUP BY Client, Product;
    
    CREATE OR REPLACE VIEW interesting_information
    AS
	SELECT CONCAT(firstname, ' ', lastname) AS Client,
	email, DATE_FORMAT(birthday, '%d %b %Y') AS 'Birthday', eyes_color AS 'Eyes color'
	FROM client_additional_info, client WHERE client_id=id_client;
    
    CREATE OR REPLACE VIEW find_client_by_email
    AS
	SELECT CONCAT(firstname, ' ', lastname) AS Client, email AS Email FROM client_additional_info
	INNER JOIN client ON id_client=client_id;
    
    -- TRIGGERS:
    
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
    
    DELIMITER **
    CREATE TRIGGER save_deleted_client
    AFTER DELETE
    ON client
    FOR EACH ROW
    INSERT INTO deleted_client (firstname, lastname) VALUES (OLD.firstname, OLD.lastname)
    **
    DELIMITER ;
    
    
    -- PROCEDURES:
    
    DELIMITER $$
    CREATE PROCEDURE get_cliets_who_bought_product_some_number_of_times (pr_nm VARCHAR(100))
    BEGIN
		SELECT CONCAT(firstname, ' ', lastname) AS 'Client who bought...', pr_nm AS '...this product...',
        COUNT(pr.prod_name) AS '...this number of times' FROM client c
        INNER JOIN purchase p ON p.client_id=c.id_client
        INNER JOIN product pr ON pr.id_product=p.product_id
        WHERE pr.prod_name = pr_nm
        GROUP BY c.id_client;
	END $$
    DELIMITER ;
    
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
    
    DELIMITER $$
    CREATE PROCEDURE get_number_of_purchased_product(IN prod_nm VARCHAR(100), OUT number INT)
    BEGIN
		SET number = (SELECT COUNT(p.prod_name) FROM product p
                    INNER JOIN purchase pur ON pur.product_id=p.id_product
                    INNER JOIN client c ON c.id_client=pur.client_id
                    WHERE p.prod_name = prod_nm);
	END $$
    DELIMITER ;
    
    DELIMITER //
    CREATE PROCEDURE set_discount(client_name VARCHAR(100), disc INT)
    BEGIN
    UPDATE client SET discount_percent = disc WHERE CONCAT(firstname, ' ', lastname) = client_name;
    END //
    DELIMITER ;
    
    DELIMITER $$
    CREATE PROCEDURE where_prod(IN name_pr VARCHAR(100))
    BEGIN
		SELECT name_pr AS Product, name AS "Department's name" FROM department
        INNER JOIN product_additional ON dep_id=id_dep
        INNER JOIN product ON id_product=prod_id
        WHERE prod_name=name_pr LIMIT 1;
    END $$
    DELIMITER ;
    