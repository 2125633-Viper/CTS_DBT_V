{{config(materialized = 'view', schema = 'reporting_dev')}}

select DC.COMAPANYNAME , DC.CONTACTNAME,
min(FC.ORDER_DATE) as First_ODate,
min(DD.DAY_OF_WEEK) as First_Order_Day,
max(fc.ORDER_DATE) as Recent_ODate,
max(DD.DAY_OF_WEEK) as Recent_Order_Day,
sum(FC.QUANTITY) as Total_Quantity,
sum(FC.LINESALESAMOUNT) as Total_Sales
from 
{{ref('Dim_Cust')}} as DC 
left join {{ref('Fact_Orders')}} as FC 
on DC.CUSTOMER_ID = FC.CUSTOMER_ID
left join {{ref('Dim_Date')}} as DD 
on DD.DATE_DAY = FC.ORDER_DATE
group by DC.COMAPANYNAME , DC.CONTACTNAME
order by Total_Sales DESC