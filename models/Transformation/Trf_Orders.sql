{{config(materialized = 'table', schema = 'Transformation_Dev')}}

select
O.ORDER_ID,
OD.LINENO,
O.CUSTOMER_ID,
O.EMPLOYERE_ID,
O.SHIPPER_ID,
OD.productid,
OD.quantity,
OD.unitprice,
OD.discount,
OD.ORDER_DATE,
to_decimal((OD.UnitPrice * OD.Quantity) * (1-OD.Discount), 9, 2 ) as linesalesamount,
to_decimal(P.UnitCost * OD.Quantity,9,2) as costofgoodssols,
to_decimal(((OD.UnitPrice * OD.Quantity) * (1-OD.Discount)) - (P.UnitCost * OD.Quantity), 9, 2 ) as margin
 

 from {{ref('STG_Orders')}} as O  inner join {{ref('STG_Order_Details')}} as OD 
on O.Order_ID = OD.ORDERID
inner Join {{ref('STG_products')}} as P on OD.PRODUCTID = P.PRODUCT_ID