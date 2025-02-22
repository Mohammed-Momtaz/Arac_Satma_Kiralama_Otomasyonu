USE [AKSO]
GO
/****** Object:  StoredProcedure [dbo].[AracEkle]    Script Date: 1/4/2025 4:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[AracEkle]
    @Arac_ID INT,
    @Arac_Sigortasi VARCHAR(50),
    @Arac_Durumu VARCHAR(50),
    @Arac_Vites_Turu VARCHAR(50),
    @Arac_Yakit_Turu VARCHAR(50),
    @Arac_Modeli VARCHAR(50),
    @Arac_Yili INT,
    @Arac_Plaka_No VARCHAR(20),
    @Sube_ID INT
AS
BEGIN TRANSACTION
BEGIN TRY
    INSERT INTO Arac (Arac_ID, Arac_Sigortasi, Arac_Durumu, Arac_Vites_Turu, Arac_Yakit_Turu, Arac_Modeli, Arac_Yili, Arac_Plaka_No, Sube_ID)
    VALUES (@Arac_ID, @Arac_Sigortasi, @Arac_Durumu, @Arac_Vites_Turu, @Arac_Yakit_Turu, @Arac_Modeli, @Arac_Yili, @Arac_Plaka_No, @Sube_ID);
	COMMIT TRANSACTION
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
	PRINT 'HATA Olustu Araba Zaten Mevcut'
END CATCH