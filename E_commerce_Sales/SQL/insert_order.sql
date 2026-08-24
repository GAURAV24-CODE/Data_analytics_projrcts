INSERT INTO orders
(
    customer_id,
    order_date,
    order_status,
    shipping_city,
    shipping_state,
    total_amount
)
SELECT
    c.customer_id,

    DATE '2024-01-01'
        + floor(random() * 974)::int,

    (
        ARRAY[
            'Completed',
            'Completed',
            'Completed',
            'Completed',
            'Shipped',
            'Processing',
            'Cancelled'
        ]
    )[floor(random() * 7 + 1)::int],

    c.city,
    c.state,

    0
FROM generate_series(1, 5000) AS gs
CROSS JOIN LATERAL (
    SELECT customer_id, city, state
    FROM customers
    ORDER BY random()
    LIMIT 1
) c;



SELECT COUNT(*) AS total_orders
FROM orders;


SELECT *
FROM orders
ORDER BY order_id
LIMIT 10;