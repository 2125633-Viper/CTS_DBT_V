{{config(materialized='table')}}
 
select
office as office,
office_address as address,
postal_code as postal_code,
office_city as officecity,
OfficeStateProvince as stateProvince,
OfficePhone as phone,
OfficeFax as fax,
Officecountry as country
from {{source('raw_qwt','raw_offices')}}