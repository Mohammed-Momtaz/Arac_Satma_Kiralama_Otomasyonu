USE [AKSO]
GO
/****** Object:  Trigger [dbo].[AracDegisiklikleri]    Script Date: 1/4/2025 4:57:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Araç değişikliklerini izleyen tetikleyici
ALTER TRIGGER [dbo].[AracDegisiklikleri]
ON [dbo].[Arac]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
        PRINT 'Araç bilgileri eklendi veya güncellendi.';
		SELECT * FROM Arac
END;