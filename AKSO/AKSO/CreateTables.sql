CREATE DATABASE AKSO
USE AKSO

-- Sube tablosu 

CREATE TABLE Sube ( 

    Sube_ID INT PRIMARY KEY, 

    Sube_Adi VARCHAR(50), 

    Sube_Adres VARCHAR(255), 

    Sube_Tel VARCHAR(15) 

)

-- Araç tablosu 

CREATE TABLE Arac ( 

    Arac_ID INT PRIMARY KEY, 

    Arac_Sigortasi VARCHAR(50), 

    Arac_Durumu VARCHAR(50), 

    Arac_Vites_Turu VARCHAR(50), 

    Arac_Yakit_Turu VARCHAR(50), 

    Arac_Modeli VARCHAR(50), 

    Arac_Yili INT, 

    Arac_Plaka_No VARCHAR(20), 

    Sube_ID INT, 

    FOREIGN KEY (Sube_ID) REFERENCES Sube(Sube_ID)

)


-- Sigorta tablosu 

CREATE TABLE Sigorta ( 

    Sigorta_ID INT PRIMARY KEY, 

    Sigorta_Adi VARCHAR(50), 

    Bilgi_Tarihi DATE, 

    Arac_ID INT, 

    FOREIGN KEY (Arac_ID) REFERENCES Arac(Arac_ID) 

)

 

-- Tamir_ve_Onarim tablosu 

CREATE TABLE Tamir_ve_Onarim ( 

    Tamir_ID INT PRIMARY KEY, 

    Arac_ID INT, 

    Tamir_Tarihi DATE, 

    Aciklama VARCHAR(255), 

    Onarim_Maliyeti DECIMAL(10, 2), 

    FOREIGN KEY (Arac_ID) REFERENCES Arac(Arac_ID) 

); 

 

-- De?i?en_Parça tablosu (N-M ili?kisi) 

CREATE TABLE Degisen_Parca ( 

    Parca_ID INT PRIMARY KEY,

    Parca_Adi VARCHAR(50), 

    Parca_Maliyeti DECIMAL(10, 2), 

    Tamir_ID INT, 

    FOREIGN KEY (Tamir_ID) REFERENCES Tamir_ve_Onarim(Tamir_ID) 

)

-- Yetkiler tablosu 

CREATE TABLE Yetkiler ( 

    Yetki_ID INT PRIMARY KEY, 

    Yetki_Adi VARCHAR(50) 

)

-- Personel tablosu 

CREATE TABLE Personel ( 

    Personel_ID INT PRIMARY KEY, 

    Sube_ID INT, 

    Personel_Adi VARCHAR(50), 

    Personel_Soyadi VARCHAR(50), 

    Personel_Tel_No VARCHAR(15), 

    Personel_Gorevi VARCHAR(50),

	Yetki_ID INT

    FOREIGN KEY (Sube_ID) REFERENCES Sube(Sube_ID),

	FOREIGN KEY (Yetki_ID) REFERENCES Yetkiler(Yetki_ID)

)

-- Mü?teri tablosu 

CREATE TABLE Musteri ( 

    Musteri_ID INT PRIMARY KEY, 

    Musteri_Adi VARCHAR(50), 

    Musteri_Soyadi VARCHAR(50), 

    Musteri_TC_No VARCHAR(11), 

    Musteri_Tel_No VARCHAR(15), 

    Musteri_Ehliyet_No VARCHAR(20), 

    Musteri_Mail VARCHAR(50), 

    Musteri_Adresi VARCHAR(255) 

)

-- Sat?? tablosu 

CREATE TABLE Satis ( 

    Satis_ID INT PRIMARY KEY, 

    Arac_ID INT, 

    Musteri_ID INT, 

    Satis_Tarihi DATE, 

    Satis_Fiyati DECIMAL(10, 2), 

    FOREIGN KEY (Arac_ID) REFERENCES Arac(Arac_ID), 

    FOREIGN KEY (Musteri_ID) REFERENCES Musteri(Musteri_ID) 

)

-- Kiralama tablosu 

CREATE TABLE Kiralama ( 

    Kiralama_ID INT PRIMARY KEY, 

    Arac_ID INT, 

    Musteri_ID INT, 

    Kiralama_Tarihi DATE, 

    Iade_Tarihi DATE, 

    Kiralama_Ucreti DECIMAL(10, 2), 

    FOREIGN KEY (Arac_ID) REFERENCES Arac(Arac_ID), 

    FOREIGN KEY (Musteri_ID) REFERENCES Musteri(Musteri_ID) 

)

 

-- Fatura tablosu 

CREATE TABLE Fatura ( 

    Fatura_ID INT PRIMARY KEY, 

    Musteri_ID INT, 

    Islem_Tarihi DATE, 

    Tutar_Miktari DECIMAL(10, 2), 

    FOREIGN KEY (Musteri_ID) REFERENCES Musteri(Musteri_ID) 

)

