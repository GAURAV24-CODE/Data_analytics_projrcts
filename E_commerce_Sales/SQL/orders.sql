INSERT INTO order_items
(
    order_id,
    product_id,
    quantity,
    unit_price,
    discount
)
SELECT
    o.order_id,
    p.product_id,
    FLOOR(random() * 4 + 1)::INT AS quantity,
    p.price AS unit_price,
    ROUND((random() * 20)::NUMERIC, 2) AS discount
FROM orders o
CROSS JOIN LATERAL (
    SELECT product_id, price
    FROM products
    ORDER BY random()
    LIMIT 1
) p
CROSS JOIN LATERAL generate_series(
    1,
    FLOOR(random() * 3 + 1)::INT
) gs;



SELECT COUNT(*) AS total_order_items
FROM order_items;




SELECT *
FROM order_items
ORDER BY order_item_id
LIMIT 10;


UPDATE orders o
SET total_amount = totals.order_total
FROM (
    SELECT
        order_id,
        ROUND(
            SUM(
                quantity * unit_price * (1 - discount / 100)
            ),
            2
        ) AS order_total
    FROM order_items
    GROUP BY order_id
) totals
WHERE o.order_id = totals.order_id;

SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount
FROM orders
ORDER BY order_id
LIMIT 10;


SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT order_id) AS orders_with_items
FROM order_items;