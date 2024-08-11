-- Raw orders data with necessary joins
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_purchase_timestamp,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    c.customer_unique_id,
    c.customer_zip_code_prefix,
    c.customer_city,
    c.customer_state,
    oi.order_item_id,
    oi.product_id AS order_product_id,
    oi.shipping_limit_date,
    oi.price,
    oi.freight_value,
    p.product_category_name,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm,
    oi.seller_id,
    s.seller_zip_code_prefix,
    s.seller_city,
    s.seller_state,
    orr.review_id,
    orr.review_score,
    orr.review_comment_title,
    orr.review_comment_message,
    orr.review_creation_date,
    orr.review_answer_timestamp,
    op.payment_sequential,
    op.payment_type,
    op.payment_installments,
    op.payment_value
FROM
    raw_ecomm_data.orders AS o
JOIN
    raw_ecomm_data.customers AS c ON o.customer_id = c.customer_id
JOIN
    raw_ecomm_data.order_items AS oi ON o.order_id = oi.order_id
JOIN
    raw_ecomm_data.products AS p ON oi.product_id = p.product_id
JOIN
    raw_ecomm_data.sellers AS s ON oi.seller_id = s.seller_id
LEFT JOIN
    raw_ecomm_data.order_reviews AS orr ON o.order_id = orr.order_id
LEFT JOIN
    raw_ecomm_data.order_payments AS op ON o.order_id = op.order_id
