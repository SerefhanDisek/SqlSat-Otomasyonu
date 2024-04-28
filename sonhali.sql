use SatisOtomasyonu
INSERT INTO  Departman (Ad)
VALUES ('Sat��'), ('Muhasebe'), ('�nsan Kaynaklar�'), ('Pazarlama'), ('�retim')
INSERT INTO UrunKategorisi (Ad)
VALUES ('Elektronik'), ('Giyim'), ('Ev E�yalar�'), ('Kitap'), ('Spor')
INSERT INTO Il (AD) VALUES
('�stanbul'),
('Ankara'),
('�zmir'),
('Bursa'),
('Adana'),
('Antalya'),
('Konya'),
('Gaziantep'),
('�anl�urfa'),
('Mersin'),
('Diyarbak�r'),
('Samsun'),
('Eski�ehir'),
('Malatya'),
('Kayseri');
INSERT INTO Ilce (AD, IlID) VALUES
('Kad�k�y', 1),
('�sk�dar', 1),
('Be�ikta�', 1),
('�ankaya', 2),
('K�z�lay', 2),
('Bornova', 3),
('Kar��yaka', 3),
('Osmangazi', 4),
('Y�ld�r�m', 4),
('Seyhan', 5),
('�ukurova', 5),
('Muratpa�a', 6),
('Kepez', 6),
('Sel�uklu', 7),
('Karatay', 7),
('�ahinbey', 8),
('Haliliye', 9),
('Ba�lar', 10),
('�lkad�m', 11),
('Tepeba��', 12),
('Battalgazi', 13),
('Kocasinan', 14),
('Akdeniz', 15);
INSERT INTO Mahalle (AD, IlceID) VALUES
('�i�ekli Mahallesi', 1),
('Ye�ilg�l Sokak', 2),
('G�lsever Caddesi', 3),
('Papatyal� Sokak', 4),
('Serin�ay�r Mahallesi', 5),
('G�ne�li Soka��', 6),
('Me�ekent Mahallesi', 7),
('G�ky�z� Caddesi', 8),
('Ay�i�e�i Sokak', 9),
('�ehirpark Mahallesi', 10),
('U�urb�ce�i Sokak', 11),
('Denizk�y�s� Mahallesi', 12),
('Y�ld�zl� Soka��', 13),
('��naralt� Mahallesi', 14),
('�ris �i�e�i Sokak', 15),
('Elmal� Mahallesi', 1),
('Mavi G�l Caddesi', 2),
('S�mb�l Sokak', 3),
('Ormanl�k Mahallesi', 4),
('Ay����� Soka��', 5),
('�elale Mahallesi', 6),
('G�nebakan Caddesi', 7),
('Karanfil Sokak', 8),
('P�narba�� Mahallesi', 9),
('G�lhane Soka��', 10),
('�aml�k Mahallesi', 11),
('R�zgarl� Caddesi', 12),
('Lale Sokak', 13),
('�ehitler Mahallesi', 14),
('Manolya Soka��', 15);
INSERT INTO Sokak (AD, MahalleID) VALUES
('Ba�dat Caddesi', 1),
( 'Ba�dat2 Caddesi', 2),
( 'Ba�dat3 Caddesi', 3),
( 'Atat�rk Bulvar�', 4),
( 'Konya Caddesi', 5),
( '�zmir Caddesi', 6),
( 'Mithatpa�a Caddesi', 7),
( 'Cumhuriyet Caddesi', 8),
( '�stiklal Caddesi', 9),
( 'Bar�� Caddesi', 10),
( 'Kaz�m Karabekir Caddesi', 11),
( '�n�n� Caddesi', 12),
( 'Menderes Caddesi', 13),
( 'Milli Egemenlik Caddesi', 14),
( 'Gazi Caddesi', 15),
( 'Ankara Sokak', 16),
( '�stanbul Sokak', 17),
( 'Gazi Sokak', 18),
( 'Kemal Atat�rk Sokak', 19),
( 'Yavuz Sultan Selim Sokak', 20),
( 'Fevzi �akmak Sokak', 21),
( 'Mustafa Kemal Sokak', 22),
( 'Zafer Sokak', 23),
( 'Milli M�cadele Sokak', 24),
( '�ankaya Sokak', 25),
( 'Fatih Sokak', 26),
( 'Y�ld�r�m Sokak', 27),
( '�ehitler Sokak', 28),
( 'Adalet Sokak', 29),
( 'Ne�e Sokak', 30);
INSERT INTO SiparisDurumu (SiparisAD)
VALUES (1),
       (2),
       (3),
       (4),
       (5);
INSERT INTO SiparisFaturaTuru (SiparisFaturaTuruAD)
VALUES (1), (2), (3), (4), (5)
INSERT INTO TahsilatTuru (AD)
VALUES ('Nakit'), ('Kredi Kart�'), ('Havale'), ('EFT'), ('�ek')
INSERT INTO Kargo (FirmaAdi, Tel)
VALUES ('Aras Kargo', '1234567890'), ('MNG Kargo', '2345678901'), ('UPS Kargo', '3456789012'), ('PTT Kargo', '4567890123'), ('Yurti�i Kargo', '5678901234')
INSERT INTO Depo (DepoAd, Kapasite, Doluluk) VALUES
('Depo 1', 100, 50),
('Depo 2', 200, 100),
('Depo 3', 150, 75),
('Depo 4', 120, 60),
('Depo 5', 180, 90),
('Depo 6', 250, 125),
('Depo 7', 300, 150),
('Depo 8', 200, 100),
('Depo 9', 150, 75),
('Depo 10', 180, 90),
('Depo 11', 120, 60),
('Depo 12', 250, 125),
('Depo 13', 300, 150),
('Depo 14', 200, 100),
('Depo 15', 150, 75);
INSERT INTO Sube (DepoID, SubeAd)
VALUES (1, '�ube 1'),
       (2, '�ube 2'),
       (3, '�ube 3'),
       (4, '�ube 4'),
       (5, '�ube 5'),
       (6, '�ube 6'),
       (7, '�ube 7'),
       (8, '�ube 8'),
       (9, '�ube 9'),
       (10, '�ube 10'),
       (11, '�ube 11'),
       (12, '�ube 12'),
       (13, '�ube 13'),
       (14, '�ube 14'),
       (15, '�ube 15');
INSERT INTO Personel (DepartmanID, SubeID, Ad, Soyad, TCNo, Maa�, EsiVarMi, CocukVarMi) VALUES
-- Departman 1 - �ube 1
(1, 1, 'Ahmet', 'Y�lmaz', '12345678901', 5000.00, 1, 1),
(1, 2, 'Ay�e', 'Demir', '23456789012', 4500.00, 1, 0),

-- Departman 1 - �ube 2
(1, 3, 'Mehmet', 'Kaya', '34567890123', 4800.00, 0, 0),
(1, 4, 'Fatma', '�zt�rk', '45678901234', 5200.00, 1, 0),

-- Departman 1 - �ube 3
(1, 5, 'Ali', '�elik', '56789012345', 4700.00, 1, 1),
(1, 6, 'Zeynep', '�ahin', '67890123456', 4900.00, 1, 0),

-- Departman 2 - �ube 4
(2, 7, 'Mustafa', 'Arslan', '78901234567', 5100.00, 1, 0),
(2, 8, 'Selin', 'Y�ld�z', '89012345678', 4800.00, 1, 0),

-- Departman 2 - �ube 5
(2, 9, 'Emre', 'Demir', '90123456789', 5200.00, 1, 0),
(2, 10, 'Asl�', 'Kara', '01234567890', 4700.00, 0, 0),

-- Departman 3 - �ube 6
(3, 11, 'Murat', 'K�se', '12345678901', 4900.00, 1, 1),
(3, 12, 'Gamze', 'Kurt', '23456789012', 5000.00, 1, 0),

-- Departman 3 - �ube 7
(3, 7, 'Eren', 'Can', '34567890123', 4800.00, 1, 0),
(3, 13, 'Seda', 'Ayd�n', '45678901234', 5100.00, 0, 0),

-- Departman 3 - �ube 8
(3, 8, 'Hasan', 'Bulut', '56789012345', 4900.00, 1, 1),
(3, 15, 'Aylin', 'Ate�', '67890123456', 5000.00, 1, 0),

-- Departman 4 - �ube 9
(4, 9, '�smail', 'Tekin', '78901234567', 5000.00, 1, 0),
(4, 14, 'Elif', 'G�ne�', '89012345678', 4900.00, 1, 1),

-- Departman 5 - �ube 10
(5, 10, '�brahim', 'Akg�n', '90123456789', 5100.00, 1, 0),
(5, 15, 'Ece', 'Do�an', '01234567890', 4800.00, 0, 0);

INSERT INTO M��teri (PersonelID, Ad, Soyad, M�steriNo, Tel, IbanNumaras�, Mail, M�steriTipi, DTarihi, RiskLimiti, RiskDe�eri, ZiyaretG�n�, Aktiflik) VALUES
(1, 'Ali', 'Y�lmaz', 12345, '5551112233', 'TR12345678901234567890123', 'ali.yilmaz@example.com', 'Bireysel', '1980-05-15', 5000, 2000, 1, 0),
(2, 'Ay�e', 'Kara', 23456, '5552223344', 'TR23456789012345678901234', 'ayse.kara@example.com', 'Kurumsal', '1995-12-03', 10000, 5000, 2, 1),
(3, 'Mehmet', 'Demir', 34567, '5553334455', 'TR34567890123456789012345', 'mehmet.demir@example.com', 'Bireysel', '1992-09-22', 8000, 3, NULL, 1),
(4, 'Fatma', 'Y�ld�z', 45678, '5554445566', 'TR45678901234567890123456', 'fatma.yildiz@example.com', 'Kurumsal', '1988-07-18', 15000, 1, 300, 0),
(5, 'Ahmet', 'Ko�', 56789, '5555556677', 'TR56789012345678901234567', 'ahmet.koc@example.com', 'Bireysel', '1975-03-10', 10000, 4000, 2, 1),
(6, 'Zeynep', '�ahin', 67890, '5556667788', 'TR67890123456789012345678', 'zeynep.sahin@example.com', 'Kurumsal', '1998-11-27', 12000, 3, 250, 1),
(7, 'Mustafa', 'Ayd�n', 78901, '5557778899', 'TR78901234567890123456789', 'mustafa.aydin@example.com', 'Bireysel', '1983-08-07', 6000, 4, NULL, 0),
(8, 'Elif', '�zt�rk', 89012, '5558889900', 'TR89012345678901234567890', 'elif.ozturk@example.com', 'Kurumsal', '1990-06-25', 9000, 3500, 5, 1),
(9, 'Murat', '�ahin', 90123, '5559990011', 'TR90123456789012345678901', 'murat.sahin@example.com', 'Bireysel', '1977-04-14', 7000, 2800, 6, 1),
(5, 'Gizem', 'Y�lmaz', 10111, '5550001122', 'TR10123456789012345678901', 'gizem.yilmaz@example.com', 'Kurumsal', '1993-10-08', 11000, 4500, 7, 1),
(4, 'Serkan', 'Ak�n', 11122, '5551112233', 'TR11123456789012345678901', 'serkan.akin@example.com', 'Bireysel', '1985-01-19', 5500, 2000, 2, 1),
(11, 'P�nar', 'Demir', 12233, '5552223344', 'TR12234567890123456789001', 'pinar.demir@example.com', 'Kurumsal', '1997-07-05', 9500, 3800, 6, 0),
(13, 'Kadir', 'Kaya', 13344, '5553334455', 'TR13345678901234567890123', 'kadir.kaya@example.com', 'Bireysel', '1982-04-30', 7500, 3000, 2, 1),
(12, 'Seda', 'Ayd�n', 14455, '5554445566', 'TR1445678901234567890123', 'seda.aydin@example.com', 'Kurumsal', '1994-02-14', 13000, 5500, 3, 1),
(10, 'Emre', 'Y�ld�z', 15566, '5555556677', 'TR15567890123456789012345', 'emre.yildiz@example.com', 'Bireysel', '1979-10-29', 8500, 3200, 2, 0);
INSERT INTO Adres (AdresAD, D�sKap�NO, IcKap�No, Tel, AnaAdresMi, IlID, IlceID, MahalleID, SokakID, MusteriID, DepoID) VALUES
('adres1', 1, NULL, '5551112233', 1, 1, 1, 1, 1, 7, NULL),
('adres2', 10, 5, '5552223344', 0, 1, 1, 1, 2, 1, 1),
('adres3', 5, NULL, '5553334455', 1, 2, 4, 7, 11, 3, 1),
('adres4', 25, 4, '5554445566', 1, 3, 6, 12, 14,4, NULL),
('adres5', 3, NULL, '5555556677', 1, 4, 8, 7, 5, 5, 2),
('adres6', 8, 10, '5556667788', 1, 5, 10, 11, 3, 6, NULL),
('adres7', 17, NULL, '5557778899', 1, 6, 12, 12, 7, 12, 3),
('adres8', 12, 3, '5558889900', 0, 7, 14, 13, 13, 8, NULL),
('adres9', 2, NULL, '5559990011', 1, 8, 15, 14, 1, 9, NULL),
('adres10', 30, 8, '5550001122', 1, 9, 7, 15, 15, 10, NULL),
('adres11', 7, NULL, '5551112233', 0, 10, 10, 12, 3, 11, 4),
('adres12', 14, 6, '5552223344', 1, 9, 5, 4, 4, 12, NULL),
('adres13', 20, NULL, '5553334455', 10, 12, 4, 5, 5, 13, NULL),
('adres14', 5, 9, '5554445566', 0, 7, 1, 2, 2, 14, NULL),
('adres15', 11, NULL, '5555556677', 1, 14, 7, 11, 12,15, NULL);
INSERT INTO Vardir (DepartmanID,SubeID) VALUES
	(1,2),
	(2,15),
	(4,6),
	(3,3),
	(5,8),
	(5,2),
	(1,12),
	(3,14),
	(2,15),
	(1,10);
INSERT INTO Urun ( UrunKategorisiID, Fiyat, UrunTipi, UrunAd, UrunKdvOran�)
VALUES (1, 1500.00, 'Televizyon', 'Samsung Smart TV', 18.00),
       (2, 250.00, 'T-Shirt', 'Nike Erkek Ti��rt', 8.00),
       (3, 450.00, 'Mutfak Robotu', 'Bosch Mutfak Robotu', 18.00),
       (4, 50.00, 'Roman', 'D�n���m - Franz Kafka', 8.00),
       (5, 100.00, 'Yoga Mat�', 'Reebok Yoga Mat�', 8.00),
       (1, 3000.00, 'Laptop', 'Dell XPS 15', 18.00),
       (2, 150.00, 'Kazak', 'Zara Kad�n Kazak', 8.00),
       (3, 200.00, 'Mikrodalga F�r�n', 'Samsung Mikrodalga F�r�n', 18.00),
       (4, 40.00, 'Bilim Kurgu', 'Dune - Frank Herbert', 8.00),
       (5, 80.00, 'Ko�u Ayakkab�s�', 'Adidas Ko�u Ayakkab�s�', 8.00),
       (1, 500.00, 'Ak�ll� Telefon', 'iPhone 12', 18.00),
       (2, 80.00, 'Kot Pantolon', 'Levis Erkek Kot Pantolon', 8.00),
       (3, 1000.00, 'Buzdolab�', 'Beko Buzdolab�', 18.00),
       (4, 20.00, 'Bilim', 'Sapiens - Yuval Noah Harari', 8.00),
       (5, 120.00, 'Y�zme G�zl���', 'Speedo Y�zme G�zl���', 8.00),
       (1, 2000.00, 'Oyun Konsolu', 'PlayStation 5', 18.00),
       (2, 60.00, 'Sweatshirt', 'H&M Kad�n Sweatshirt', 8.00),
       (3, 150.00, 'Elektrikli S�p�rge', 'Philips Elektrikli S�p�rge', 18.00),
       (4, 30.00, 'Psikoloji', 'Psikolojiye Giri� - Charles G.', 8.00),
       (5, 90.00, 'Yoga Blo�u', 'Liforme Yoga Blo�u', 8.00);
INSERT INTO Stoklan�r (StokMiktar�,DepoID,UrunID) VALUES
    (100,1,1),
    (50,5,2),
    (20,2,3),
    (250,3,4),
    (50,4,5),
	  (100,1,6),
    (50,5,7),
    (20,2,8),
    (250,3,9),
    (50,4,10),
	  (100,1,11),
    (50,5,12),
    (20,2,13),
    (250,3,14),
    (50,4,15),  
	  (100,1,16),
    (50,5,17),
    (20,2,18),
    (250,3,19),
    (50,4,20);
INSERT INTO BirimSeti (AnaBirimMi, UrunID) VALUES 
(1, 1),
(0,2),
(1,3),
(1, 4),
(0,5),
(1,6),
(1,7),
(0,8),
(1,9),
(0, 10),
(1, 11),
(0,12),
(1,13),
(1, 14),
(0,15),
(1,16),
(1,17),
(0,18),
(1,19),
(0, 20);
INSERT INTO tblTransfer(Miktar,Tarih,DepoID,BirimSetiID,UrunID) VALUES
    (54,'2023-06-2',1,2,1),
    (12,'2023-06-25',2,3,2),
	(53,'2022-05-2',3,4,3),
    (22,'2021-01-11',2,5,4),
	(59,'2020-04-9',4,18,5),
    (62,'2019-03-8',3,12,6),
	(75,'2022-06-7',5,15,7),
    (82,'2021-05-10',2,19,8);
INSERT INTO Barkod (BarkodNO,BirimSetiID)  VALUES 
('BARKOD1', 1),
('BARKOD2', 2),
('BARKOD3', 3),
('BARKOD4', 4),
('BARKOD5', 5),
('BARKOD6', 6),
('BARKOD7', 7),
('BARKOD8', 8),
('BARKOD9', 9),
('BARKOD10', 10);
INSERT INTO Siparis (AdresID, SiparisDurumuID, DepoID, SiparisFaturaTuruID, M��teriID, IlgilenenPersonel, SiparisNO, Tarih, Br�tToplam, NetToplam, Ind�r�mToplam)
VALUES
    (1, 1, 1, 1, 1, 1, 1001, '2023-05-01', 100.00, 90.00, 10.00),
    (2, 2, 2, 2, 2, 2, 1002, '2023-05-02', 200.00, 180.00, 20.00),
    (3, 3, 3, 3, 3, 3, 1003, '2023-05-03', 300.00, 270.00, 30.00),
    (4, 4, 4, 4, 4, 4, 1004, '2023-05-04', 400.00, 360.00, 40.00),
    (5, 5, 5, 5, 5, 5, 1005, '2023-05-05', 500.00, 450.00, 50.00),
    (6, 1, 2, 3, 6, 6, 1006, '2023-05-06', 600.00, 540.00, 60.00),
    (7, 2, 3, 4, 7, 7, 1007, '2023-05-07', 700.00, 630.00, 70.00),
    (8, 3, 4, 5, 8, 8, 1008, '2023-05-08', 800.00, 720.00, 80.00),
    (9, 4, 5, 1, 9, 9, 1009, '2023-05-09', 900.00, 810.00, 90.00),
    (10, 5, 1, 2, 10, 10, 1010, '2023-05-10', 1000.00, 900.00, 100.00),
    (11, 1, 2, 3, 11, 11, 1011, '2023-05-11', 1100.00, 990.00, 110.00),
    (12, 2, 3, 4, 12, 12, 1012, '2023-05-12', 1200.00, 1080.00, 120.00),
    (13, 3, 4, 5, 13, 13, 1013, '2023-05-13', 1300.00, 1170.00, 130.00),
    (14, 4, 5, 1, 14, 14, 1014, '2023-05-14', 1400.00, 1260.00, 140.00),
    (15, 5, 1, 2, 15, 15, 1015, '2023-05-15', 1500.00, 1350.00, 150.00);
	INSERT INTO Icerir (UrunID, SiparisID, Tarih, Miktar, Indirim, KDV, UrunFiyati, KDVToplami, NetFiyat)
VALUES
    (1, 1, '2023-05-01', 5, 0.00, 18.00, 10.00, 90.00, 50.00),
    (2, 2, '2023-05-02', 10, 5.00, 18.00, 20.00, 180.00, 190.00),
    (3, 3, '2023-05-03', 3, 2.50, 18.00, 30.00, 270.00, 80.00),
    (4, 4, '2023-05-04', 8, 0.00, 18.00, 40.00, 360.00, 320.00),
    (5, 5, '2023-05-05', 2, 1.00, 18.00, 50.00, 450.00, 90.00),
    (6, 6, '2023-05-06', 7, 4.00, 18.00, 60.00, 540.00, 400.00),
    (7, 7, '2023-05-07', 4, 0.00, 18.00, 70.00, 630.00, 280.00),
    (8, 8, '2023-05-08', 9, 3.50, 18.00, 80.00, 720.00, 630.00),
    (9, 9, '2023-05-09', 6, 0.00, 18.00, 90.00, 810.00, 540.00),
    (10, 10, '2023-05-10', 12, 6.00, 18.00, 100.00, 900.00, 1200.00);
	INSERT INTO Fatura (SiparisFaturaTuru, KargoID, IlgilenenPersonel, SiparisID, Tarih, D�zenlemeTarihi, Tutar, KargoKodu)
VALUES
(1, 1, 3, 11, '2023-08-20', '2023-08-21', 100.00, 'KargoKodu1'),
(2, 2, 15, 10, '2023-07-02', '2023-07-5', 10.000, 'KargoKodu2'),
(3, 2, 12, 8, '2023-09-10', '2023-09-12', 15.000, 'KargoKodu3'),
(4, 3, 5, 6, '2023-10-15', '2023-10-16', 500.000, 'KargoKodu4'),
(5, 4, 4, 7, '2023-11-05', '2023-05-05', 3.000, 'KargoKodu5'),
(2, 5, 9, 1, '2023-12-12', '2023-05-12', 15.000, 'KargoKodu6'),
(3, 3, 11, 3, '2023-08-25', '2023-05-26', 200.000, 'KargoKodu7');

INSERT INTO Tahsilat (TahsilatTuru, IlgilenenPersonel, TahsilatID, Tarih, BelgeNO, Tutar)
VALUES
    (1, 1, 1, '2023-05-01', '1234567890', 100.00),
    (2, 2, 2, '2023-05-02', '0987654321', 200.00),
    (3, 3, 3, '2023-05-03', '2468135790', 300.00),
    (4, 4, 4, '2023-05-04', '1357924680', 400.00),
    (5, 5, 5, '2023-05-05', '9876543210', 500.00),
    (1, 6, 6, '2023-05-06', '0123456789', 600.00),
    (2, 7, 7, '2023-05-07', '5678901234', 700.00),
    (3, 8, 8, '2023-05-08', '9876543210', 800.00),
    (4, 9, 9, '2023-05-09', '5432109876', 900.00),
    (5, 10, 10, '2023-05-10', '0123456789', 1000.00);



