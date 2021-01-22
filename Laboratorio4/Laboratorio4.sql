--- Devolver nombre completo, total de factura (sumando subtotal, impuesto y flete) y direcci�n de env�o de las �rdenes de venta registradas
SELECT C.FirstName + ' ' + isnull(C.MiddleName,'') + ' ' + C.LastName AS [NombreCompleto],
SOH.SubTotal + SOH.TaxAmt + SOH.Freight AS [Total de factura],
A.AddressLine1 + isnull(A.AddressLine2,'') AS [Direcci�n de env�o]
FROM SalesLT.Customer C	inner join SalesLT.CustomerAddress CA
ON C.CustomerID = CA.CustomerID
inner join SalesLT.Address A
ON CA.AddressID = A.AddressID
inner join SalesLT.SalesOrderHeader SOH
ON C.CustomerID = SOH.CustomerID and A.AddressID = SOH.BillToAddressID

---Mostrar todas las direcciones listadas para la empresa "Friendly Bike Shop"
 SELECT CompanyName, city,stateprovince,Countryregion
 FROM  SalesLT.Address,SalesLT.Customer
 WHERE CompanyName LIKE 'Friendly Bike Shop' 

---Mostrar cantidad de producto, nombre del producto y precio de lista de la orden de compra generada para el cliente con ID 29929 (Extra: �Cu�ntos productos compr�?)
Select OrderQty AS [Cantidad de producto], P.Name AS [Nombre del producto], P.ListPrice AS [Precio de lista]
From SalesLT.SalesOrderHeader SOH
inner join SalesLT.SalesOrderDetail SOD
ON SOH.SalesOrderID = SOD.SalesOrderID
inner join SalesLT.Product P
ON SOD.ProductID = P.ProductID
WHERE SOH.CustomerID = 29929

--- Mostrar el nombre de la compa��a donde laboran todos los clientes que tengan una direcci�n en la ciudad de Dallas.
SELECT CompanyName
FROM SalesLT.Customer, SalesLT.Address
WHERE city LIKE 'Dallas'

--- �Cuantos art�culos con precio de lista mayor a $1,000 se han vendido?SELECT SUM(OrderQty) as [Total de art�culos]
FROM SalesLT.SalesOrderDetail SOD
inner join SalesLT.Product P
ON SOD.ProductID = P.ProductID
WHERE P.ListPrice > 1000

---. Mostrar el nombre de la compa��a de aquellos clientes con compras mayores de $100,000.
SELECT CompanyName
FROM SalesLT.Customer C inner Join SalesLT.SalesOrderHeader SOH
ON C.CustomerID = SOH.CustomerID
WHERE SubTotal > 100000

--- �Cu�ntas calcetas de competencia ('Racing Socks, L') ha comprado la empresa 'Riding Cycles'?
SELECT SUM(OrderQty) AS [cantidad de producto]
FROM SalesLT.Product P inner Join SalesLT.SalesOrderDetail SOD
ON P.ProductID =SOD.ProductID
inner Join SalesLT.SalesOrderHeader SOH
ON SOD.SalesOrderID = SOH.SalesOrderID
inner Join SalesLT.Customer C
ON SOH.CustomerID = C.CustomerID
WHERE Name like 'Racing Socks, L' And CompanyName like 'Riding Cycles'

---Una orden de producto �nico (OPU) es aquella donde el cliente compr� un s�lo art�culo. Muestre el n�mero de orden y el precio unitario de cada OPU.
SELECT SalesLT.SalesOrderHeader.SalesOrderNumber, SalesLT.SalesOrderDetail.UnitPrice 
FROM SalesLT.SalesOrderHeader 
INNER JOIN SalesLT.Customer 
ON SalesLT.SalesOrderHeader.CustomerID = SalesLT.Customer.CustomerID 
INNER JOIN SalesLT.SalesOrderDetail 
ON SalesLT.SalesOrderHeader.SalesOrderID = SalesLT.SalesOrderDetail.SalesOrderID
INNER JOIN SalesLT.Product 
ON SalesLT.SalesOrderDetail.ProductID = SalesLT.Product.ProductID
GROUP BY SalesLT.SalesOrderHeader.SalesOrderNumber, SalesLT.SalesOrderDetail.UnitPrice
HAVING COUNT(SalesLT.SalesOrderDetail.ProductID) = 1
--Use la columna de SubTotal en la tabla SalesOrderHeader para listar las �rdenes de mayor a 
--menor. Para cada orden de compra muestre el nombre de la compa��a, el subtotal y el peso
--total de la orden.SELECT SubTotal,CompanyName, SUM(Weight) AS [Weight]FROM SalesLT.Customer C INNER JOIN SalesLT.SalesOrderHeader SHON C.CustomerID = SH.CustomerIDINNER JOIN SalesLT.SalesOrderDetail SDON SD.SalesOrderID = SH.SalesOrderIDINNER JOIN SalesLT.Product SPON SD.ProductID = SP.ProductIDGROUP BY (C.CompanyName) , (SH.SubTotal), SD.SalesOrderIDORDER BY SH.SubTotal DESC--�Cu�ntos productos en la categor�a 'Cranksets' se han vendido a una direcci�n registrada en Londres?SELECT COUNT(*) AS [Productos]FROM SalesLT.ProductCategory SPC INNER JOIN SalesLT.Product SPON SP.ProductCategoryID = SPC.ProductCategoryIDINNER JOIN SalesLT.SalesOrderDetail SDON SD.ProductID = SP.ProductID INNER JOIN SalesLT.SalesOrderHeader SHON SH.SalesOrderID = SD.SalesOrderID INNER JOIN SalesLT.Address SAON SA.AddressID = SH.ShipToAddressIDWHERE City = 'London' AND SPC.Name = 'Cranksets'