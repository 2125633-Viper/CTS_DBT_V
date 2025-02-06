{{config(materialized = 'view', schema = 'reporting_dev')}}


select ORDER_ID,
{% for A in get_linenos() %}

sum(case when lineno = {{A}} then linesalesamount end ) as lineno{{A}}_amount,

{% endfor %}

sum(linesalesamount) as total_amount
from {{ref('Fact_Orders')}}
group by 1