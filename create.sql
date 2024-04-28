IF DB_ID('SatisOtomasyonu') IS NOT NULL
	BEGIN
		ALTER DATABASE [SatisOtomasyonu] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
		USE master
		DROP DATABASE SatisOtomasyonu
	END
GO

CREATE DATABASE SatisOtomasyonu
	ON PRIMARY (
				NAME = 'SatisOtomasyonudb',
				FILENAME = 'c:\database\SatisOtomasyonu_db.mdf',
				SIZE = 5MB,
				MAXSIZE = 100MB,
				FILEGROWTH = 5MB
				)
	LOG ON		(
				NAME = 'SatisOtomasyonudb_log',
				FILENAME = 'c:\database\SatisOtomasyonu_log.ldf',
				SIZE = 2MB,
				MAXSIZE = 50MB,
				FILEGROWTH = 1MB
				)
GO

USE SatisOtomasyonu


 --Bu tablo departmanlar tutulur.
 CREATE TABLE Departman (
 ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 Ad VARCHAR(20) NOT NULL,
 )

  --Bu tablo ürün kategorilerini tutar.
 CREATE TABLE UrunKategorisi (
 ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 Ad VARCHAR(20) NOT NULL
 )

  --Bu tabloda il isimleri tutulur.
CREATE TABLE Il(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
AD nVARCHAR (30) NOT NULL
)

--Bu tabloda ilçe isimleri tutulur.
CREATE TABLE Ilce(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
AD nVARCHAR (50) NOT NULL,
IlID INT FOREIGN KEY REFERENCES Il(ID) NOT NULL
)

--Bu tabloda mahalle isimleri tutulur.
CREATE TABLE Mahalle(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
AD nVARCHAR(50) NOT NULL,
IlceID INT FOREIGN KEY REFERENCES Ilce(ID) NOT NULL,
)

--Bu tabloda sokak isimleri tutulur.
CREATE TABLE Sokak(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
AD nVARCHAR(50) NOT NULL,
MahalleID INT FOREIGN KEY REFERENCES Mahalle(ID) NOT NULL,
)

--Bu tablo sipariþ durumunu tutar.
CREATE TABLE SiparisDurumu(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SiparisAD INT NOT NULL,
)

--Bu tabloda sipariþ fatura türleri tutulur.
CREATE TABLE SiparisFaturaTuru(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SiparisFaturaTuruAD INT NOT NULL,
)

--Bu tabloda tahsilat türleri tutlur.
CREATE TABLE TahsilatTuru(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
AD nVARCHAR(50) NOT NULL
)

--Bu tabloda kargo bilgileri tutulur.
CREATE TABLE Kargo(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
FirmaAdi nVARCHAR(500) NOT NULL,
Tel CHAR(10) CONSTRAINT chktel CHECK (Tel LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
)

   --Bu tabloda depolarla ilgili bilgiler tutulur.
 CREATE TABLE Depo (
 ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 DepoAd VARCHAR(20) NOT NULL,
 Kapasite INT NOT NULL,
 Doluluk INT NOT NULL
 )

   --Bu tabloda þubeler tutulur.
 CREATE TABLE Sube (
 ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 DepoID INT FOREIGN KEY REFERENCES Depo(ID) NOT NULL,
 SubeAd VARCHAR(20) NOT NULL
 )

--Bu tabloda personele ait bilgiler tutulur.
 CREATE TABLE Personel (
 ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 DepartmanID INT FOREIGN KEY REFERENCES Departman(ID) NOT NULL ,
 SubeID INT FOREIGN KEY REFERENCES Sube(ID) NOT NULL ,
 Ad VARCHAR (25) NOT NULL,
 Soyad VARCHAR(25)NOT NULL,
 TCNo char(11) NOT NULL,
 Maaþ MONEY NOT NULL,
 EsiVarMi SMALLINT DEFAULT 1,
 CocukVarMi SMALLINT DEFAULT 1
 )

  --Bu tabloda müþteriye air bilgiler tutulur.
 CREATE TABLE Müþteri(
 ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 PersonelID INT FOREIGN KEY REFERENCES Personel(ID) NOT NULL, 
 Ad VARCHAR (25) NOT NULL,
 Soyad VARCHAR(25)NOT NULL,
 MüsteriNo INT NOT NULL,
 Tel CHAR(10) CONSTRAINT chktel_Müþteri CHECK (Tel LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
 IbanNumarasý Char(26)NOT NULL,
 Mail VARCHAR(50)
 CONSTRAINT unqtbluyemail UNIQUE 
 CONSTRAINT chktbluemaiil CHECK (Mail LIKE '%@%.%')
 CONSTRAINT notnulltbluyemail NOT NULL,
 MüsteriTipi VARCHAR(30) NOT NULL,
 DTarihi DATE NOT NULL,
 Yas as DATEDIFF (yy,DTArihi , GETDATE()),
 RiskLimiti MONEY NOT NULL,
 RiskDeðeri MONEY NOT NULL,
 ZiyaretGünü MONEY ,
 Aktiflik SMALLINT DEFAULT 1 NOT NULL 
 )

   --Bu tabloda adres bilgileri tutulur.
 CREATE TABLE Adres(
 ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 AdresAD VARCHAR(20) NOT NULL,
 DýsKapýNO INT NOT NULL,
 IcKapýNo INT ,--Müstakil tek kapýlý daireler olabilir bu sebeple null
 Tel CHAR(10) CONSTRAINT chktel_Adres CHECK (Tel LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
 AnaAdresMi SMALLINT DEFAULT 1 NOT NULL, -- Ana Adres ise 1 deðil ise 0
 IlID INT FOREIGN KEY REFERENCES Il(ID) NOT NULL,
 IlceID INT FOREIGN KEY REFERENCES Ilce(ID) NOT NULL,
 MahalleID INT FOREIGN KEY REFERENCES Mahalle(ID) NOT NULL,
 SokakID INT FOREIGN KEY REFERENCES Sokak(ID) NOT NULL,
 MusteriID INT FOREIGN KEY REFERENCES Müþteri(ID) NOT NULL,
 DepoID INT FOREIGN KEY REFERENCES Depo(ID),
 )

 --Bu tablo Departman ve Sube tablolarýnýn arasýndaki çoka çok iliþkiyi saðlar.
 CREATE TABLE Vardir (
 ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 DepartmanID INT FOREIGN KEY REFERENCES Departman(ID) NOT NULL,
 SubeID INT FOREIGN KEY REFERENCES Sube(ID) NOT NULL,
 )

 --Bu tabloda ürün bilgileri tutulur.
 CREATE TABLE Urun(
 UrunKodu INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
 UrunKategorisiID INT FOREIGN KEY REFERENCES UrunKategorisi(ID)NOT NULL,
 Fiyat MONEY NOT NULL,
 UrunTipi VARCHAR (30) NOT NULL,
 UrunAd VARCHAR(30) NOT NULL,
 UrunKdvOraný FLOAT NOT NULL
 )

 --Bu tablo Depo ve Urun tablolarý arasýndaki çoka çok iliþkiyi saðlar.
 CREATE TABLE Stoklanýr(
 StokMiktarýID INT IDENTITY (1,1) PRIMARY KEY,
 StokMiktarý INT ,
 DepoID INT FOREIGN KEY REFERENCES Depo(ID) NOT NULL,
 UrunID INT FOREIGN KEY REFERENCES Urun(UrunKodu) NOT NULL
 )

--Bu tabloda birim setleri tutulur.
CREATE TABLE BirimSeti(
ID INT IDENTITY (1,1) PRIMARY KEY,
AnaBirimMi SMALLINT DEFAULT 1 NOT NULL,
UrunID INT FOREIGN KEY REFERENCES Urun(UrunKodu) NOT NULL
)

--Bu tablo Depo-Birim seti, Urun-Birim seti tablolarý arasýndaki çoka çok iliþkiyi saðlar.
CREATE TABLE tblTransfer (
TransferID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
Miktar INT NOT NULL,
Tarih DATE NOT NULL,
DepoID INT FOREIGN KEY REFERENCES Depo(ID) NOT NULL,
BirimSetiID INT FOREIGN KEY REFERENCES BirimSeti(ID) NOT NULL,
UrunID INT FOREIGN KEY REFERENCES Urun(UrunKodu) NOT NULL
)

--Bu tabloda Barkod bilgileri tutulur.
CREATE TABLE Barkod(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
BarkodNO nVARCHAR(500) NOT NULL,
BirimSetiID INT FOREIGN KEY REFERENCES BirimSeti(ID) NOT NULL,
)

--Bu tabloda sipariþ bilgileri tutulur.
CREATE TABLE Siparis(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
AdresID INT FOREIGN KEY REFERENCES Adres(ID) NOT NULL,
SiparisDurumuID INT FOREIGN KEY REFERENCES SiparisDurumu(ID) NOT NULL,
DepoID INT FOREIGN KEY REFERENCES Depo(ID) NOT NULL,
SiparisFaturaTuruID INT FOREIGN KEY REFERENCES SiparisFaturaTuru(ID) NOT NULL,
MüþteriID INT FOREIGN KEY REFERENCES Müþteri(ID) NOT NULL,
IlgilenenPersonel INT FOREIGN KEY REFERENCES Personel(ID) NOT NULL,
SiparisNO INT NOT NULL,
Tarih DATE NOT NULL,
BrütToplam MONEY NOT NULL,
NetToplam MONEY NOT NULL,
IndýrýmToplam MONEY ,
)

--Bu tabloda Brüt toplam ve Net fiyat hesabý yapýlýr.
CREATE TABLE Icerir(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
UrunID INT FOREIGN KEY REFERENCES Urun(UrunKodu) NOT NULL,
SiparisID INT FOREIGN KEY REFERENCES Siparis(ID) NOT NULL,
Tarih DATE NOT NULL,
Miktar FLOAT NOT NULL,
Indirim DECIMAL(18,2),
KDV FLOAT NOT NULL,
UrunFiyati DECIMAL(18,2) NOT NULL,
KDVToplami DECIMAL(18,2) NOT NULL,
BrütToplam AS (UrunFiyati * Miktar * KDVToplami / 100.0) ,
NetFiyat DECIMAL(18,2) 
)

--Bu tablo fatura bilgilerini tutar.
CREATE TABLE Fatura(
FaturaNO INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
SiparisFaturaTuru INT FOREIGN KEY REFERENCES SiparisFaturaTuru(ID) NOT NULL,
KargoID INT FOREIGN KEY REFERENCES Kargo(ID) NOT NULL,
IlgilenenPersonel INT FOREIGN KEY REFERENCES Personel(ID) NOT NULL,
SiparisID INT FOREIGN KEY REFERENCES Siparis(ID) NOT NULL,
Tarih DATE NOT NULL,
DüzenlemeTarihi DATE NOT NULL,
Tutar MONEY NOT NULL,
KargoKodu nVARCHAR(50) NOT NULL,
)

--Bu tabloda tahsilat bilgileri tutulur.
CREATE TABLE Tahsilat(
ID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
TahsilatTuru INT FOREIGN KEY REFERENCES TahsilatTuru(ID) NOT NULL,
IlgilenenPersonel INT FOREIGN KEY REFERENCES Personel(ID) NOT NULL,
TahsilatID INT FOREIGN KEY REFERENCES Tahsilat(ID) NOT NULL,
Tarih DATE NOT NULL,
BelgeNO nVARCHAR(50) NOT NULL,
Tutar MONEY NOT NULL,
)

