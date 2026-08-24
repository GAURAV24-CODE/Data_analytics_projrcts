SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT order_id) AS orders_with_items
FROM order_items;

SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT order_id) AS orders_with_payments
FROM payments;


SELECT
    COUNT(*) AS mismatched_payments
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
WHERE o.total_amount <> p.amount;



SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS null_customer_ids,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS null_order_dates,
    COUNT(*) FILTER (WHERE total_amount IS NULL) AS null_order_totals
FROM orders;



SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE order_status <> 'Cancelled';