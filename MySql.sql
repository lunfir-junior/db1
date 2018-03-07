
1. 	CREATE DATABASE shop;

2. 	CREATE USER `shop`@`localhost`; 
	GRANT ALL PRIVILEGES ON shop TO `shop`@`localhost`;

3. 	CREATE USER `viewer`@`localhost`; 
	GRANT SELECT ON shop TO `viewer`@`localhost`;

4. 	USE shop; // for mysql shell
	CREATE TABLE category (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, category VARCHAR(15) NOT NULL, UNIQUE KEY(category));

5. 	INSERT INTO category (category) VALUES ('bakery'), ('fruit'), ('floral'), ('seafood');

6. 	CREATE TABLE goods (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name VARCHAR(15) NOT NULL, category VARCHAR(15) NULL, category_id INT, price DECIMAL(10, 2) NOT NULL, UNIQUE KEY(name));

7. 	INSERT INTO goods (category_id, name, price) VALUES  (1, 'brownie', 1.00), 
                                                		 (4, 'salmon', 1.00),
                                                		 (2, 'strawberry', 1.00), 
                                                		 (1, 'cookie', 1.00), 
                                                		 (2, 'cherry', 1.00), 
                                                		 (3, 'lily', 1.00), 
                                                		 (3, 'lavender', 1.00),
                                                		 (4, 'catfish', 1.00),
                                                		 (3, 'lilac', 1.00), 
                                                		 (2, 'lemon', 1.00); 

    UPDATE goods,category SET goods.category=category.category WHERE goods.category_id = category.id;



8. 	UPDATE goods SET price=3.50 WHERE id=1;

9. 	UPDATE goods SET price=price+price*0.1;

10. DELETE FROM goods WHERE id=2 LIMIT 1;
	UPDATE goods SET id=id-1 WHERE id>1;


11. Выбрать все товары с сортировкой по названию.

12. Выбрать все товары с сортировкой по убыванию цены.

13. Выбрать 3 самых дорогих товара.

14. Выбрать 3 самых дешевых товара.

15. Выбрать вторую тройку самых дорогих товаров (с 4 по 6).

16. Выбрать наименование самого дорогого товара.

17. Выбрать наименование самого дешевого товара.

18. Выбрать количество всех товаров.

19. Выбрать среднюю цену всех товаров.

20. Создать представление (create view) с отображением 3 самых дорогих товаров. 