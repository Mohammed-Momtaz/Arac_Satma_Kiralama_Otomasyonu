USE [AKSO]
GO
/****** Object:  StoredProcedure [dbo].[KiralamaSil]    Script Date: 1/4/2025 3:36:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Kiralama silme prosedürü
ALTER PROCEDURE [dbo].[KiralamaSil]
    @Kiralama_ID INT
AS
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @Arac_ID INT;
    SELECT @Arac_ID = Arac_ID FROM Kiralama WHERE Kiralama_ID = @Kiralama_ID;

    DELETE FROM Kiralama WHERE Kiralama_ID = @Kiralama_ID;

    UPDATE Arac
    SET Arac_Durumu = 'Uygun'
    WHERE Arac_ID = @Arac_ID;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluştu, kiralama silme işlemi geri alındı.';
END CATCH;