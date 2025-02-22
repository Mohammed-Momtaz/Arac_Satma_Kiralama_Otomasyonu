USE [AKSO]
GO
/****** Object:  StoredProcedure [dbo].[AracSil]    Script Date: 1/4/2025 4:32:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Araç silme prosedürü
ALTER PROCEDURE [dbo].[AracSil]
    @Arac_ID INT
AS
BEGIN TRANSACTION
	BEGIN TRY
	IF EXISTS (SELECT 1 FROM Arac WHERE Arac_ID = @Arac_ID)
	BEGIN
		DELETE FROM Sigorta WHERE Arac_ID = @Arac_ID;
		DELETE FROM Tamir_ve_Onarim WHERE Arac_ID = @Arac_ID;
		DELETE FROM Kiralama WHERE Arac_ID = @Arac_ID;
		DELETE FROM Satis WHERE Arac_ID = @Arac_ID;
		DELETE FROM Arac WHERE Arac_ID = @Arac_ID;
	END
	ELSE PRINT 'Arac Zaten Mevcut Değil'
		COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		PRINT 'HATA Olustu Araba Silinmedi'
	END CATCH