1.  sqlite3 shop.db

2.  N/A

3.  N/A

4.  CREATE TABLE category (category VARCHAR(20) UNIQUE);

5.  INSERT INTO category VALUES ('bakery'), ('fruit'), ('floral'), ('seafood');

6.  CREATE TABLE goods (name VARCHAR(15) UNIQUE, category VARCHAR(20), price DECIMAL(10, 2));

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

8.  UPDATE goods SET price=3.50 WHERE ROWID=1;

9.  UPDATE goods SET price=price+price*0.1;

10. DELETE FROM goods WHERE ROWID=2;
    UPDATE goods SET ROWID=ROWID-1 WHERE ROWID>1;

11. SELECT * FROM goods ORDER BY name ASC;
    SELECT * FROM goods ORDER BY name DESC;

12. SELECT * FROM goods ORDER BY price DESC;

13. SELECT * FROM goods ORDER BY price DESC LIMIT 3;

14. SELECT * FROM goods ORDER BY price ASC LIMIT 3;

15. SELECT * FROM goods ORDER BY price ASC LIMIT 3 OFFSET 3;

16. SELECT name FROM goods ORDER BY price DESC LIMIT 1;

17. SELECT name FROM goods ORDER BY price ASC LIMIT 1;

18. SELECT ROWID FROM goods ORDER BY ROWID DESC LIMIT 1;

19. SELECT AVG(price) FROM goods;

20.  CREATE VIEW goods_view AS SELECT ROWID, name, category, price FROM goods ORDER BY price DESC LIMIT 3;