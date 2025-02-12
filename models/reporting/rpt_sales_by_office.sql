{{config(materialized = 'view', schema = 'reporting_dev')}}
 
select
e.country,
c.companyname,
c.contactname,
count(o.orderid) as total_orders,
sum(o.quantity) as total_qty,
sum(o.linesalesamount) as total_sales,
avg(o.margin) as margin

from {{ref('dim_customers')}} c 
INNER JOIN {{ref('fct_orders')}} o on c.customerid = o.customerid
INNER JOIN {{ref('dim_employees')}} e on e.empid = o.employeeid

where e.country = '{{var('v_country', 'France') }}'

group by e.country, c.companyname, c.contactname