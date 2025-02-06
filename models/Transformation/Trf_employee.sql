{{config(materialized = 'table', schema = 'Transformation_Dev')}}


select 
emp.EMPID,
emp.FIRST_NAME,
emp.LAST_NAME,
emp.TITLE,
emp.HIRE_DATE,
IFF(emp.extension = '-', 'NA', emp.extension) as extension,
emp.YEAR_SALARY,
iff(mng.FIRST_NAME is null , emp.FIRST_NAME,mng.FIRST_NAME) as Manager_name,
iff(mng.TITLE is null , emp.TITLE, mng.TITLE) as Manager_title,
ofc.address,
ofc.OFFICECITY,
ofc.country
from {{ref('STG_Employes')}} as emp 
inner join 
{{ref('STG_Employes')}} as mng 
on emp.REPORTS_TO = mng.EMPID
left join {{ref('STG_Office')}} as Ofc 
on ofc.OFFICE = emp.OFFICE
