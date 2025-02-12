{{config(materialized='table')}}

select 
OrderID as OrderID,
LineNo as LineNo,	
ShipperID as ShipperID,	
CustomerID as CustomerID,	
ProductID as ProductID,
EmployeeID as EmployeeID,	
TO_DATE(split_part(SHIPMENTDATE,' ',1)) as ShipmentDate,
Status as Status
from
{{source('raw_qwt','raw_shipments')}}