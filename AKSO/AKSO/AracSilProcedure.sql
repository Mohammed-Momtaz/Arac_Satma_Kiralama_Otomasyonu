-- Araç silme prosedürü
CREATE PROCEDURE AracSil
    @Arac_ID INT
AS
BEGIN
    DELETE FROM Arac WHERE Arac_ID = @Arac_ID;
END;