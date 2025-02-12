{{config(materialized = 'view', schema = 'REPORTING_DEV')}}

select
concat(e.FIRST_NAME,e.LAST_NAME) as empname,
count(c.CUSTOMER_ID) total_Count,
count(p.PRODUCT_ID) Total_product,
sum(f.LINESALESAMOUNT) as SUM_AMT
from {{ref("Fact_Orders")}} f left outer join {{ref("Dim_Cust")}} c on f.CUSTOMER_ID = c.CUSTOMER_ID
left outer join {{ref("Dim_Employes")}} e on f.EMPLOYERE_ID = e.EMPID
left outer join {{ref("Dim_products")}} p on f.PRODUCTID = p.PRODUCT_ID
group by concat(e.FIRST_NAME,e.LAST_NAME)
order by sum(f.LINESALESAMOUNT) desc