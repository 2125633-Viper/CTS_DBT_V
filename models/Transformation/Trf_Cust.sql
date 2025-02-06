{{config(materialized = 'table', schema = 'Transformation_Dev')}}
 
select
c.customer_id,
c.COMAPANYNAME,
c.contactname,
c.city,
c.country,
d.divisionname,
c.address,
c.fax,
c.phone,
c.postalcode,
IFF(c.stateprovince = '', 'NA', c.stateprovince) as stateprovincename
 
from
{{ref('STG_Customers')}} as c inner join {{ref('Lkp_Division')}} as d
on c.divisionid = d.divisionid