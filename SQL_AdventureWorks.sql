

CREATE PROC dbo.uspGetAddress3 @City nvarchar(30), @PostalCode nvarchar(10)
AS

SELECT * FROM Person.Address
WHERE City LIKE @City + '%' AND PostalCode LIKE @PostalCode
GO

EXEC dbo.uspGetAddress3 @City = 'New', @PostalCode = '[98]%'

CREATE PROC dbo.uspGetAddress4 @CityName nvarchar(30) OUTPUT
AS
SELECT City FROM Person.Address
WHERE AddressID = 38 AND PostalCode = 48226
GO
DECLARE @CityName nvarchar(30)
EXEC dbo.uspGetAddress4 @CityName = @CityName OUTPUT
PRINT @CityName

SELECT DISTINCT City
FROM Person.Address;

SELECT TOP 10 * FROM HumanResources.Department;

SELECT * FROM Person.StateProvince;
SELECT MIN(Rate) AS Highest_Pay FROM HumanResources.EmployeePayHistory;

SELECT [Name] FROM Person.StateProvince
WHERE [Name] BETWEEN 'Florida' AND 'Kentucky'
ORDER BY [Name];

