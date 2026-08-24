-- ============================================================
-- STAGE 5.1 — OVERALL BUSINESS KPIs
-- ============================================================
-- What does this query find?
-- 1. Total number of valid orders
-- 2. Number of unique customers
-- 3. Total revenue
-- 4. Average Order Value (AOV)
SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(total_amount), 2) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders
WHERE order_status <> 'Cancelled';


-- ============================================================
-- STAGE 5.2 — ORDER STATUS ANALYSIS
-- ============================================================
-- What does this query find?
-- It shows how many orders are in each status and
-- what percentage of all orders each status represents.
SELECT
    order_status,

    COUNT(*) AS order_count,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM orders
GROUP BY order_status
ORDER BY order_count DESC;

-- ============================================================
-- STAGE 5.3 — MONTHLY REVENUE ANALYSIS
-- ============================================================
-- What does this query find?
-- It shows monthly sales performance.

SELECT
    DATE_TRUNC('month', order_date)::DATE AS month,

    COUNT(*) AS total_orders,

    ROUND(SUM(total_amount), 2) AS revenue
FROM orders
WHERE order_status <> 'Cancelled'
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

-- ============================================================
-- STAGE 5.4 — TOP 10 PRODUCTS BY REVENUE
-- ============================================================
-- What does this query find?
-- It identifies the 10 products generating the most revenue.
SELECT
    p.product_name,

    SUM(oi.quantity) AS units_sold,

    ROUND(
        SUM(
            oi.quantity
            * oi.unit_price
            * (1 - oi.discount / 100)
        ),
        2
    ) AS revenue

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

JOIN orders o
    ON oi.order_id = o.order_id

WHERE o.order_status <> 'Cancelled'

GROUP BY
    p.product_id,
    p.product_name

ORDER BY revenue DESC

LIMIT 10;



-- ============================================================
-- STAGE 5.5 — REVENUE BY CATEGORY
-- ============================================================
-- What does this query find?
-- It shows which product categories generate the most revenue.
SELECT
    c.category_name,

    SUM(oi.quantity) AS units_sold,

    ROUND(
        SUM(
            oi.quantity
            * oi.unit_price
            * (1 - oi.discount / 100)
        ),
        2
    ) AS revenue

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

JOIN categories c
    ON p.category_id = c.category_id

JOIN orders o
    ON oi.order_id = o.order_id

WHERE o.order_status <> 'Cancelled'

GROUP BY
    c.category_id,
    c.category_name

ORDER BY revenue DESC;

-- ============================================================
-- STAGE 5.6 — TOP 10 CUSTOMERS
-- ============================================================
-- What does this query find?
-- It identifies customers who spend the most money.
SELECT
    c.customer_id,

    c.first_name,

    c.last_name,

    COUNT(o.order_id) AS total_orders,

    ROUND(
        SUM(o.total_amount),
        2
    ) AS total_spent

FROM customers c

JOIN orders o
    ON c.customer_id = o.customer_id

WHERE o.order_status <> 'Cancelled'

GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name

ORDER BY total_spent DESC

LIMIT 10;




