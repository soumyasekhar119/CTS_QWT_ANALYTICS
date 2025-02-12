{% macro get_min_order_date() -%}
 
{% set min_order_date_query %}
select MIN(orderdate)
from {{ ref('fct_orders') }}
{% endset %}
 
{% set results = run_query(min_order_date_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}

{% endmacro %}