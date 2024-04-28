USE SatisOtomasyonu
GO

CREATE PROCEDURE SP_MusteriEklemee
    @PersonelID INT,
    @Ad VARCHAR(25),
    @Soyad VARCHAR(25),
    @MusteriNo INT,
    @Tel CHAR(10),
    @IbanNumarasi CHAR(26),
    @Mail VARCHAR(50),
    @MusteriTipi VARCHAR(30),
    @DTarihi DATE,
    @RiskLimiti MONEY,
    @RiskDegeri MONEY,
    @ZiyaretGunu MONEY,
    @Aktiflik SMALLINT
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Müþteri (PersonelID, Ad, Soyad, MüsteriNo, Tel, IbanNumarasý, Mail, MüsteriTipi, DTarihi, RiskLimiti, RiskDeðeri, ZiyaretGünü, Aktiflik)
        VALUES (@PersonelID, @Ad, @Soyad, @MusteriNo, @Tel, @IbanNumarasi, @Mail, @MusteriTipi, @DTarihi, @RiskLimiti, @RiskDegeri, @ZiyaretGunu, @Aktiflik);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        
    END CATCH;
END

