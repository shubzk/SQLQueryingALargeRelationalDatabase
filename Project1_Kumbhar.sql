-- PROJECT: Querying a Large Relational Database (Adventure Works database)
use AdventureWorks2022

-- Getting all the details from the person table including email ID, phone number, and phone number type
select p.FirstName, p.LastName, e.EmailAddress, ph.PhoneNumber, pt.Name as PhoneNumberType
from Person.Person as P
join Person.EmailAddress as e on p.BusinessEntityID = e.BusinessEntityID
join Person.PersonPhone as ph on p.BusinessEntityID = ph.BusinessEntityID
join Person.PhoneNumberType as pt on ph.PhoneNumberTypeID = pt.PhoneNumberTypeID;

-- Getting all the details of the sales header order made in May 2011
select *
from Sales.SalesOrderHeader
where year(OrderDate) = 2011 and month(OrderDate) = 5;

-- Getting the details of the sales details order made in the month of May 2011
select sod.*, soh.OrderDate
from Sales.SalesOrderDetail as sod
join Sales.SalesOrderHeader as soh on sod.SalesOrderID = soh.SalesOrderID
where year(soh.OrderDate) = 2011 and month(soh.OrderDate) = 5;

-- Getting the total sales made in May 2011
select sum(TotalDue)
from Sales.SalesOrderHeader
where year(OrderDate) = 2011 and month(OrderDate) = 5;

-- Getting the total sales made in the Year 2011 by month, ordered by increasing sales
select month(OrderDate) as Month, sum(TotalDue) as Sales
from Sales.SalesOrderHeader
where year(OrderDate) = 2011
group by month(OrderDate)
order by sum(TotalDue);

-- Getting the total sales made to the customer Gustavo Achong
select sum(sh.TotalDue) as TotalSales
from Sales.SalesOrderHeader as sh
join Sales.Customer as c on sh.CustomerID = c.CustomerID
join Person.Person as p on c.PersonID = p.BusinessEntityID
where p.FirstName = 'Gustavo' and p.LastName = 'Achong';