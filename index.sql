USE SatisOtomasyonu;
GO

-- Index oluþturmadan önce
SET STATISTICS IO ON;

-- Ýlk tabloyu (INDEX öncesi) bu sorguyla çaðýrýyoruz
SELECT Ad, Soyad, MüsteriNo, Tel, IbanNumarasý, Mail, MüsteriTipi, DTarihi, RiskLimiti, RiskDeðeri, ZiyaretGünü, Aktiflik
FROM Müþteri 
WHERE Aktiflik = 1 AND Yas > 25
ORDER BY DTarihi DESC;

-- IO istatistiklerini kapat
SET STATISTICS IO OFF;

-- Nonclustered Indexi burada oluþturuyoruz
CREATE NONCLUSTERED INDEX IX_Musteri_TumAlanlar 
ON Müþteri (Ad ASC, Soyad ASC, MüsteriNo ASC)
INCLUDE (Tel, IbanNumarasý, Mail, MüsteriTipi, DTarihi, RiskLimiti, RiskDeðeri, ZiyaretGünü, Aktiflik);

SET STATISTICS IO ON;

-- Ýkinci tabloyu (INDEX sonrasý) bu sorguyla çaðýrýyoruz
SELECT Ad, Soyad, MüsteriNo, Tel, IbanNumarasý, Mail, MüsteriTipi, DTarihi, RiskLimiti, RiskDeðeri, ZiyaretGünü, Aktiflik
FROM Müþteri 
WHERE Aktiflik = 1
ORDER BY DTarihi DESC;

SET STATISTICS IO OFF;
