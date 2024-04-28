--SoruID_3: Stokta olan �r�nlerin ad�n�, liste fiyat�n�, adedini (quantity) ve tedarik�isini (vendor) listeleyen sql sorgusunu yaz�n�z.

SELECT DISTINCT
	P.Name AS �runAd�,
	PH.ListPrice AS ListeFiyat�,
	I.Quantity AS Adet,
	V.Name AS Tedarik�i

FROM Production.Product AS P
	
	INNER JOIN Production.ProductInventory AS I ON P.ProductID = I.ProductID 
	INNER JOIN Purchasing.ProductVendor AS PV ON  P.ProductID = PV.ProductID 
	INNER JOIN Purchasing.Vendor AS V ON PV.BusinessEntityID = V.BusinessEntityID 
	INNER JOIN Production.ProductListPriceHistory AS PH ON P.ProductID = PH.ProductID 
	INNER JOIN (SELECT DISTINCT
		PH.ListPrice AS ListeFiyat�
		FROM Production.ProductListPriceHistory AS PH

		INNER JOIN Production.Product AS P ON PH.ProductID = P.ProductID
		
		WHERE EndDate IS NULL) AS LP ON P.ProductID = PH.ProductID --En g�ncel ListeFiyat�na ula�abilmek i�in yaz�lm�� alt sorgumuz.

WHERE I.Quantity > 0 




	

