{{ config(materialized = 'incremental', unique_key = ['Order_ID']) }}

select * from {{source("raw_qwt",'raw_orders')}}
{% if is_incremental() %}
where order_date > (select max(order_date) from {{this}} )
{% endif %}