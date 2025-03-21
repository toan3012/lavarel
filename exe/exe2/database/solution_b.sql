1. SELECT users.user_id, users.user_name, orders.order_id FROM users JOIN orders WHERE users.user_id = orders.user_id;
2. SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS quantity
FROM users JOIN orders 
WHERE users.user_id = orders.user_id
GROUP BY users.user_id;
3. SELECT orders.order_id, COUNT(order_details.order_detail_id) AS quantity
FROM order_details JOIN orders 
WHERE order_details.order_id = orders.order_id
GROUP BY order_details.order_id;
4. SELECT orders.order_id, users.user_id, users.user_name, products.product_name 
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON order_details.order_id = orders.order_id
JOIN products ON products.product_id = order_details.product_id
GROUP BY orders.order_id, users.user_id, users.user_name, products.product_name;

5.SELECT users.user_id, users.user_name, COUNT(orders.order_id) AS quantity
FROM users JOIN orders ON users.user_id = orders.user_id
GROUP BY users.user_id, users.user_name ORDER BY quantity DESC LIMIT 7;

6.SELECT users.user_id, users.user_name, orders.order_id, products.product_name 
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON order_details.order_id = orders.order_id
JOIN products ON products.product_id = order_details.product_id
WHERE products.product_name LIKE '%Samsung%' OR products.product_name LIKE '%Apple%'
GROUP BY users.user_id, users.user_name, orders.order_id, products.product_name;

7. SELECT orders.order_id, users.user_id, users.user_name, SUM(products.product_price)
FROM users
JOIN orders ON users.user_id = orders.user_id
JOIN order_details ON order_details.order_id = orders.order_id
JOIN products ON products.product_id = order_details.product_id
GROUP BY orders.order_id, users.user_id, users.user_name;

8. SELECT o.order_id, o.user_id, o.user_name, o.total
FROM (
    SELECT orders.order_id, users.user_id, users.user_name, 
           SUM(products.product_price) AS total
    FROM users
    JOIN orders ON users.user_id = orders.user_id
    JOIN order_details ON order_details.order_id = orders.order_id
    JOIN products ON products.product_id = order_details.product_id
    GROUP BY orders.order_id, users.user_id, users.user_name
) AS o
WHERE o.total = (
    SELECT MAX(total)
    FROM (
         SELECT orders.order_id, users.user_id, users.user_name, SUM(products.product_price) AS total
         FROM users
         JOIN orders ON users.user_id = orders.user_id
         JOIN order_details ON order_details.order_id = orders.order_id
         JOIN products ON products.product_id = order_details.product_id
         GROUP BY orders.order_id, users.user_id, users.user_name
    ) AS t
    WHERE t.user_id = o.user_id
);

9. SELECT o.order_id, o.user_id, o.user_name, o.total
FROM (
    SELECT orders.order_id, users.user_id, users.user_name, 
           SUM(products.product_price) AS total
    FROM users
    JOIN orders ON users.user_id = orders.user_id
    JOIN order_details ON order_details.order_id = orders.order_id
    JOIN products ON products.product_id = order_details.product_id
    GROUP BY orders.order_id, users.user_id, users.user_name
) AS o
WHERE o.total = (
    SELECT MIN(total)
    FROM (
         SELECT orders.order_id, users.user_id, users.user_name, SUM(products.product_price) AS total
         FROM users
         JOIN orders ON users.user_id = orders.user_id
         JOIN order_details ON order_details.order_id = orders.order_id
         JOIN products ON products.product_id = order_details.product_id
         GROUP BY orders.order_id, users.user_id, users.user_name
    ) AS t
    WHERE t.user_id = o.user_id
);