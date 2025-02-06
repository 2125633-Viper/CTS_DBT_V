{{config(materialized = 'table', schema = 'Transformation_Dev')}}
 
 select ss.ORDERID,
ss.LINENO,
LKP.COMPANYNAME,
ss.SHIPMENTDATE,
ss.STATUS,
 from {{ref('shipments_snapshot')}} as SS 
 left join {{ref('Lkp_Shiper')}} as LKP on LKP.SHIPPERID = ss.SHIPPERID
 where ss.DBT_VALID_TO is null 
