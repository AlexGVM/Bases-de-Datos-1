--Crear una vista con el número de orden, el nombre completo del cliente, la dirección de
--envío (concatenar AddressLine1, City, StateProvince, CountryRegion y PostalCode)
--junto con la cantidad total de productos que compró y el total a paga

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
--la columna TotalDue aplicando un descuento según el siguiente criterio: CREATE TABLE#TotalDeCompra(OrderID money , TotalAnterior int , TotalDescuento money)DECLARE @OrderID moneyDECLARE @Total intDECLARE @NewTotal moneyDECLARE CursorTotal CURSOR FOR SELECT SalesOrderID as OrderID, IsNULL(SubTotal,0.00) + IsNULL(TaxAmt,0.00) + IsNULL(Freight,0.00) as Total,CASE	WHEN TotalDue between 0 and 5000 then TotalDue - TotalDue*0.05	WHEN TotalDue between 5001 and 10000 then TotalDue - TotalDue*0.10	WHEN TotalDue between 10001 and 25000 then TotalDue - TotalDue*0.15	WHEN TotalDue > 25000 then TotalDue - TotalDue*0.20END as NewTotalFROM SalesLT.SalesOrderHeaderOPEN CursorTotal	FETCH NEXT FROM CursorTotal into @OrderID,@Total,@NewTotalWHILE @@FETCH_STATUS = 0BEGIN 	INSERT INTO #TotalDeCompra	(OrderID,TotalAnterior,TotalDescuento)	VALUES (@OrderID,@Total,@NewTotal) 	FETCH NEXT FROM CursorTotal INTO @Total, @OrderID, @NewTotalENDCLOSE CursorTotalDEALLOCATE CursorTotalSELECT * FROM #TotalDeCompraDROP TABLE #TotalDeCompra