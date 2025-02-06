{{ config(materialized='incremental', unique_key=['Orderid', 'lineno']) }}

select o1.*, o2.order_date
from {{ source('raw_qwt', 'raw_order_details') }} as o1
inner join {{ source('raw_qwt', 'raw_orders') }} as o2 on o1.OrderID = o2.order_id

{% if is_incremental() %}
where o2.order_date > (select max(order_date) from {{ this }} )
{% endif %}
