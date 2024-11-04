# Araç Kiralama ve Satış Otomasyonu

Bu proje, üniversite dersimiz kapsamında geliştirilmekte olan bir **Araç Kiralama ve Satış Otomasyonu** veri tabanı sistemidir. Proje, araçların kiralanması ve satılması, müşteri ve şube bilgilerinin yönetilmesi gibi işlemleri verimli bir şekilde organize etmeyi amaçlamaktadır. **Yapım aşamasında** olan bu projede, ek özellikler ve geliştirmeler yapılmaya devam edilmektedir.

## Proje İçeriği

Bu proje, SQL Server kullanılarak oluşturulmuş bir veritabanı yapısı içerir. **Entity-Relationship (ER)** diyagramında belirtilen ilişkiler ve tablolar, araç kiralama ve satış süreçlerini düzenlemeye yöneliktir. Tablolar arasındaki ilişkiler Chen Notasyonu kullanılarak tanımlanmıştır.

### Tablolar ve Açıklamaları

- **Arac**: Araçların marka, model, yıl ve mevcut durum bilgilerini içerir.
- **Musteri**: Müşterilerin kimlik, iletişim ve adres bilgilerini içerir.
- **Sube**: Araçların ve personelin bulunduğu şubelerin bilgilerini içerir.
- **Kiralama**: Araç kiralama işlemlerine dair tarih ve ücret bilgilerini içerir.
- **Satis**: Araç satış işlemlerine dair fiyat ve tarih bilgilerini içerir.
- **Sigorta**: Araçların sigorta kayıtlarını ve bitiş tarihlerini içerir.
- **Fatura**: Satış ve kiralama işlemlerine dair fatura bilgilerini içerir.
- **Tamir_Ve_Onarım**: Araçların onarım kayıtlarını ve maliyetlerini içerir.
- **Degisen_Parca**: Onarım sırasında değişen parçaların bilgilerini içerir.
- **Personel**: Şube çalışanlarının görev ve iletişim bilgilerini içerir.
- **Kullanici (Users)**: Sisteme giriş yapacak kullanıcıların bilgilerini içerir.
- **Yetkiler (Permissions)**: Kullanıcıların sistemdeki yetki seviyelerini içerir (örn. Müdür, Muhasebeci).

### İlişkiler

- **Araç - Kiralama**: Bir araç birden fazla kez kiralanabilir.
- **Araç - Satış**: Her araç en fazla bir kez satılabilir.
- **Araç - Sigorta**: Her araç birden fazla sigorta kaydına sahip olabilir.
- **Kiralama - Fatura**: Her kiralama işlemine karşılık bir fatura oluşturulabilir.
- **Müşteri - Fatura**: Bir müşteri birden fazla fatura kaydına sahip olabilir.
- Diğer ilişkiler ve ER diyagramı için proje dosyalarına göz atabilirsiniz.

## Kurulum

Bu projeyi yerel ortamınızda çalıştırmak için aşağıdaki adımları takip edebilirsiniz:

1. **SQL Server** kurulumu yapın veya mevcut bir SQL Server kullanın.
2. **Database Script** dosyasını SQL Server Management Studio (SSMS) kullanarak çalıştırın.
3. **Veritabanını Test Edin**: Script çalıştırıldıktan sonra tabloları ve ilişkileri kontrol edin.

## Proje Durumu

Bu proje halen **yapım aşamasındadır** ve geliştirilmeye devam edilmektedir. Eklemeler ve güncellemeler, projenin tamamlanmasına kadar düzenli olarak yapılacaktır.

## İşbirliği ve Geliştirme

Bu proje, aşağıdaki ekip üyeleri tarafından geliştirilmektedir:

- **Muhammed Mümtaz Şaram**  
  - Öğrenci No: 210260611  
  - GitHub: [Mohammed-Momtaz](https://github.com/Mohammed-Momtaz)

- **Muhammed Zamut**  
  - Öğrenci No: 210260617  
  - GitHub: [Mohammed-Zamut](https://github.com/Mohammed-Zamut)

- **Abdulrahman Sado**  
  - Öğrenci No: 210260603  
  - GitHub: [Abdulrahmansado](https://github.com/Abdulrahmansado)

Ekip üyeleri projeyi GitHub üzerinden işbirliği içinde geliştirmekte olup, `pull request` ve `commit` mesajlarıyla açıklamalar yapmaktadır.

## Lisans

Bu proje, **Eğitim Amaçlı** geliştirilmiştir ve kopyalanması, paylaşılması yalnızca eğitim amacıyla sınırlıdır.
