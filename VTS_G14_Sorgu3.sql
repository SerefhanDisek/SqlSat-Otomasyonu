--SoruID_3: Stokta olan ürünlerin adýný, liste fiyatýný, adedini (quantity) ve tedarikçisini (vendor) listeleyen sql sorgusunu yazýnýz.

SELECT DISTINCT
	P.Name AS ÜrunAdý,
	PH.ListPrice AS ListeFiyatý,
	I.Quantity AS Adet,
	V.Name AS Tedarikçi

FROM Production.Product AS P
	
	INNER JOIN Production.ProductInventory AS I ON P.ProductID = I.ProductID 
	INNER JOIN Purchasing.ProductVendor AS PV ON  P.ProductID = PV.ProductID 
	INNER JOIN Purchasing.Vendor AS V ON PV.BusinessEntityID = V.BusinessEntityID 
	INNER JOIN Production.ProductListPriceHistory AS PH ON P.ProductID = PH.ProductID 
	INNER JOIN (SELECT DISTINCT
		PH.ListPrice AS ListeFiyatý
		FROM Production.ProductListPriceHistory AS PH

		INNER JOIN Production.Product AS P ON PH.ProductID = P.ProductID
		
		WHERE EndDate IS NULL) AS LP ON P.ProductID = PH.ProductID --En güncel ListeFiyatýna ulaþabilmek için yazýlmýþ alt sorgumuz.

WHERE I.Quantity > 0 




	

