{{config(materialized = 'view', schema = 'reporting_dev')}}
 
select
c.companyname, 
c.contactname, 
min(d.date_day) as first_order_date, 
min(d.day_of_week_name) as first_order_day, 
max(d.date_day) as recent_order_date, 
max(d.day_of_week_name) as recent_order_day, 
sum(o.quantity) as total_quantity_ordered, 
sum(o.linesalesamount) as total_sales

from {{ref('fct_orders')}} o
INNER JOIN  {{ref('dim_customers')}} c on o.customerid = c.customerid
INNER JOIN  {{ref('dim_date')}} d on o.orderdate = d.date_day

group by c.companyname, c.contactname