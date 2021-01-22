--Crear una vista con el n�mero de orden, el nombre completo del cliente, la direcci�n de
--env�o (concatenar AddressLine1, City, StateProvince, CountryRegion y PostalCode)
--junto con la cantidad total de productos que compr� y el total a paga

Create VIEW DatosOrden
with schemabinding AS
SELECT SOH.SalesOrderID as [No.Orden], C.FirstName +''+isnull(C.MiddleName,'')+''+C.LastName as [Nombre Completo],
A.AddressLine1+''+A.City+''+A.StateProvince+''+A.CountryRegion+''+A.PostalCode as [Direccion],
Sum(D.OrderQty) as [ProductoCantidad],
SOH.totaldue as [Total]
FROM SalesLT.SalesOrderHeader SOH 
inner Join SalesLT.SalesOrderDetail D 
on SOH.SalesOrderID = D.SalesOrderID
inner Join SalesLT.Customer C  
on C.CustomerID = SOH.CustomerID
inner Join SalesLT.CustomerAddress AC 
on AC.CustomerID= C.CustomerID
inner Join SalesLT.Address A 
on A.AddressID = AC.AddressID
Group by SOH.SalesOrderID,C.FirstName,C.MiddleName,C.LastName,A.AddressLine1,A.City,A.StateProvince,A.CountryRegion,A.PostalCode,SOH.TotalDue
go
SELECT * FROM DatosOrden
DROP VIEW DatosOrden

--Implementando un cursor y utilizando tablas temporales, calcular la suma total de cada
--orden de compra, sumando las columnas SubTotal, TaxAmt y Freight. Luego, actualizar
--la columna TotalDue aplicando un descuento seg�n el siguiente criterio: