USE SatisOtomasyonu
GO

CREATE TRIGGER TRG_MusteriEklemee
ON M��teri
AFTER INSERT
AS
BEGIN
    DECLARE @DTarihi DATE;
    SELECT @DTarihi = DTarihi FROM inserted;
    DECLARE @YilSay INT = DATEDIFF(YY, @DTarihi, GETDATE());

    IF @YilSay < 18
    BEGIN
        RAISERROR('M��teri DTarihi 18''den k���k olarak kaydedilemez.', 16, 1);
		PRINT 'M��teri DTarihi 18''den k���k olarak kaydedilemez.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        PRINT '��lem Ba�ar�l�.';
        COMMIT TRANSACTION;
    END
END
