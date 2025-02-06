{{config(materialized='table')}}
 
select
orderid ,
Lineno ,
Shipperid ,
customerid ,
Productid ,
Employeeid ,
cast(substring(ShipmentDate,1,9) as date) as ShipmentDate ,
Status  from {{source('raw_qwt','raw_shipments')}}