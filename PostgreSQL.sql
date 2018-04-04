1.  CREATE DATABASE shop;

2.  CREATE USER shop;
    GRANT ALL PRIVILEGES ON DATABASE shop TO shop;

3.  CREATE USER viewer;
    N/A

4.  \connect shop;
    CREATE TABLE category ( id serial primary key, 
                            category varchar(20) NOT NULL,
                            UNIQUE (category));

5.  INSERT INTO category (category) VALUES ('bakery'), ('fruit'), ('floral'), ('seafood');

6.  CREATE TABLE goods ( id serial primary key,
                         name varchar(15) NOT NULL,
                         category varchar(20) NOT NULL,
                         price numeric(10, 2) NOT NULL,
                         UNIQUE(name));

7.  INSERT INTO goods (name, category, price) VALUES ('strawberry', 'fruit',    1.00),
                                                     ('cookie',     'bakery',   1.00),
                                                     ('lily',       'floral',   1.00),
                                                     ('cherry',     'fruit',    1.00),
                                                     ('lemon',      'fruit',    1.00),
                                                     ('lilac',      'floral',   1.00),
                                                     ('catfish',    'seafood',  1.00),
                                                     ('lavender',   'floral',   1.00),
                                                     ('brownie',    'bakery',   1.00),
                                                     ('salmon',     'seafood',  1.00);

8.  UPDATE goods SET price=3.50 WHERE id=1;

9.  UPDATE goods SET price=price+price*0.1;

10. DELETE FROM goods WHERE id=2;
    UPDATE goods SET id=id-1 WHERE id>1;

11. SELECT * FROM goods ORDER BY name ASC;
    SELECT * FROM goods ORDER BY name DESC;

12. SELECT * FROM goods ORDER BY price DESC;

13. SELECT * FROM goods ORDER BY id, price DESC LIMIT 3;

14. SELECT * FROM goods ORDER BY price,id ASC LIMIT 3;

15. SELECT * FROM goods ORDER BY price DESC LIMIT 3 OFFSET 3;

16. SELECT name FROM goods ORDER BY price DESC LIMIT 1;

17. SELECT name FROM goods ORDER BY price,id ASC LIMIT 1;

18. SELECT id FROM goods ORDER BY id DESC LIMIT 1;

19. SELECT AVG(price) FROM goods;

20. CREATE OR REPLACE VIEW goods_view AS SELECT id, name, category, price FROM goods ORDER BY id, price DESC LIMIT 3;