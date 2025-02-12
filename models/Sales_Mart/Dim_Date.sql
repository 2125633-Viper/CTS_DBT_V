{{config(materialized = 'view',schema = 'Sales_Mart_Dev')}}

{% set MIN_ODATE = Get_Min_ODate() %}
{% set MAX_ODATE = Get_MAX_ODate() %}

{{dbt_date.get_date_dimension(MIN_ODATE,MAX_ODATE)}}