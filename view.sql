/*  
    Bu view, müþteri, sipariþ ve fatura bilgilerini birleþtirerek müþterilere ait
    en son sipariþ ve fatura bilgilerini getirir. Ayrýca CalculateRiskValue fonksiyonunu
    kullanarak müþteri risk deðerini hesaplar.
*/
IF OBJECT_ID('vw_MusteriSiparisFaturaBilgileri1') IS NOT NULL
BEGIN 
 DROP VIEW vw_MusteriSiparisFaturaBilgileri1
END
GO

CREATE VIEW vw_MusteriSiparisFaturaBilgileri1
AS
WITH SiparisFaturaCTE AS (
    SELECT
        S.ID AS SiparisID,
        S.MüþteriID,
        S.SiparisNO,
        S.Tarih AS SiparisTarihi,
        F.FaturaNO,
        F.Tarih AS FaturaTarihi,
        F.Tutar AS FaturaTutar,
        ROW_NUMBER() OVER (PARTITION BY S.MüþteriID ORDER BY S.Tarih DESC) AS SiparisSirasi
    FROM
        Siparis S
    LEFT JOIN Fatura F ON S.ID = F.SiparisID
)
SELECT
    ISNULL(M.ID, -1) AS MüþteriID, -- Müþteri ID'si olmayan kayýtlarý iþaretlemek için -1 ya da baþka bir deðer kullanabilirsiniz
    M.Ad AS MüþteriAd,
    M.Soyad AS MüþteriSoyad,
    SF.SiparisID,
    SF.SiparisNO,
    SF.SiparisTarihi,
    SF.FaturaNO,
    CASE
        WHEN SF.FaturaTarihi IS NOT NULL THEN FORMAT(SF.FaturaTarihi, 'dd.MM.yyyy') -- Fatura Tarihini belirli bir biçime dönüþtürme
        ELSE NULL
    END AS FaturaTarihi,
    SF.FaturaTutar,
	dbo.CalculateRiskValue(ISNULL(M.ID, -1)) AS RiskDegeri -- CalculateRiskValue fonksiyonunu kullanarak risk deðeri hesapla
FROM
    SiparisFaturaCTE SF
LEFT JOIN Müþteri M ON SF.MüþteriID = M.ID AND SF.SiparisSirasi = 1;

GO
/* test sorgusu

Bu sorgu, Müþteri tablosundan belirli bir müþterinin adýný ve soyadýný alýr. Daha sonra, vw_MusteriSiparisFaturaBilgileri1 
view'ýný kullanarak bu müþterinin en son sipariþ ve fatura bilgilerini çeker. WHERE koþulu ile istediðiniz müþteri ID'sini 
belirleyebilirsiniz. Bu sorguyu kendi gereksinimlerinize göre uyarlayabilirsiniz.

*/
SELECT
    MusteriAd = M.Ad,
    MusteriSoyad = M.Soyad,
    SiparisID = vw.SiparisID,
    SiparisNO = vw.SiparisNO,
    SiparisTarihi = vw.SiparisTarihi,
    FaturaNO = vw.FaturaNO,
    FaturaTarihi = vw.FaturaTarihi,
    FaturaTutar = vw.FaturaTutar,
    RiskDegeri = vw.RiskDegeri
FROM
    vw_MusteriSiparisFaturaBilgileri1 vw
JOIN
    Müþteri M ON vw.MüþteriID = M.ID
WHERE
    M.ID = 1; -- Test etmek istediðiniz müþteri ID'si


