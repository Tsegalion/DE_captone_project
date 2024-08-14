-- Final average delivery time model
{{ config(materialized='table') }}

SELECT
    order_id,
    delivery_time_days
FROM
    {{ ref('int_avg_delivery_time') }}
