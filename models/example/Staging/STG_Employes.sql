{{ config(materialized='table') }}

--select * from qwt_dev.raw_dev.raw_customers 

select * from {{source('raw_qwt','Raw_Employee')}}