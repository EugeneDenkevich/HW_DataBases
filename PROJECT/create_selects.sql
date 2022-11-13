/* 
	There are we have some selects with usefull comments. Do it after running all the previous files.
*/
	
	-- 1. Who bought what and how much? Use view total_products.
	
		SELECT * FROM total_products;

	-- 2. Some interesting information. Use view interesting_information
    
		SELECT * FROM interesting_information;
	
    -- 3. Let's check what do we have at the moment for Helen Horovez. Use triggers check_product_count and stop_update_purchase:
    
		SELECT * FROM total_products WHERE Client='Helen Horovez'; /* If you get an empty table try to create and fiil tables again. */ 
    
		-- Helen can try to buy beef
		INSERT INTO purchase
		(client_id, product_id)
		VALUES
		(8, 10);
		-- and she succeeded in doing it.
        
		-- Checking after:
		SELECT * FROM total_products WHERE Client='Helen Horovez';
		
		-- But now she try to do some forbidden. As you remember we forbit Helen to buy cookies by procedure check_product_count.
		INSERT INTO purchase
		(client_id, product_id)
		VALUES
		(8, 11);
		-- As expected it didn't happen. 
        
		 -- Checking after:
		SELECT * FROM total_products WHERE Client='Helen Horovez';
        /* No cookies for Helen */
		
		-- If Eugene Alhovik will try to trick us so it's a quite normal.
        -- check before
		SELECT * FROM total_products WHERE Client='Eugene Alhovik';
        -- then update
		UPDATE purchase SET product_id=11
		WHERE client_id=(SELECT DISTINCT id_client FROM client
		WHERE firstname='Eugene' AND lastname='Alhovik')
		LIMIT 1;
		
		-- Add now somthing has changed to "cookie"
		SELECT * FROM total_products WHERE Client='Eugene Alhovik';
			
		-- But we can't allowed to Helen to do it! We created a procedure stop_update_purchase for this case.
		UPDATE purchase SET product_id=11
		WHERE client_id=(SELECT DISTINCT id_client FROM client
		WHERE firstname='Helen' AND lastname='Horovez')
		LIMIT 1;
		
		-- No cookies for Helen. Off course if she didn't buy it before in a create_inserts file.
		SELECT * FROM total_products WHERE Client='Helen Horovez';

	-- 4. Insert *** if we try to add new client without firstname or lastname or each of it. Use a trigger check_if_noname:
        
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
		SELECT id_client, firstname, lastname FROM client ORDER BY id_client;
	
    -- 5. As we can delete client with his purchases by help of cascade deleting
	--    so let's insert him into an additional table. Use a trigger save_deleted_client:    
       
		-- Checking...
		SELECT * FROM total_products ORDER BY Client;
		SELECT * FROM deleted_client;
		
		-- Make some delete-magick...
		DELETE FROM client WHERE firstname='Eugene' AND lastname='Denkevich' LIMIT 1;
		-- or
		DELETE FROM client WHERE firstname='Leonid' AND lastname='Borushko';
		-- or someone who bought at least something! =)
		
		-- Look again
		SELECT * FROM total_products ORDER BY Client;
		SELECT * FROM deleted_client;
    
    -- 6. It returns who bought pointed product and how many times. Use a procedure get_cliets_who_bought_product_some_number_of_times.

		CALL get_cliets_who_bought_product_some_number_of_times('Potatoes');

	-- 7. Split all the clients by discount size Use a procedure split_by_discount:

		CALL split_by_discount(10);
    
    -- 8. Find out how many times a particular product was bought. Use a procedure get_number_of_purchased_product.
    
    -- Assign the result of this function to a varible
		CALL get_number_of_purchased_product('Potatoes', @num);
		-- And display it
		SELECT @num;
    
    -- 9. Assign the discount to a particular client. Use a procedure set_discount.
    
		-- Set 100% discount to Maxim Novik (why not? you can set that number you want)
		CALL set_discount('Maxim Novik', 100);
        
		-- Check if it works. If you deleted this client before, just create everything again.
		SELECT CONCAT(firstname, ' ', lastname) AS Client, discount_percent AS Discount
		FROM client WHERE firstname='Maxim' AND lastname='Novik';
    
    -- 10. Where is this product? Use a procedure where_prod.
    
		-- So lets find out where are the apples?
		CALL where_prod('Apples');
    
    -- 11. Find a client by email. Use view find_client_by_email.
    
		SELECT * FROM find_client_by_email WHERE Email='ivanivan@mail.com';
        
	-- 12. And some transaction in the end for a full picture.
    
		-- Decrement a quantity of cucumbers.
		START TRANSACTION;
			SELECT prod_name AS Product, quantity AS Quantity FROM product;
			UPDATE product SET quantity=quantity-1 WHERE prod_name='Cucumbers';
			SELECT prod_name AS Product, quantity AS Quantity FROM product;
		COMMIT;


-- That's all. Thank's for attention! =)