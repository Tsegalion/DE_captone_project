-- Aggregated sales by product category

SELECT
    p.product_category_name,
    p.product_category_name_english,
    SUM(o.price) AS total_sales,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM
    {{ ref('stg_orders') }} AS o
JOIN
    {{ ref('stg_products') }} AS p
    ON o.order_product_id = p.product_id
GROUP BY
    p.product_category_name,
    p.product_category_name_english
