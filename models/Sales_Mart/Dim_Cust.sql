{{config(materialized = 'view', schema = 'Sales_Mart_Dev')}}

select *   from {{ref('Trf_Cust')}}