1.  CREATE DATABASE shop;

2.  CREATE USER shop;
    GRANT ALL PRIVILEGES ON DATABASE shop TO shop;

3.  CREATE USER viewer;
    N/A

4.  \connect shop;
    CREATE TABLE category ( id serial primary key, 
                            category varchar(20) NOT NULL);

5.  INSERT INTO category (category) VALUES ('bakery'), ('fruit'), ('floral'), ('seafood');

6.  CREATE TABLE goods ( id serial, 
                         name varchar(10) NOT NULL,
                         category varchar(20) NULL , 
                         price real NOT NULL);

7.  INSERT INTO goods (id, name, price) VALUES  (1, 'brownie', 1.00), 
                                                (1, 'cookie', 1.00), 
                                                (2, 'strawberry', 1.00), 
                                                (2, 'cherry', 1.00), 
                                                (2, 'lemon', 1.00), 
                                                (3, 'lily', 1.00), 
                                                (3, 'lilac', 1.00), 
                                                (3, 'lavender', 1.00),
                                                (4, 'catfish', 1.00), 
                                                (4, 'salmon', 1.00);


8.  Обновить цену первого товара — 3.50
9.  Увеличить цену всех товаров на 10%.
10. Удалить товар № 2.
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
    
    bakery:
        bread, brownie, cookie
    fruit:
        strawberry, cherry, lemon
    floral:
        lily, lilac, lavender
    seafood:
        salmon, catfish, shrimp