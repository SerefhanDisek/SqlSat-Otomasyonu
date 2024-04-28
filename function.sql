-- Müþterilerin ürünleri yanlýþ sipariþ etme ihtimalini yaþa baðladýk. 
-- Bunu da aþaðýdaki fonksiyon ile 3 sýnýfa bölüp müþteri ID'si ile risk hesaplýyoruz.
IF OBJECT_ID('dbo.CalculateRiskValue') IS NOT NULL
BEGIN 
 DROP FUNCTION CalculateRiskValue
END
GO

CREATE FUNCTION CalculateRiskValue (@musteriID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @RiskDeðeri MONEY
    DECLARE @Yas INT
    
    -- Müþterinin yaþýný bulma
    SELECT @Yas = DATEDIFF(yy, DTarihi, GETDATE())
    FROM Müþteri
    WHERE ID = @musteriID

    -- Risk deðeri hesaplama
    SELECT @RiskDeðeri = CASE
                            WHEN @Yas < 25 THEN 100 -- Örnek bir risk deðeri atamasý
                            WHEN @Yas BETWEEN 25 AND 40 THEN 50
                            ELSE 25
                        END
    
    RETURN @RiskDeðeri
END
GO
--Test kýsmý
SELECT dbo.CalculateRiskValue(5)