-- Araç güncelleme prosedürü
CREATE PROCEDURE AracGuncelle
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
BEGIN
    UPDATE Arac
    SET Arac_Sigortasi = @Arac_Sigortasi,
        Arac_Durumu = @Arac_Durumu,
        Arac_Vites_Turu = @Arac_Vites_Turu,
        Arac_Yakit_Turu = @Arac_Yakit_Turu,
        Arac_Modeli = @Arac_Modeli,
        Arac_Yili = @Arac_Yili,
        Arac_Plaka_No = @Arac_Plaka_No,
        Sube_ID = @Sube_ID
    WHERE Arac_ID = @Arac_ID;
END;