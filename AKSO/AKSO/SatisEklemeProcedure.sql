USE [AKSO]
GO
/****** Object:  StoredProcedure [dbo].[SatisEkle]    Script Date: 1/4/2025 4:20:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Satış ekleme prosedürü
ALTER PROCEDURE [dbo].[SatisEkle]
    @Satis_ID INT,
    @Arac_ID INT,
    @Musteri_ID INT,
    @Satis_Tarihi DATE,
    @Satis_Fiyati DECIMAL(10, 2)
AS
BEGIN TRANSACTION;
	BEGIN TRY
	IF EXISTS (SELECT 1 FROM Arac WHERE Arac_ID = @Arac_ID AND Arac_Durumu = 'Uygun')
	BEGIN
        INSERT INTO Satis (Satis_ID, Arac_ID, Musteri_ID, Satis_Tarihi, Satis_Fiyati)
        VALUES (@Satis_ID, @Arac_ID, @Musteri_ID, @Satis_Tarihi, @Satis_Fiyati);

        UPDATE Arac
        SET Arac_Durumu = 'Satıldı'
        WHERE Arac_ID = @Arac_ID;
	END
	ELSE PRINT 'Araç uygun değil. Satma işlemi gerçekleştirilemedi.';
		COMMIT TRANSACTION;
    END	TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'HATA. Satma işlemi gerçekleştirilemedi.';
END CATCH;