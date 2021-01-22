--�Cuales son las 5 provincias de estado con menos cantidad de direcciones?
SELECT top 5 *
From SalesLT.Address
ORDER BY Len(StateProvince)

--�cu�ntos c�digos postales terminan con 0?
SELECT COUNT(PostalCode) TerminaCon0
FROM SalesLT.Address
WHERE PostalCode LIKE '%0'

--�Cu�l es el nombre de la empresa que tiene m�s clientes? �Cu�ntos son?
SELECT TOP 1 CompanyName, COUNT(CustomerID) AS TOTAL
FROM SalesLT.Customer
GROUP BY CompanyName
ORDER BY TOTAL DESC

 --�Cu�ntas direcciones de usuario de tipo shipping existen? 
SELECT AddressType, COUNT(AddressType) AS TOTAL
FROM SalesLT.CustomerAddress
WHERE AddressType LIKE 'Shipping'
GROUP BY AddressType

 --�Cu�l es el producto con el costo est�ndar m�s alto?
SELECT Top 1 Name,StandardCost FROM SalesLT.Product
ORDER BY StandardCost DESC

--�Cuales son los promedios de peso de los productos por modelo? �Cu�ntas categor�as
--tienen un promedio mayor a 0? SIN TERMINAR
SELECT COUNT(ProductCategoryID) AS Categoria,
AVG(Weight) as Promedio
FROM SalesLT.Product 
WHERE Weight > 0

--�Cu�ntos productos tienen la palabra "Road" en su nombre? 
SELECT COUNT(Name)  
FROM SalesLT.Product 
WHERE Name Like '%Road%'

--�A cu�nto asciende la diferencia total entre costos y precio de los productos?
SELECT SUM(ListPrice) - SUM(StandardCost) as Resta
FROM SalesLT.Product

--�De qu� color hay m�s productos en existencias? �Cu�ntos son? SELECT TOP 1 Color,COUNT(Color) AS TOTAL
FROM SalesLT.Product
GROUP BY Color
ORDER BY TOTAL DESC

--�A cu�nto asciende el total de ventas? SELECT SUM(LineTotal) AS TOTALFROM SalesLT.Product
--�Cu�l es el ID de cliente que pag� m�s flete por su compra? 
SELECT TOP 1 CustomerID, Freight 
FROM SalesLT.SalesOrderDetail
ORDER BY Freight DESC

 --�Cual es el ID de la venta m�s alta? 
 SELECT ProductID, COUNT(Name) AS TOTAL
 FROM SalesLT.Product
 GROUP BY ProductID
 ORDER BY ProductID DESC

 --�Cu�l fue el total de ventas por cliente? �Cu�ntos tuvieron un total mayor a 50000?
SELECT SUM(TotalDue) as SUMA, COUNT(TotalDue) AS Mayor
FROM SalesLT.SalesOrderHeader
WHERE TotalDue > 50000

--  �Cu�l es el producto que m�s se vendi�? �Cu�ntas unidades se vendieron? (tome en
--cuenta la cantidad que despacha en cada venta)
SELECT TOP 1 ProductID,COUNT(ProductID) AS TOTAL
FROM SalesLT.SalesOrderDetail
GROUP BY ProductID
ORDER BY TOTAL DESC
SELECT DISTINCT Name,ProductID 
FROM SalesLT.Product 
WHERE ProductID = 715

--�Cu�ntos productos por venta se despacharon? �En cu�ntas ventas se despacharon
--m�s de 8 productos?SELECT ProductID,COUNT(OrderQty) AS TOTAL_VENTAS
FROM SalesLT.SalesOrderDetailGROUP BY ProductIDSELECT COUNT(OrderQty) AS Mayor_a_8
FROM SalesLT.SalesOrderDetail
WHERE OrderQty > 8

