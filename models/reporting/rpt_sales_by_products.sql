{{config(materialized = 'view', schema = 'reporting_dev')}}
 
select
e.empname as empname, 
sum(c.customerid) as total_customers, 
sum(p.productid) as total_products, 
sum(o.linesalesamount) as total_sales

from {{ref('dim_employees')}} e
INNER JOIN {{ref('fct_orders')}} o on e.empid = o.employeeid
INNER JOIN  {{ref('dim_products')}} p on p.productid = o.productid
INNER JOIN  {{ref('dim_customers')}} c on o.customerid = c.customerid

group by e.empname
order by sum(o.linesalesamount) desc