{{config(materialized='view',schema = 'REPORTING_DEV')}}

select 
emp.COUNTRY,
d.COMAPANYNAME,
d.CONTACTNAME,
count(FO.ORDER_ID) as Total_orders,
sum(FO.QUANTITY) as Total_Quantity,
sum(FO.LINESALESAMOUNT) as Total_Sales,
avg(FO.MARGIN) as Average_Margin
from 
{{ref('Dim_Cust')}} as D 
inner join {{ref('Fact_Orders')}} as FO on D.CUSTOMER_ID = FO.CUSTOMER_ID
inner join {{ref('Dim_Employes')}}  as Emp on emp.EMPID = FO.EMPLOYERE_ID 
where emp.COUNTRY = '{{var('v_country','France')}}'
group by emp.COUNTRY,d.COMAPANYNAME,d.CONTACTNAME