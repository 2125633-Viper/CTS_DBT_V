{{config(materialized = 'table', schema = 'Transformation_Dev')}}
 
select
GET(XMLGET(contacts_info, 'SupplierID'), '$') as SupplierID,
GET(XMLGET(contacts_info, 'CompanyName'), '$')::varchar as CompanyName,
GET(XMLGET(contacts_info, 'ContactName'), '$')::varchar as ContactName,
GET(XMLGET(contacts_info, 'Address'), '$')::varchar as Address,
GET(XMLGET(contacts_info, 'City'), '$')::varchar as City,
GET(XMLGET(contacts_info, 'PostalCode'), '$')::varchar as PostalCode,
GET(XMLGET(contacts_info, 'Country'), '$')::varchar as Country,
GET(XMLGET(contacts_info, 'Phone'), '$')::varchar as Phone,
GET(XMLGET(contacts_info, 'Fax'), '$')::varchar as Fax
 
from
 
{{ref('STG_Suppliers')}}