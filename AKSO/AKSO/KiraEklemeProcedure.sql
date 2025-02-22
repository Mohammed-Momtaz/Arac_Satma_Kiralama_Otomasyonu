USE [AKSO]
GO
/****** Object:  StoredProcedure [dbo].[KiralamaEkle]    Script Date: 1/4/2025 4:20:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[KiralamaEkle]
    @Kiralama_ID INT,
    @Arac_ID INT,
    @Musteri_ID INT,
    @Kiralama_Tarihi DATE,
    @Iade_Tarihi DATE,
    @Kiralama_Ucreti DECIMAL(10, 2)
AS
BEGIN TRANSACTION;
	BEGIN TRY
	IF EXISTS (SELECT 1 FROM Arac WHERE Arac_ID = @Arac_ID AND Arac_Durumu = 'Uygun')
	BEGIN
        INSERT INTO Kiralama (Kiralama_ID, Arac_ID, Musteri_ID, Kiralama_Tarihi, Iade_Tarihi, Kiralama_Ucreti)
        VALUES (@Kiralama_ID, @Arac_ID, @Musteri_ID, @Kiralama_Tarihi, @Iade_Tarihi, @Kiralama_Ucreti);

        UPDATE Arac
        SET Arac_Durumu = 'Kiralık'
        WHERE Arac_ID = @Arac_ID;
	END
	ELSE PRINT 'Araç uygun değil. Kiralama işlemi gerçekleştirilemedi.';
		COMMIT TRANSACTION;
    END	TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'HATA. Kiralama işlemi gerçekleştirilemedi.';
END CATCH;