SELECT COUNT(DISTINCT order_id) AS total_orders
FROM `macro-shadow-352210.olist.orders`


SELECT payment_type, SUM(payment_value) AS total_revenue
FROM `macro-shadow-352210.olist.order_payments`
GROUP BY payment_type
ORDER BY total_revenue DESC



SELECT 
  seller_id, 
  SUM(price) AS total_revenue 
FROM 
  `macro-shadow-352210.olist.order_items` 
GROUP BY 
  seller_id 
ORDER BY 
  total_revenue DESC 
LIMIT 10;



SELECT 
  AVG(TIMESTAMP_DIFF(order_delivered_customer_date, order_approved_at, DAY)) AS avg_delivery_time_in_days
FROM
  `macro-shadow-352210.olist.orders` 
WHERE 
  order_status = 'delivered';



SELECT 
  EXTRACT(YEAR FROM order_purchase_timestamp) AS year, 
  COUNT(*) AS total_orders
FROM 
  `macro-shadow-352210.olist.orders`
GROUP BY 
  year



SELECT product_id, 
    COUNT(*) AS total_reviews
FROM 
  `macro-shadow-352210.olist.order_reviews` r
JOIN
  `macro-shadow-352210.olist.order_items` i
ON 
  r.order_id = i.order_id
GROUP BY 
  product_id
ORDER BY
  total_reviews DESC
LIMIT 
  10



SELECT 
  customer_city, 
  COUNT(*) AS order_count 
FROM 
  `macro-shadow-352210.olist.orders` o
JOIN 
  `macro-shadow-352210.olist.customers` c
ON
 o.customer_id = c.customer_id
GROUP BY 
  customer_city
ORDER BY 
  order_count DESC 
LIMIT 1;



SELECT 
  product_category_name, 
  SUM(price) AS total_revenue 
FROM 
  `macro-shadow-352210.olist.order_items` oi
JOIN 
  `macro-shadow-352210.olist.products` p
ON 
  oi.product_id = p.product_id  
GROUP BY 
  product_category_name 
ORDER BY 
  total_revenue DESC
LIMIT 
  10;



SELECT 
  p.product_id, 
  product_category_name, 
  COUNT(*) AS purchase_count 
FROM 
  `macro-shadow-352210.olist.order_items`  oi
JOIN 
  `macro-shadow-352210.olist.products` p
ON 
  oi.product_id = p.product_id 
GROUP BY 
  product_id, 
  product_category_name 
ORDER BY 
  purchase_count DESC 
LIMIT 5;



SELECT 
  o.order_id,
  order_purchase_timestamp,
  order_status,
  CASE 
    WHEN payment_value <= 50 THEN 'Low'
    WHEN payment_value > 50 AND payment_value <= 100 THEN 'Medium'
    WHEN payment_value > 100 THEN 'High'
    ELSE 'Unknown'
  END AS payment_level
FROM 
  `macro-shadow-352210.olist.order_payments` op
JOIN 
  `macro-shadow-352210.olist.orders` o
ON 
  op.order_id = o.order_id