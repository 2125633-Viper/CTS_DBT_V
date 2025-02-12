{% macro Get_Min_ODate() %}
 
{% set lineno_query %}
select  
Min(ORDER_DATE) as MIN_DATE
from {{ ref('Fact_Orders') }}
order by 1
{% endset %}
 
{% set results = run_query(lineno_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}

{% endmacro %}
