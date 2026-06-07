-- Create separate table for delivered orders
CREATE TABLE orders_delivered AS
SELECT *
FROM orders
WHERE order_status = 'delivered';

-- 1 Monthly revenue, order count, and AOV over time
SELECT
    DATE_FORMAT(o.order_purchase_timestamp, '%b') AS month,
    YEAR(o.order_purchase_timestamp) AS year,
    MONTH(o.order_purchase_timestamp) AS month_num,
    ROUND(SUM(oi.price)) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS order_count,
    ROUND(AVG(oi.price)) AS average_order_value
FROM orders_delivered o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_purchase_timestamp >= '2017-01-01'
GROUP BY year, month, month_num
ORDER BY year, month_num;


-- 2 Product Performance
-- Revenue, items sold, and AOV per product category
SELECT 
	t.product_category_name_english AS category_name, 
    COUNT(*) AS items_sold,
    ROUND(AVG(price)) AS avg_order_value,
    ROUND(SUM(price)) AS total_revenue
FROM products p
JOIN order_items oi ON  p.product_id = oi.product_id
JOIN orders_delivered o ON oi.order_id = o.order_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
WHERE o.order_purchase_timestamp >= '2017-01-01'
GROUP BY category_name
ORDER BY total_revenue DESC;

-- Monthly revenue, items sold, and AOV per product category over time
SELECT 
	DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
	t.product_category_name_english AS category_name, 
    COUNT(*) AS items_sold,
    ROUND(AVG(price)) AS avg_order_value,
    ROUND(SUM(price)) AS total_revenue
FROM products p
JOIN order_items oi ON  p.product_id = oi.product_id
JOIN orders_delivered o ON oi.order_id = o.order_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
WHERE o.order_purchase_timestamp >= '2017-01-01'
GROUP BY month, category_name
ORDER BY month, total_revenue DESC;

-- Quarterly revenue, items sold, and AOV per product category over time
SELECT 
	YEAR(o.order_purchase_timestamp) AS year,
	QUARTER(o.order_purchase_timestamp) AS quarter,
	t.product_category_name_english AS category_name, 
    COUNT(*) AS items_sold,
    ROUND(AVG(price)) AS avg_order_value,
    ROUND(SUM(price)) AS total_revenue
FROM products p
JOIN order_items oi ON  p.product_id = oi.product_id
JOIN orders_delivered o ON oi.order_id = o.order_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
WHERE o.order_purchase_timestamp >= '2017-01-01'
GROUP BY year, quarter, category_name
ORDER BY year, quarter, total_revenue DESC;


-- 3 Customer Behavior
-- One-time vs. repeat customers — how does their AOV and order frequency differ?
-- Time between first and second purchase
-- What % of revenue comes from repeat customers?

-- One-time vs. repeat customers
WITH customer_orders AS (
    SELECT
        c.customer_unique_id,
        COUNT(DISTINCT o.order_id) AS total_orders
    FROM orders_delivered o
    JOIN customers c ON o.customer_id = c.customer_id
    GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customer_count,
    ROUND(AVG(total_orders), 2) AS avg_orders
FROM customer_orders
GROUP BY customer_type;   

-- One-time vs. repeat customers — how does their AOV and order frequency differ?
WITH customer_orders AS(
	SELECT
		c.customer_unique_id,
		COUNT(DISTINCT o.order_id) AS total_orders,
		ROUND(SUM(oi.price)) AS total_spend,
		ROUND(AVG(oi.price)) AS avg_order_value
	FROM orders_delivered o
	JOIN customers c ON o.customer_id = c.customer_id
	JOIN order_items oi ON o.order_id = oi.order_id
	GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customer_count,
    ROUND(AVG(total_orders), 2) AS avg_orders,
    ROUND(AVG(avg_order_value)) AS avg_order_value,
    ROUND(AVG(total_spend)) AS avg_total_spend
FROM customer_orders
GROUP BY customer_type;  

-- Time between first and second purchase
WITH customer_purchases AS(
	SELECT
		c.customer_unique_id,
		o.order_purchase_timestamp,
		ROW_NUMBER() OVER (PARTITION BY c.customer_unique_id ORDER BY o.order_purchase_timestamp) AS order_rank
	FROM orders_delivered o
	JOIN customers c ON o.customer_id = c.customer_id
)
SELECT 
	ROUND(AVG(DATEDIFF(second_order, first_order))) AS days_between_orders
FROM(
	SELECT
		customer_unique_id,
		MAX(CASE WHEN order_rank = 1 THEN order_purchase_timestamp END) AS first_order,
		MAX(CASE WHEN order_rank = 2 THEN order_purchase_timestamp END) AS second_order
	FROM customer_purchases
	GROUP BY customer_unique_id
	HAVING second_order IS NOT NULL
) AS ranked;

-- What % of revenue comes from repeat customers?
WITH customer_orders AS(
	SELECT
		c.customer_unique_id,
		COUNT(DISTINCT o.order_id) AS total_orders,
		ROUND(SUM(oi.price)) AS total_spend,
		ROUND(AVG(oi.price)) AS avg_order_value
	FROM orders_delivered o
	JOIN customers c ON o.customer_id = c.customer_id
	JOIN order_items oi ON o.order_id = oi.order_id
	GROUP BY c.customer_unique_id
)
SELECT
    CASE
        WHEN total_orders = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS customer_count,
	ROUND(COUNT(*)/SUM(COUNT(*)) OVER(), 2) AS customer_share,
    ROUND(AVG(total_orders), 2) AS avg_orders,
    ROUND(AVG(avg_order_value)) AS avg_order_value,
    ROUND(AVG(total_spend)) AS avg_total_spend,
    ROUND(SUM(total_spend)) AS total_revenue,
    ROUND(SUM(total_spend) / SUM(SUM(total_spend)) OVER (),2) AS revenue_pct
FROM customer_orders
GROUP BY customer_type;  


-- 4 Regional Results

-- Revenue by Brazilian state
SELECT 
	customer_state AS state,
    ROUND(SUM(price)) AS total_revenue,
    COUNT(*) AS total_orders,
    ROUND(AVG(price)) AS avg_order_value
FROM orders_delivered o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY state
ORDER BY total_revenue DESC;

-- Top product categories per region
SELECT 
	CASE
		WHEN customer_state IN ('SP','RJ', 'ES', 'MG') THEN 'Southeast'
        WHEN customer_state IN ('PR','RS', 'SC') THEN 'South'
        WHEN customer_state IN ('MT', 'MS', 'GO', 'DF') THEN 'Central-West'
        WHEN customer_state IN ('BA', 'SE', 'AL', 'PE', 'PB', 'RN', 'CE', 'PI', 'MA') THEN 'Northeast'
        WHEN customer_state IN ('AM', 'PA', 'RO', 'RR', 'AC', 'AP', 'TO') THEN 'North'
        ELSE 'Unknown'
	END AS region,
	t.product_category_name_english AS category_name,
    ROUND(SUM(price)) AS total_revenue
FROM orders_delivered o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
GROUP BY region, category_name
ORDER BY region, total_revenue DESC;


WITH region_category AS (
	SELECT 
		CASE
			WHEN customer_state IN ('SP','RJ', 'ES', 'MG') THEN 'Southeast'
			WHEN customer_state IN ('PR','RS', 'SC') THEN 'South'
			WHEN customer_state IN ('MT', 'MS', 'GO', 'DF') THEN 'Central-West'
			WHEN customer_state IN ('BA', 'SE', 'AL', 'PE', 'PB', 'RN', 'CE', 'PI', 'MA') THEN 'Northeast'
			WHEN customer_state IN ('AM', 'PA', 'RO', 'RR', 'AC', 'AP', 'TO') THEN 'North'
			ELSE 'Unknown'
		END AS region,
		t.product_category_name_english AS category_name,
		ROUND(SUM(price)) AS total_revenue
	FROM orders_delivered o
	JOIN customers c ON o.customer_id = c.customer_id
	JOIN order_items oi ON o.order_id = oi.order_id
	JOIN products p ON oi.product_id = p.product_id
	JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
	GROUP BY region, category_name
),
ranked AS (
	SELECT *,
		RANK() OVER (PARTITION BY region ORDER BY total_revenue DESC) AS rank_in_region
	FROM region_category
)
SELECT region, category_name, total_revenue, rank_in_region
FROM ranked
WHERE rank_in_region <= 5
ORDER BY region, rank_in_region;


-- 5 Refund/Return Rates
-- Order cancellation by product category
-- Do higher-priced categories get cancelled more? (mirrors the MacBook/ThinkPad finding)
SELECT 
	t.product_category_name_english AS category_name,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(100 * SUM(CASE WHEN o.order_status = 'canceled' THEN 1 ELSE 0 END) / COUNT(*), 2) AS cancellation_rate,
    ROUND(AVG(oi.price)) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
GROUP BY category_name
ORDER BY cancellation_rate DESC; 


-- 6 Delivery & Reviews
-- Does delivery time correlate with review score?
SELECT
	CASE
		WHEN TIMESTAMPDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date) > 0 THEN 'Late'
        ELSE 'On Time'
	END AS delivery_status,
    ROUND(AVG(review_score), 2) AS avg_review_score,
    ROUND(AVG(TIMESTAMPDIFF(DAY, order_estimated_delivery_date, order_delivered_customer_date))) AS avg_delivery_days,
    COUNT(*) AS total_orders
FROM orders_delivered o
JOIN order_reviews ON o.order_id = order_reviews.order_id
WHERE order_delivered_customer_date IS NOT NULL AND order_estimated_delivery_date IS NOT NULL
GROUP BY delivery_status;


SELECT ROUND(AVG(review_score), 2) AS overall_avg
FROM order_reviews;

-- Which product categories get the worst reviews?
SELECT 
	t.product_category_name_english AS category_name,
    ROUND(AVG(review_score), 1) AS avg_review_score,
    COUNT(*) AS total_orders
FROM orders_delivered o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
JOIN product_category_name_translation t ON p.product_category_name = t.product_category_name
JOIN order_reviews orv ON o.order_id = orv.order_id
GROUP BY category_name
HAVING total_orders > 100
ORDER BY avg_review_score
LIMIT 5
	
