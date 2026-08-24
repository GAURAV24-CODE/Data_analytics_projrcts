INSERT INTO payments
(
    order_id,
    payment_date,
    payment_method,
    payment_status,
    amount
)
SELECT
    order_id,

    order_date
        + FLOOR(random() * 6)::INT,

    (
        ARRAY[
            'UPI',
            'Credit Card',
            'Debit Card',
            'Net Banking',
            'Cash on Delivery'
        ]
    )[FLOOR(random() * 5 + 1)::INT],

    CASE
        WHEN order_status = 'Cancelled' THEN 'Refunded'
        WHEN order_status = 'Processing' THEN 'Pending'
        ELSE 'Paid'
    END,

    total_amount

FROM orders;



SELECT COUNT(*) AS total_payments
FROM payments;


SELECT *
FROM payments
ORDER BY payment_id
LIMIT 10;


