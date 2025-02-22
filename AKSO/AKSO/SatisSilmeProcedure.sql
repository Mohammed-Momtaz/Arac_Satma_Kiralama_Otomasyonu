USE [AKSO]
GO
/****** Object:  StoredProcedure [dbo].[SatisSil]    Script Date: 1/4/2025 3:35:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Satis silme prosedürü
ALTER PROCEDURE [dbo].[SatisSil]
    @Satis_ID INT
AS
BEGIN TRANSACTION;
BEGIN TRY
    DECLARE @Arac_ID INT;
    SELECT @Arac_ID = Arac_ID FROM Satis WHERE Satis_ID = @Satis_ID;

    DELETE FROM Satis WHERE Satis_ID = @Satis_ID;

    UPDATE Arac
    SET Arac_Durumu = 'Uygun'
    WHERE Arac_ID = @Arac_ID;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Hata oluştu, Satış silme işlemi geri alındı.';
END CATCH;