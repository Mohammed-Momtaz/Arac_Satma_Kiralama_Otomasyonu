# Araç Kiralama ve Satış Otomasyonu

Bu proje, bir araç kiralama ve satış şirketi için merkezi bir veritabanı sistemi kurarak bu süreçleri daha hızlı, verimli ve hatasız bir hale getirmeyi amaçlar. Bu kapsamda, müşterilerin araç kiralayabilmesi veya satın alabilmesi, şirket personelinin bakım, onarım ve sigorta işlemlerini takip edebilmesi ve araçların farklı şubelerdeki dağılımının yönetilebilmesi hedeflenmektedir.

## Proje Durumu

Bu proje halen **yapım aşamasında** olup, ek geliştirme ve iyileştirmeler yapılmaktadır.

## Geliştiriciler

Bu proje, aşağıdaki ekip üyeleri tarafından geliştirilmiştir:

- **Muhammed Mümtaz Şaram**  
  - Öğrenci No: 210260611  
  - GitHub: [Mohammed-Momtaz](https://github.com/Mohammed-Momtaz)
  
- **Abdulrahman Sado**  
  - Öğrenci No: 210260603  
  - GitHub: [Abdulrahmansado](https://github.com/Abdulrahmansado)

- **Muhammed Zamut**  
  - Öğrenci No: 210260617  
  - GitHub: [Mohammed-Zamut](https://github.com/Mohammed-Zamut)

## Proje Amacı ve Kapsamı

**Proje Amacı**:  
Bu proje, bir araç kiralama ve satış şirketinin operasyonlarını yönetmek için merkezi bir veri tabanı oluşturarak işlemleri daha düzenli hale getirmeyi amaçlar. Sistem; müşteri kayıtları, kiralama ve satış süreçleri, araç bakım ve onarım işlemleri, sigorta yönetimi ve şube içi araç dağılımını organize eder. Böylece, araçların durumları ve müşteri işlemleri daha etkin bir şekilde izlenebilir.

**Proje Kapsamı**:  
Proje; şube, personel, müşteri, araç, kiralama, satış, bakım ve sigorta gibi bilgileri içeren bir veri tabanı sistemini kapsar. Sistem, bu bileşenleri ilişkilendirerek araç kiralama, satış, tamir, sigorta ve faturalama gibi işlemleri sorunsuz ve hızlı bir şekilde gerçekleştirmeyi sağlar.

## Tablolar ve İlişkiler

| **Varlık**       | **Açıklama**                                      | **Alanlar ve Özellikler**                                                                                                                                                       |
|------------------|---------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Araç**         | Şirketin kiralanabilir veya satılabilir araçlarını içerir. | **Araç_ID (PK)**, **Şube_ID (FK)**, Araç_Plaka_No, Araç_Markası, Araç_Modeli, Araç_Yılı, Araç_Yakıt_Türü, Araç_Vites_Türü, Araç_Sigortası, Araç_Durumu                           |
| **Müşteri**      | Araç kiralayan veya satın alan müşteri bilgilerini içerir.  | **Müşteri_ID (PK)**, Müşteri_Adı, Müşteri_Soyadı, Müşteri_TC_No, Müşteri_Ehliyet_No, Müşteri_Tel_No, Müşteri_Mail, Müşteri_Adres                                                |
| **Şube**         | Araçların bulunduğu şube bilgilerini içerir.       | **Şube_ID (PK)**, Şube_Adı, Şube_Adres, Şube_Tel                                                                                                                                |
| **Kiralama**     | Araç kiralama işlemlerinin detaylarını içerir.     | **Kiralama_ID (PK)**, Araç_ID (FK), Müşteri_ID (FK), Kiralama_Tarihi, İade_Tarihi, Kiralama_Ücreti                                                                              |
| **Satış**        | Araç satış işlemlerinin detaylarını içerir.        | **Satış_ID (PK)**, Araç_ID (FK), Müşteri_ID (FK), Satış_Fiyatı, Satış_Tarihi                                                                                                    |
| **Sigorta**      | Araçların sigorta bilgilerini içerir.              | **Sigorta_ID (PK)**, Araç_ID (FK), Sigorta_Adı, Bitiş_Tarihi                                                                                                                    |
| **Fatura**       | Satış ve kiralama işlemlerine dair fatura bilgilerini içerir. | **Fatura_ID (PK)**, Müşteri_ID (FK), İşlem_Tarihi, Tutar_Miktarı                                                                                                                |
| **Tamir ve Onarım** | Araç tamir ve bakım işlemlerinin detaylarını içerir. | **Tamir_ID (PK)**, Araç_ID (FK), Tamir_Tarihi, Açıklama, Onarım_Maliyeti                                                                                                        |
| **Değişen Parça** | Araç tamirlerinde değişen parçaların bilgilerini içerir. | **Parça_ID (PK)**, Tamir_ID (FK), Parça_Adı, Parça_Maliyeti                                                                                                                     |
| **Personel**     | Şubede çalışan personel bilgilerini Ve Sisteme giriş yapacak kullanıcı bilgilerini içerir.        | **Personel_ID (PK)**, Şube_ID (FK), Yetki_ID (FK) Personel_Adı, Personel_Soyadı, Personel_Tel_No, Personel_Görevi ||
| **Yetkiler**     | Kullanıcıların sistemdeki yetki seviyelerini belirtir. | **Yetki_ID (PK)**, Yetki_Adı                                                                                                                                               |

## İlişkiler

| **İlişki**               | **Açıklama**                                                                                       |
|--------------------------|----------------------------------------------------------------------------------------------------|
| **Araç - Şube**          | Her araç bir şubeye aittir (1-N).                                                                  |
| **Araç - Kiralama**      | Bir araç birden fazla kez kiralanabilir (1-N).                                                     |
| **Araç - Satış**         | Her araç en fazla bir kez satılabilir (1-1).                                                       |
| **Araç - Sigorta**       | Bir araç birden fazla sigorta kaydına sahip olabilir (1-N).                                        |
| **Araç - Tamir ve Onarım** | Bir araç birden fazla tamir kaydına sahip olabilir (1-N).                                         |
| **Kiralama - Müşteri**   | Bir müşteri birden fazla araç kiralayabilir (1-N).                                                 |
| **Kiralama - Fatura**    | Her kiralama işlemine karşılık bir fatura oluşturulabilir (1-1).                                   |
| **Satış - Müşteri**      | Bir müşteri birden fazla araç satın alabilir (1-N).                                                |
| **Satış - Fatura**       | Her satış işlemine karşılık bir fatura oluşturulabilir (1-1).                                      |
| **Müşteri - Fatura**     | Bir müşteri birden fazla fatura kaydına sahip olabilir (1-N).                                      |
| **Tamir ve Onarım - Değişen Parça** | Her tamir kaydında birden fazla parça değişebilir (1-N).                                  |
| **Şube - Personel**      | Her şubeye birden fazla personel bağlıdır (1-N).                                                   |
| **Personel - Yetkiler** | Her Personel, bir yetki seviyesine sahip olabilir (N-1).                                         |

## Kurulum

Bu projeyi yerel ortamınıza kurmak için aşağıdaki adımları izleyin:

1. SQL Server veya SSMS yükleyin.
2. Proje dosyasında yer alan veritabanı scriptini çalıştırarak tabloları oluşturun.
3. Tablolar ve ilişkileri doğrulamak için test işlemlerini gerçekleştirin.

## ER Diyagramı

Proje kapsamında tasarlanan ER diyagramı, aşağıdaki iki bağlantıya göre düzenlenmiştir:

![E-R Diyagramı](E-R%20Diyagrami.png)

![E-R UML Diyagramı](AKSO%20E-R_UML%20Diagrami.jpg)

## Lisans

Bu proje, **Eğitim Amaçlı** olarak geliştirilmiştir ve yalnızca eğitim için kopyalanıp paylaşılabilir.

