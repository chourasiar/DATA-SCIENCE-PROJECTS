select productid, productname, QuantityAvailable from Products
order by QuantityAvailable desc limit 3;

select EmailId,count(*) as Total_Transactions from PurchaseDetails
group by EmailId having count(*) > 10;

select CategoryName as 'Name of the category', QuantityAvailable 
from Categories c
inner join (
select CategoryId,sum(QuantityAvailable) as QuantityAvailable from Products 
group by CategoryId ) p
on c.CategoryId = p.CategoryId order by QuantityAvailable desc;

select p.ProductId, ProductName, CategoryName, Total as Total_Purchased_Quantity
from Products p inner join Categories c 
on p.CategoryId = c.CategoryId  inner join 
(select ProductId, sum(QuantityPurchased) as Total from PurchaseDetails
group by ProductId order by Total desc limit 1) t 
on p.ProductId = t.ProductId;

select Gender,count(*) from Users 
group by Gender 

select ProductId, ProductName, Price,
 Case 
 When Price < '2000' then 'Affordable'
 When Price Between '2000' and '50000' then 'High End Stuff'
 When Price > '50000' then 'Luxury'
 End As  Item_Classes
 from Products ;
 
 
select ProductId, ProductName,CategoryName, Price as 'Old_Price',
 Case 
 When CategoryName = 'Motors' then Price - 3000
 When CategoryName = 'Electronics' then Price + 50
 When CategoryName = 'Fashion' then Price + 150
 Else Price
 End As  New_Price 
 from Products p inner join Categories c 
 on p.CategoryId = c.CategoryId ;

select concat(round(count(*)/(select count(*) from Users)*100,2),'%') As 'Perentage Females'
from Users group by Gender having Gender = 'F';

select avg(Balance) as 'Avergae Balance' from CardDetails 
where CVVNumber > 333
UNION
select avg(Balance) as 'Avergae Balance' from CardDetails 
where NameOnCard LIKE '%e';

select  *
from ( select ProductName,CategoryName,
Price*QuantityAvailable as Value
from Products p 
Inner Join Categories c ON p.CategoryId = c.CategoryId) as t
where CategoryName <> 'Motors' 
order by Value desc limit 1,1 


