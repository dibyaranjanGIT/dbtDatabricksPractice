WITH bronze_sales AS (
    SELECT sales_id, product_sk, customer_sk, gross_amount, payment_method, unit_price, quantity
    FROM {{ ref('bronze_sales') }}
) ,
bronze_products AS (
    SELECT product_sk, product_name, category
    FROM {{ ref('bronze_product') }}
) , 
bronze_customers AS (
    SELECT customer_id, customer_sk, first_name, last_name
    FROM {{ ref('bronze_customer') }}
) 
SELECT 
    s.sales_id,
    p.product_name,
    (s.unit_price * s.quantity) AS calculated_gross_amount,
    c.first_name || ' ' || c.last_name AS customer_name,
    s.gross_amount,
    s.payment_method
FROM bronze_sales s
JOIN bronze_products p ON s.product_sk = p.product_sk   
JOIN bronze_customers c ON s.customer_sk = c.customer_sk