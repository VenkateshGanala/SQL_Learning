
--use [AdventureWorks2019]

--queries for to connected server name and sql version 
	--select @@servername
	-- select @@version 


--syntax select * from dbname.schemaname.tablename 
-- example select * from adventureworks2019.person.password
-- use AdventureWorks2019

--proirty basis of sql   

-- FROM --> WHERE --> GROUP BY -->  SELECT --> ORDER BY 


-- dev should code like this 
-- select --> from --> where --> group by --> having --> order by

-- order of sql execution 
-- from --> where --> group by --> having --> select --> order by  

-- FROM --> WHERE -->  GROUP BY --> HAVING --> SELECT --> DISTINCT --> ORDER BY--> LIMIT
select  * from Person.Password order by ModifiedDate asc


select BusinessEntityID, FirstName, LastName, MiddleName from person.Person

-- Literal select statement
select 'first name ' from Person.Person

-- distinct keyword 

select distinct OrganizationLevel  from HumanResources.Employee
select distinct EmailPromotion  from Person.Person
select distinct title , suffix from  Person.Person



-- case statements 
---- syntax 
--case 
-- when <condition> then  <value> 
-- when <condition> then  <value> 
--else  <value> 
-- end as <alias name /column name >

select HireDate , gender, VacationHours,
case
 when VacationHours > 70 then 'Vacation Hours Over limit'
 when VacationHours between 48 and 70 then 'Vacation Hours Average'
else 'Vacation hours limited ' 
end as 'vacationHourLimit'

from  HumanResources.Employee


select * from person.Person

select firstname , lastname  , emailpromotion,

case 
when emailpromotion = 1 then 'Promoted'
when emailpromotion = 2 then 'double Promoted'
else 'not promoted'
end as promotionstatus
from Person.Person



-- where clause 

select LoginID, MaritalStatus ,* from  HumanResources.Employee where MaritalStatus = 's'

select birthdate, * from HumanResources.Employee where birthdate > '1985-10-01'
-- while using year in the where clause we can use the year function as below
select birthdate, * from HumanResources.Employee where year (birthdate) > '1985'
select birthdate, * from HumanResources.Employee where year (birthdate) = '1985'


-- concat operator 

-- for getting  all records

select Title , FirstName ,MiddleName, LastName , 

Title +' '+FirstName+' '+ MiddleName+' '+LastName as Fullname

from person.person 

-- for getting  single record  (if null is there in any of the column the result will be null ex : null + 'sanchez' + 'j' = null  )
select Title , FirstName ,MiddleName, LastName , 

Title +' '+FirstName+' '+ MiddleName+' '+LastName as Fullname

from person.person where Title +' '+FirstName+' '+ MiddleName+' '+LastName   = 'Ms. Gail A Erickson'


-- concat function  (removes null )

select Title,FirstName , MiddleName ,LastName ,
	   CONCAT (title , ' ' ,firstname ,' ', middlename ,' ', lastname) as FullName
from person.Person

--  FOR ADDING THE SEPERATOR WE CAN USE CONCAT_WS FUNCTION
SELECT  FirstName, BusinessEntityID,
        CONCAT_WS ('.','MICROSOFT','COM') AS DomainName
 from Person.Person

 
-- EXAMPLE 2 : FOR ADDING THE SEPERATOR WE CAN USE CONCAT_WS FUNCTION
 SELECT  FirstName, BusinessEntityID,
         CONCAT( FirstName,'.', BusinessEntityID,'@',CONCAT_WS ('.','MICROSOFT','COM')) AS PersonalEmail,
         CONCAT_WS ('.','MICROSOFT','COM') AS DomainName
 from Person.Person

select  firstname, EmailPromotion,
		case 
			when EmailPromotion = 1 then 'promoted'
			when EmailPromotion = 2 then 'double Promoted'
			else 'not promoted'
			end as PromotionStatus
from Person.Person


-- Is Null and Is Not Null 
Select [name],[color] from Production.Product
Select [name],[color] from Production.Product where Color Is Null
Select [name],[color] from Production.Product where Color Is Not Null  


-- between operator 
select COUNT(*) ProductID from Production.Product where ProductID between 1 and 500 

select PurchaseOrderID, ModifiedDate ,* from
Purchasing.PurchaseOrderDetail  where ModifiedDate between '20140203' and '20150813'
 
select PurchaseOrderID, ModifiedDate ,* from
Purchasing.PurchaseOrderDetail  where ModifiedDate between '2014-02-03' and '2015-08-13'

-- if user want to get 00.00.00.000 (time stamp) then we will use the CAST 
select CAST('20241211' as datetime) as datetime_column

select TRY_CAST('20241211' as datetime) as datetime_column


SELECT BusinessEntityID, CAST(BirthDate AS datetime) AS BirthDateTime
FROM HumanResources.Employee;


select PurchaseOrderID, ModifiedDate ,* from
Purchasing.PurchaseOrderDetail  where cast( ModifiedDate as date)between '2014-02-03' and '2015-08-13'


-- how to use the cast function () 
SELECT PurchaseOrderId, ModifiedDate
FROM Purchasing.PurchaseOrderDetail
WHERE ModifiedDate BETWEEN '2014-02-03'AND '2015-08-13';

SELECT PurchaseOrderId, ModifiedDate
FROM Purchasing.PurchaseOrderDetail
WHERE CAST(ModifiedDate AS DATE) BETWEEN '2014-02-03'AND '2015-08-12';


-- how to use in operator

select * from Person.StateProvince 
select * from Person.StateProvince where StateProvinceCode IN ('ab','ak','al','ca','dc')

select * from Person.StateProvince where StateProvinceCode NOT IN ('ab','ak','al','ca','dc')


-- like operator 

-- query for  find column data start with r
SELECT BusinessEntityId, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE 'R%';

--query for  find column data start with r
SELECT BusinessEntityId, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE 'Research and Development%';
 
 
--query for  find column data contain Manager
SELECT BusinessEntityId, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager%';
 
 
--query for  find column data end  with Manager
SELECT BusinessEntityId, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE '%Manager';
 
 
--query for  find column data start with Manager
SELECT BusinessEntityId, JobTitle
FROM HumanResources.Employee
WHERE JobTitle LIKE 'Manager%';

select AddressID , * from Person.Address where city like '%San Gabriel'

select * from Person.ContactType where [name] like 'c%'


-- like operator for character classes []


SELECT *
FROM Person.StateProvince
WHERE StateProvinceCode LIKE 'A[BKL]';
 
 
SELECT *
FROM Person.StateProvince
WHERE StateProvinceCode LIKE 'A[BKL]';

SELECT *
FROM Person.StateProvince
--WHERE StateProvinceCode LIKE 'A[BKL]%';
WHERE StateProvinceCode LIKE '[IL]A%';
 
SELECT *
FROM Person.StateProvince
--WHERE StateProvinceCode LIKE 'A[BKL]%';
--WHERE StateProvinceCode LIKE '[IL]A%';
WHERE StateProvinceCode LIKE '[IL][ABCDEFG]';
 
SELECT *
FROM Person.StateProvince
--WHERE StateProvinceCode LIKE 'A[BKL]%';
--WHERE StateProvinceCode LIKE '[IL]A%';
WHERE StateProvinceCode LIKE '%[IL][ABCDEFG]%';


select * from Person.AddressType where [Name] like 'b[ip]%'



--[Character range]   select like operator from ranges [a-e] => (selects)abcde [0-9] => (selects 0123456789)

select * from Production.Product
 where ProductNumber like 'l%'

 select * from Production.Product
 where ProductNumber like 'l[a-z]%'

 select * from Production.Product
 where ProductNumber like 'l[a-z]-[0-9]%'
 
 select * from Production.Product
 where ProductNumber like 'l[aeiou]-[0-9]%'

 --[Character range]  with negation '^'  selects part  from ranges [^a-f] => (not selects)abcdef [^0-9] => (not selects 0123456789)
 select * from Production.Product
 where productnumber like 'l[^a-e]-[^1-3]%'

  select * from Production.Product
 where productnumber like 'l[^a]-[^1-3]%'


 --[Character range]  with UnderScore '_'  select * from tbl where col1 like  [a_]  => selects ap , al , ak , ab  
 --  select * from tbl where Col1 like  [a__]  => selects apc , alc , akc , abd  

 select * from Person.StateProvince where StateProvinceCode like 'A_%'
 select * from Person.StateProvince where [Name] like 'A_____'
 
 --test skills select only 
 select  distinct PersonType  from Person.Person where PersonType like 's_'

 
 select  distinct PersonType  from Person.Person where PersonType not like 's_'


 -- escape sequence 
 select * from Purchasing.Vendor where  [Name] like '%''%'



 -------------- order by 

--proirty basis of sql   

-- FROM --> WHERE --> SELECT --> ORDER BY 



SELECT JobCandidateId, ModifiedDate
FROM HumanResources.JobCandidate;
 
SELECT JobCandidateId, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate DESC;
 
 -- above query can be coded as in place of ORDER BY ModifiedDate DESC; we can palce ORDER BY 2  DESC ==> (inthe select statement  ModifiedDate is the second column );


 SELECT JobCandidateId, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY 2 DESC;

 --------
SELECT *
FROM Person.Address
ORDER BY AddressID
 
SELECT CONCAT(AddressLine1, ' ', AddressLine2, ' ',
              City, ' ', StateProvinceID, ' ', PostalCode)
FROM Person.Address
ORDER BY AddressID;
 
SELECT AddressID, CONCAT(AddressLine1, ' ', AddressLine2, ' ',
              City, ' ', StateProvinceID, ' ', PostalCode)
FROM Person.Address
ORDER BY AddressID;
 
SELECT AddressID, CONCAT(AddressLine1, ' ', AddressLine2, ' ',
              City, ' ', StateProvinceID, ' ', PostalCode) AS
			  PostalAddress
FROM Person.Address
ORDER BY AddressID;
 
SELECT *
FROM Production.Product
 
SELECT ProductID, Name, StandardCost, Listprice
FROM Production.Product
ORDER BY StandardCost;
 
SELECT ProductID, Name, StandardCost, Listprice
FROM Production.Product
ORDER BY StandardCost ASC;
 
SELECT ProductID, Name, StandardCost, Listprice
FROM Production.Product
ORDER BY StandardCost ASC, ListPrice DESC;
--Rec1 - standcost - 100, Listprice - 10
--Rec2 - standcost - 100, Listprice - 15
--100, 15
--100,05
 
SELECT ProductID, Name, StandardCost, Listprice
FROM Production.Product
ORDER BY StandardCost DESC, ListPrice DESC;
 
SELECT ProductID, Name, StandardCost, Listprice
FROM Production.Product
WHERE StandardCost > 0 AND ListPrice > 0
ORDER BY StandardCost DESC, ListPrice DESC;
 
SELECT ProductID, Name, StandardCost, Listprice
FROM Production.Product
WHERE StandardCost > 0 AND ListPrice > 0
ORDER BY 4;
 
SELECT ProductID, Name, StandardCost, Listprice
FROM Production.Product
WHERE StandardCost > 0 AND ListPrice > 0
ORDER BY 3 DESC, 4;

---- length 
select BusinessEntityID,LoginID,BirthDate from HumanResources.Employee 
order by BirthDate desc

select BusinessEntityID,LoginID,BirthDate, len(BirthDate) as LengtBrthdt from HumanResources.Employee 
order by LEN( BirthDate) desc 

select City,AddressLine1,AddressLine2  from Person.Address
order by AddressLine1 desc 

select City,AddressLine1,AddressLine2, len(AddressLine1) as LenadrssL1  from Person.Address
order by len(AddressLine1) desc

select City,AddressLine1,AddressLine2, len(AddressLine1) as  LenadrssL1 ,  COL_LENGTH (AddressLine1,AddressLine1) as  collength  from Person.Address
order by  COL_LENGTH (AddressLine1,AddressLine1) desc



--  order by ( using offset and fetch ) 
--offset is used to skip the selected count of rows from the records  
--fetch  is used to select the selected count of rows from the records  

--general for fetch top 5 recently hired record 
select top 5 * , HireDate as hd from HumanResources.Employee order by  HireDate  desc 
--using offset 
select * , HireDate as hd from HumanResources.Employee order by  HireDate  desc 
offset 0 rows   --  skip 0 rows 
fetch next 5 rows only  -- fecth only 5 rows 

-- skip top 5 records and  fetch  next top 5 recently hired record 
select  BusinessEntityID, LoginID,BirthDate from HumanResources.Employee
order by HireDate desc 
offset 5 rows 
fetch next 10 rows only 


--using top 
select top 2 LoginID , ModifiedDate from HumanResources.Employee
order by ModifiedDate desc

-- with ties  used for  if any other matching records with modified date (ties work with order by column)
select top 2  with ties LoginID , ModifiedDate from HumanResources.Employee
order by ModifiedDate desc




SELECT TOP 2 JobCandidateID, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate DESC;
 
SELECT  JobCandidateID, ModifiedDate
FROM HumanResources.JobCandidate
ORDER BY ModifiedDate DESC
OFFSET 0 ROWS
FETCH NEXT 2 ROWS ONLY;
 
SELECT TOP 2 ProductId, Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;
 
SELECT TOP 2 WITH TIES ProductId, Name, StandardCost
FROM Production.Product
ORDER BY StandardCost DESC;
 
SELECT TOP 3 SalesOrderID, SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;
 
SELECT TOP 3 WITH TIES SalesOrderID, SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;
 
SELECT  TOP 10 PERCENT SalesOrderID, SalesOrderDetailID, OrderQty
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;
 
SELECT  TOP 1 *
FROM Sales.SalesOrderDetail
ORDER BY OrderQty DESC;


---- Group by  used to get the similar data from the columns (get all the red balls from the balls )


select  SalesOrderID  from Sales.SalesOrderDetail group by SalesOrderID

-- for below get an error Column 'Sales.SalesOrderDetail.OrderQty' is invalid in the select list because 
--it is not contained in either an aggregate function or the GROUP BY clause.
select  SalesOrderID , OrderQty from Sales.SalesOrderDetail group by SalesOrderID

--for that u need to use the agrregate functions  => sum (orderqty)  
select salesorderid , sum(orderqty) from sales.SalesOrderDetail group by SalesOrderID

-- how to use the group by with out agregate function
select * from HumanResources.Department

select GroupName  from HumanResources.Department group by GroupName

select GroupName , count (GroupName) from HumanResources.Department group by GroupName
 --or 
 select GroupName , count (*) from HumanResources.Department group by GroupName



 select GroupName from HumanResources.Department group by GroupName

  -- will not work 
SELECT PayFrequency, SUM(Rate)
FROM HumanResources.EmployeePayHistory;
 
 -- will work 
SELECT PayFrequency, SUM(Rate) AS TotalRatePerPayFrequency
FROM HumanResources.EmployeePayHistory
GROUP BY PayFrequency
order by PayFrequency desc ;

SELECT PayFrequency, SUM(Rate) AS TotalRatePerPayFrequency
FROM HumanResources.EmployeePayHistory
where Rate > = 100 
GROUP BY PayFrequency
order by PayFrequency desc ;


-- functions sum , avg , max , min , date , count

select  sum (StandardCost) from Production.Product
select  sum (distinct StandardCost) from Production.Product

select AVG(StandardCost) from Production.Product
select max(StandardCost) from Production.Product
select min(StandardCost) from Production.Product
select count(StandardCost) from Production.Product



select MakeFlag ,* from Production.Product
-- gives all rows count 
select count (*) from Production.Product

select avg (StandardCost) from Production.Product group by MakeFlag

select avg (all StandardCost) from Production.Product group by MakeFlag

select avg (distinct StandardCost) from Production.Product group by MakeFlag
 
 select COUNT(color) from Production.Product where Color is not null 

 select Count (color) from Production.Product where color is null 


 select max (StandardCost)  as maxstdcost 
 from Production.Product 
 where StandardCost> 0 


 -- below gives an error 
 --An aggregate may not appear in the WHERE clause unless it is in a subquery contained in a HAVING clause or a select list, and the column being aggregated is an outer reference.
 -- you cannot use aggregate function liken   min, max  ,avg , sum , count  in with a where clause
 select min (StandardCost)  as maxstdcost 
 from Production.Product 
 where min(StandardCost)> 0 

 -- correct 
  select min (StandardCost)  as maxstdcost 
 from Production.Product 
 where StandardCost > 0 
 

 -- having we can use aggregate functions like min, max  ,avg , sum , count 
 select min(StandardCost)  as maxstdcost 
 from Production.Product 
 group by MakeFlag
 having  min(StandardCost) > 0
  

-- less used numerical fucntions 

SELECT ABS(-12345.45);
 --o/p 12345.45

SELECT ABS(+12345.45);
--o/p 12345.45

SELECT ABS($12345.45);
--o/p 12345.45

-- ceiling  gives highest round value example  if column has data 1.78  --  > 
-- select ceiling (1.78)  -->o/p is 2
select StandardCost, CEILING (StandardCost) as highest_roundoff  
from Production.Product
Where StandardCost > 0


-- floor   gives lowest round value example  if column has data 1  --  > 
-- select floor (1.78)  -->o/p is 1
select StandardCost, floor (StandardCost) as highest_roundoff  
from Production.Product
Where StandardCost > 0


-- RAND() gives you random number  that varies every time 
select RAND()

-- RAND() + 3  gives you random number  greater than 3 and less than 4  (in between 3.00 to 3.99)
select RAND() + 3 


-- RAND()*8 + 3  gives you random number  greater than 3 and less than 11  (in between 3.00 to 10.99)
select RAND()*8 + 3 


-- round will round off the value 
-- syntax  round (integer/decimal , round off )
-- example select ROUND (10.988,2) --> o/p 10.990  
select ROUND (10.988,2)


--below query gives the result  if StandardCost is 98.77 --> result will be 99 used ceiling
select  StandardCost , Round (CEILING(StandardCost ),2)
from Production.Product
where StandardCost > 0


--below query gives the result  if StandardCost is 98.77 --> result will be 98 used floor 

select  StandardCost , Round (floor(StandardCost ),2)
from Production.Product
where StandardCost > 0



-- string functions 
-- 1. charindex -- used to fetch the character index in a string 
-- syntax CharIndex('substring','Main String' , starting position)  charindex start from 1 not 0

-- below example find the character index position of the d in dad
select CHARINDEX ('d','dad')
--o/p is 1  because in string dad  --> d is at first  (if user doesnot mention the starting position by default Charindex function will take starting )

select CHARINDEX ('d','dad', 2) -- here starting position is 2 charindex will start search from the second index 
--o/p is 3  left the index 1 

 --below example find the character index position of the cr in name column 
select Name , CHARINDEX('cr',name) as [charindex] 
from Production.Product 
where name like '%cr%'


--2. concat concat_ws
select concat('.' , 'MicroSoft', 'com');  -- o/p .Microsoftcom 
select concat_ws('.' , 'MicroSoft', 'com');  -- o/p Microsoft.com 

--3. datalength gives the number of the bytes allocated for the string
select name , DATALENGTH (name)
from Production.Product
group by name 


-- 4. format
SELECT FORMAT(20240616,'####/##/##');
--o/p 2020/06/16
SELECT FORMAT(20240616,'####-##-##');


select Name, LEFT(Name, 2) as ExtractNameLeft
from Production.Product

select Name, right(Name, 2) as ExtractNameLeft
from Production.Product

select name , LEN(Name) from Production.Product
-- difference between len and datalength 
-- len will not consider the spaces before and after the word  example select len ('babu   ')  --o/p  = 4
--datalength will  consider the spaces before and after the word  example select datalength('babu   ')  --o/p  = 7



select name , upper(Name)  as Namecapitalization from Production.Product


select name , lower(Name)  as Namesamll from Production.Product


select  ltrim ('    abc')as lefttrim 

select  rtrim ('abc    ')as lefttrim 

select   trim('    abddf   ')  as trimmedspaces  from Production.Product

select name , trim(Name)  as trimmedspaces  from Production.Product

SELECT Name, PATINDEX('%Ball%',Name)
FROM Production.Product
WHERE Name LIKE '%Ball%';
 
SELECT Name, Patindex('%Cr_nk%',Name)
FROM Production.Product
WHERE Name LIKE '%Cr%';
 
SELECT LoginID, REPLACE(LoginID,'adventure-works','aw') AS ReplaceString
FROM HumanResources.Employee;
 
SELECT FirstName, REPLICATE(FirstName,3) AS ReplicateFName
FROM Person.Person;


select  name  , REVERSE (name) as reversename from Production.Product

--substring (mainstring ,starting postion , length)
select top 100 LastName,SUBSTRING (LastName,3,5) 
from Person.Person 
order by LastName


-- str 

select ProductID , str(ProductID) as converted_to_string 
from Production.Product


select HireDate , gender, VacationHours,
case
 when VacationHours > 70 then 'Vacation Hours Over limit'
 when VacationHours between 48 and 70 then 'Vacation Hours Average'
else 'Vacation hours limited ' 
end as 'vacationHourLimit'

from  HumanResources.Employee


select *  from Production.Product



select productid ,name ,

case 
when makeflag = 0 then 'product is not falgged'
when MakeFlag = 1 then 'product is flagged'
when MakeFlag > 200 then 'product is flagged greater than 200'
else 'no flag'
end as 'Make_Flag_Status'
from Production.Product




--------------------------Date Functions 
--date format notations 
--year,y,yyyy,yy
--quarter,q,qq
--month,m,mm
--day,d,dd
--hour,hh
--minute, mi, n
--second ,ss,s
--millisecond , ms 

--DATEADD()  which is used to add the date for any of the column
--Syntax :  
--DATEADD(y/m/q, count of y/m/q , main date (columnname ))

select SellStartDate  , DATEADD(YEAR,3,SellStartDate) as AddedThreeYear   from Production.Product

-- qq = 4 months
select SellStartDate  , DATEADD(QQ,2,SellStartDate) as AddedTwoquaters   from Production.Product

select SellStartDate  , DATEADD(MM,2,SellStartDate) as AddedTwomonths   from Production.Product

--DATEDIFF()  which is used to add the date for any of the column
--Syntax :  
--DATEDIFF(y/m/q, Datediff part 1  ,  Datediff part 1)

select SellStartDate , SellEndDate  , DATEDIFF (yyyy,SellStartDate, SellEndDate) as DiffDate  
from Production.Product
where SellEndDate is not null;
 

 select SellStartDate , SellEndDate  , DATEDIFF (mm,SellStartDate, SellEndDate) as DiffDate  
from Production.Product
where SellEndDate is not null;
 

 -- date part 

 --syntax datepart (y/m/q,interval) 
 select SellStartDate , DATEPART(yy, SellStartDate) as YearExtract
 from  Production.Product

 --year(interval)
 --
  select SellStartDate , year(SellStartDate) as YearExtract
 from  Production.Product

  --month(interval)
  select SellStartDate , month(SellStartDate) as MonthExtract
 from  Production.Product

  --day(interval)
  select SellStartDate , day(SellStartDate) as DayExtract
 from  Production.Product

   select SellStartDate , datename(YEAR,SellStartDate) as yearExtract
 from  Production.Product

 -- datename returns the string value as datepart returns the integer value
   select SellStartDate , datename(MONTH,SellStartDate) as yearExtract
 from  Production.Product
--o/p = if the date  has month as 2002-04-01   output is april

--eomonth ==>  end of month
--syntax : eomonth(interval)
SELECT ProductID, SellStartDate,eomonth(sellstartdate) AS EndOfMonth
FROM Production.Product;


--
select CURRENT_TIMESTAMP;
select GETDATE();
select SYSDATETIME();
select SYSDATETIMEOFFSET();





--isdate -- used to find whether the given column have a date field or not , if the column have date value true the o/p is 1 else 0

SELECT SellStartDate, isdate(SellStartDate)
FROM Production.Product;
 
SELECT isdate(1) As booleanValue;  --o/p 0 
 

 -- isnull is deifferent from is null   
 -- 'isnull' takes two vaules as input and provide the output either 0 or 1 , where as 'is null' is used with where clause

 --is null 
 SELECT ProductID, SellStartDate,eomonth(sellstartdate) AS EndOfMonth
FROM Production.Product  where ProductID is null;

-- isnull 
SELECT isnull(NULL,'Abc');  -- o/p is Abc  isnull avoids null
 
SELECT isnull('123','Abc'); -- o/p is 123 as first value is not null as there is some value it will take first value 
 
SELECT isnull(NULL,0); -- o/p is 0 because isnull avoids null
 
SELECT isnull(0,5); -- o/p is  0 because is 0 is some value not null 
 
SELECT isnull(' ',5); -- o/p is  ' '  because is ' ' is some value not null  
 
SELECT Color, isnull(Color,'hello') as CheckforNull
FROM Production.Product;
-- in the above query if  color column is having null value the o/p is hello 
-- else displays color value in the column  


-- isnumeric which is used to find where where the column value have the numeric value or not 
-- if value is numeric o/p is 1 
-- if value is not numeric then the o/p is 0 
SELECT StandardCost, isnumeric(StandardCost) AS testNumeric
FROM Production.Product;
 
SELECT Color, isnumeric(Color) AS testNumeric
FROM Production.Product;
select ProductLine,isnull ( [name],'') as withoutnull  from Production.Product 
where ProductLine is null



-- coalesce returns first non null value from  the list of values 
--Syntax coalesce(val1,val2,val3,val4,_______....)
--example 

SELECT coalesce (null,null,null,'abc',null,'sql') --o/p abc because abc is first non null value 
SELECT coalesce (null , null ,null , 'dc') -- --o/p dc because dc is first non null value 

SELECT Title,MiddleName , coalesce(Title, middlename) as EX_coalesce 
 from Person.Person

 -- NULLif takes two parameters, if the two parameters are equal then returns null as o/p 
 -- NULLif takes two parameters, if the two parameters are different then returns first non null value as o/p 
 --syntax nullif (val1,val2)
select  nullif(12,12) --o/p null
select nullif (12,14) -- o/p 12
select nullif (18,14) -- o/p 18

-- convert is used to convert on datatype to another datatype 
-- syntax  : Convert(todatatype,experssion)

select MiddleName, convert(varchar(20) , MiddleName) as convertedint
from Person.Person

select StandardCost,ListPrice , convert (int,StandardCost) as StandardCost_INT  -- StandardCost data type is money 
from Production.Product


-- iif takes  arguments 
-- 1. test condition
-- 2. exp 1 
-- 3. exp 2 
-- if test condition pass then the exp 1 is displayed else exp2
-- syntax iif (testcond , exp1 , exp2)

select  iif(10=10 , 'profit','loss') -- profit 
select  iif(10<9 , 'profit','loss') -- loss 


select StandardCost,ListPrice , iif(ListPrice>=StandardCost , 'profit','loss')
from Production.Product

select top 100 title,firstname,lastname,middlename, 
iif(title = null , concat(firstname,' ',lastname), concat(title ,' ',firstname,' ',middlename,' ', lastname) ) as fullname
from Person.Person


-- having clause 

SELECT max(StandardCost)
FROM Production.Product
HAVING max(standardCost) > 200;
 

 select  DueDate , sum(OrderQty) as total,
 * from Purchasing.PurchaseOrderDetail

SELECT DueDate,Sum(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) > 2011 AND Month(DueDate) < 9
GROUP BY DueDate
ORDER BY DueDate DESC;
 
-- below query will give you error we cannot user aggregate function in where clause
SELECT DueDate,Sum(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) > 2011 AND Month(DueDate) < 9 and  sum(OrderQty) < 6000
GROUP BY DueDate
ORDER BY DueDate DESC;
 




SELECT DueDate,Sum(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
WHERE YEAR(DueDate) > 2011 AND Month(DueDate) < 9 
GROUP BY DueDate
HAVING sum(OrderQty) < 6000
ORDER BY DueDate DESC;
 
SELECT DueDate,Sum(OrderQty) AS TotalOrderPerDueDate
FROM Purchasing.PurchaseOrderDetail
--WHERE YEAR(DueDate) > 2011 AND Month(DueDate) < 9 
GROUP BY DueDate
HAVING sum(OrderQty) < 6000
ORDER BY DueDate DESC;


--code
-- select --> from --> where --> group by --> having --> order by

-- order of sql execution 
-- from --> where --> group by --> having --> select --> order by  