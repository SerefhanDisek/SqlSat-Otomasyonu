USE SatisOtomasyonu
GO

CREATE TRIGGER TRG_MusteriEklemee
ON Müþteri
AFTER INSERT
AS
BEGIN
    DECLARE @DTarihi DATE;
    SELECT @DTarihi = DTarihi FROM inserted;
    DECLARE @YilSay INT = DATEDIFF(YY, @DTarihi, GETDATE());

    IF @YilSay < 18
    BEGIN
        RAISERROR('Müþteri DTarihi 18''den küçük olarak kaydedilemez.', 16, 1);
		PRINT 'Müþteri DTarihi 18''den küçük olarak kaydedilemez.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        PRINT 'Ýþlem Baþarýlý.';
        COMMIT TRANSACTION;
    END
END
