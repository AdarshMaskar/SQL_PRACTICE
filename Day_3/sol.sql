WITH FIRST_ORDERS AS (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM customer_orders
    GROUP BY customer_id
),
order_flag AS (
    SELECT
        co.customer_id,
        co.order_id,
        co.order_date,
        fo.first_order_date,
        CASE
            WHEN co.order_date = fo.first_order_date THEN 1
            ELSE 0
        END AS first_order_flag,
        CASE
            WHEN co.order_date != fo.first_order_date THEN 1
            ELSE 0
        END AS repeat_order_flag
    FROM customer_orders co
    INNER JOIN FIRST_ORDERS fo
        ON co.customer_id = fo.customer_id
)
SELECT order_date, 
       SUM(first_order_flag) AS first_orders, 
       SUM(repeat_order_flag) AS repeat_orders
FROM order_flag
GROUP BY order_date;