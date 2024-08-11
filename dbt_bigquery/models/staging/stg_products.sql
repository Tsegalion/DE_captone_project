-- Raw products data with necessary joins
SELECT
    p.product_id,
    p.product_category_name,
    pct.product_category_name_english,
    p.product_name_length,
    p.product_description_length,
    p.product_photos_qty,
    p.product_weight_g,
    p.product_length_cm,
    p.product_height_cm,
    p.product_width_cm
FROM
    raw_ecomm_data.products AS p
JOIN
    raw_ecomm_data.product_category_name_translation AS pct
    ON p.product_category_name = pct.product_category_name