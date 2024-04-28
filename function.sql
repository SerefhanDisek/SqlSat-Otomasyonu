-- M��terilerin �r�nleri yanl�� sipari� etme ihtimalini ya�a ba�lad�k. 
-- Bunu da a�a��daki fonksiyon ile 3 s�n�fa b�l�p m��teri ID'si ile risk hesapl�yoruz.
IF OBJECT_ID('dbo.CalculateRiskValue') IS NOT NULL
BEGIN 
 DROP FUNCTION CalculateRiskValue
END
GO

CREATE FUNCTION CalculateRiskValue (@musteriID INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @RiskDe�eri MONEY
    DECLARE @Yas INT
    
    -- M��terinin ya��n� bulma
    SELECT @Yas = DATEDIFF(yy, DTarihi, GETDATE())
    FROM M��teri
    WHERE ID = @musteriID

    -- Risk de�eri hesaplama
    SELECT @RiskDe�eri = CASE
                            WHEN @Yas < 25 THEN 100 -- �rnek bir risk de�eri atamas�
                            WHEN @Yas BETWEEN 25 AND 40 THEN 50
                            ELSE 25
                        END
    
    RETURN @RiskDe�eri
END
GO
--Test k�sm�
SELECT dbo.CalculateRiskValue(5)