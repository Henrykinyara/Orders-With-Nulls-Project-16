Use EPKO_DATABASE;

Select*From OrdersWithNulls;

CREATE VIEW
VW_ORDERS
as
Select*from OrdersWithNulls;

Create procedure sp_OrdersWithNulls as
 begin 
 Select*from OrdersWithNulls
 End;