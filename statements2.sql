    -- 1. Вывести все товары и категорию, в которой они находятся.
    SELECT item.item_name, category.category_title FROM "item" INNER JOIN "category" ON item.category_id=category.category_id;

    -- 2. Вывести все товары из конкретного заказа.
    SELECT item__order.order_id, item.item_name FROM "item__order" INNER JOIN "item" ON item__order.order_id=2 AND item__order.item_id=item.item_id;
    -- add items quantity

    -- 3. Вывести все заказы с конкретной единицей товара.

    -- 4. Вывести все товары, заказанные за последний час.

    -- 5. Вывести все товары, заказанные за сегодня.

    -- 6. Вывести все товары, заказанные за вчера.

    -- 7. Вывести все товары из заданной категории, заказанные за последний час.

    -- 8. Вывести все товары из заданной категории, заказанные за сегодня.

    -- 9. Вывести все товары из заданной категории, заказанные за вчера.

    -- 10. Вывести все товары, названия которых начинаются с заданной последовательности букв (см. LIKE).

    -- 11. Вывести все товары, названия которых заканчиваются заданной последовательностью букв (см. LIKE).

    -- 12. Вывести все товары, названия которых содержат заданные последовательности букв (см. LIKE).

    -- 13. Вывести список категорий и количество товаров в каждой категории.

    -- 14. Вывести список всех заказов и количество товаров в каждом.

    -- 15. Вывести список всех товаров и количество заказов, в которых имеется этот товар.

    -- 16. Вывести список заказов, упорядоченный по дате заказа и суммарную стоимость товаров в каждом из них.

    -- 17. Вывести список товаров, цену, количество и суммарную стоимость каждого из них в заказе с заданным ID.

    -- 18. Для заданного ID заказа вывести список категорий, товары из которых присутствуют в этом заказе. Для каждой из категорий вывести суммарное количество и суммарную стоимость товаров.

    -- 19. Вывести список клиентов, которые заказывали товары из категории с заданным ID за последние 3 дня.

    -- 20. Вывести имена всех клиентов, производивших заказы за последние сутки.

    -- 21. Вывести всех клиентов, производивших заказы, содержащие товар с заданным ID.

    -- 22. Для каждой категории вывести урл загрузки изображения с именем category_image в формате 'http://img.domain.com/category/<category_id>.jpg' для включенных категорий, и 'http://img.domain.com/category/<category_id>_disabled.jpg' для выключеных.

    -- 23. Для товаров, которые были заказаны за все время во всех заказах общим количеством более X единиц, установить item_popular = TRUE, для остальных — FALSE.
    
    -- 24. Одним запросом для указанных ID категорий установить флаг category_enabled = TRUE, для остальных — FALSE. Не применять WHERE.