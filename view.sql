/*  
    Bu view, m��teri, sipari� ve fatura bilgilerini birle�tirerek m��terilere ait
    en son sipari� ve fatura bilgilerini getirir. Ayr�ca CalculateRiskValue fonksiyonunu
    kullanarak m��teri risk de�erini hesaplar.
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
        S.M��teriID,
        S.SiparisNO,
        S.Tarih AS SiparisTarihi,
        F.FaturaNO,
        F.Tarih AS FaturaTarihi,
        F.Tutar AS FaturaTutar,
        ROW_NUMBER() OVER (PARTITION BY S.M��teriID ORDER BY S.Tarih DESC) AS SiparisSirasi
    FROM
        Siparis S
    LEFT JOIN Fatura F ON S.ID = F.SiparisID
)
SELECT
    ISNULL(M.ID, -1) AS M��teriID, -- M��teri ID'si olmayan kay�tlar� i�aretlemek i�in -1 ya da ba�ka bir de�er kullanabilirsiniz
    M.Ad AS M��teriAd,
    M.Soyad AS M��teriSoyad,
    SF.SiparisID,
    SF.SiparisNO,
    SF.SiparisTarihi,
    SF.FaturaNO,
    CASE
        WHEN SF.FaturaTarihi IS NOT NULL THEN FORMAT(SF.FaturaTarihi, 'dd.MM.yyyy') -- Fatura Tarihini belirli bir bi�ime d�n��t�rme
        ELSE NULL
    END AS FaturaTarihi,
    SF.FaturaTutar,
	dbo.CalculateRiskValue(ISNULL(M.ID, -1)) AS RiskDegeri -- CalculateRiskValue fonksiyonunu kullanarak risk de�eri hesapla
FROM
    SiparisFaturaCTE SF
LEFT JOIN M��teri M ON SF.M��teriID = M.ID AND SF.SiparisSirasi = 1;

GO
/* test sorgusu

Bu sorgu, M��teri tablosundan belirli bir m��terinin ad�n� ve soyad�n� al�r. Daha sonra, vw_MusteriSiparisFaturaBilgileri1 
view'�n� kullanarak bu m��terinin en son sipari� ve fatura bilgilerini �eker. WHERE ko�ulu ile istedi�iniz m��teri ID'sini 
belirleyebilirsiniz. Bu sorguyu kendi gereksinimlerinize g�re uyarlayabilirsiniz.

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
    M��teri M ON vw.M��teriID = M.ID
WHERE
    M.ID = 1; -- Test etmek istedi�iniz m��teri ID'si


