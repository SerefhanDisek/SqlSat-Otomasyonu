USE SatisOtomasyonu;
GO

-- Index olu�turmadan �nce
SET STATISTICS IO ON;

-- �lk tabloyu (INDEX �ncesi) bu sorguyla �a��r�yoruz
SELECT Ad, Soyad, M�steriNo, Tel, IbanNumaras�, Mail, M�steriTipi, DTarihi, RiskLimiti, RiskDe�eri, ZiyaretG�n�, Aktiflik
FROM M��teri 
WHERE Aktiflik = 1 AND Yas > 25
ORDER BY DTarihi DESC;

-- IO istatistiklerini kapat
SET STATISTICS IO OFF;

-- Nonclustered Indexi burada olu�turuyoruz
CREATE NONCLUSTERED INDEX IX_Musteri_TumAlanlar 
ON M��teri (Ad ASC, Soyad ASC, M�steriNo ASC)
INCLUDE (Tel, IbanNumaras�, Mail, M�steriTipi, DTarihi, RiskLimiti, RiskDe�eri, ZiyaretG�n�, Aktiflik);

SET STATISTICS IO ON;

-- �kinci tabloyu (INDEX sonras�) bu sorguyla �a��r�yoruz
SELECT Ad, Soyad, M�steriNo, Tel, IbanNumaras�, Mail, M�steriTipi, DTarihi, RiskLimiti, RiskDe�eri, ZiyaretG�n�, Aktiflik
FROM M��teri 
WHERE Aktiflik = 1
ORDER BY DTarihi DESC;

SET STATISTICS IO OFF;
