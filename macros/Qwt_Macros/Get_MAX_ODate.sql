{% macro Get_MAX_ODate() %}
 
{% set lineno_query %}
select  
MAX(ORDER_DATE) AS MAX_DATE
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