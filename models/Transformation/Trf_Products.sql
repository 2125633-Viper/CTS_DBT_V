{{config(materialized='table',schema='TRANSFORMATION_DEV')}}
 
select
p.Product_id,
p.Productname,
s.CompanyName,
s.ContactName,
s.Address,
s.City,
s.Country,
c.CategoryName,
p.quantityperunit,
p.unitcost,
p.unitprice,
p.unitsinstock,
p.unitsonorder,
TO_DECIMAL((p.unitcost-p.unitprice), 9,2) as Profit,
IFF(p.unitsinstock-p.unitsonorder < 0,'not available','available') as productavailability
 
 
 
 from {{ref('STG_products')}} as p
left join {{ref('Trf_Suppliers')}} as s on s.SupplierID = p.SUPPLIERID
left join {{ref('Lkp_category')}} as c on p.categoryid = c.CategoryID
 