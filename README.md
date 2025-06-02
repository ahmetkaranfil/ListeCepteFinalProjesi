# ListeCepte 📋

ListeCepte, kullanıcıların alışveriş listelerini hızlıca oluşturabileceği, kaydedebileceği ve yönetebileceği çok platformlu (Android/Web/Windows) bir Flutter uygulamasıdır. Kullanıcı dostu arayüzü, gerçek zamanlı veri işlemleri ve kullanıcı oturumu yönetimiyle modern bir deneyim sunar.

---

## 🧠 Projenin Amacı

Bu projenin temel amacı; kullanıcıların gündelik alışverişlerini planlamalarına yardımcı olacak bir sistem geliştirerek hem yerel hem de uzak (Supabase) veri saklama çözümleri sunmaktır. Uygulama; kullanıcı kaydı, giriş, profil yönetimi ve liste oluşturma gibi özellikleri tek bir uygulamada birleştirir.

---

## 🛠 Teknik Detaylar

- **Flutter**: Uygulamanın temel geliştirme platformu
- **Supabase**: Oturum yönetimi ve uzak veritabanı işlemleri için kullanıldı
- **SQLite & SharedPreferences**: Lokal veri saklama için hibrit çözüm
- **Multi-Platform**: Android, Web ve Windows destekli

---

## ⭐️ Öne Çıkan Özellikler

- ✅ Supabase Authentication ile kullanıcı kaydı ve giriş
- ✅ Doğum yeri, tarihi ve şehir bilgisiyle profil kaydı
- ✅ Liste oluşturma, silme ve kaydetme işlemleri (SharedPreferences üzerinden)
- ✅ Kaydedilen listeleri görüntüleme
- ✅ Responsive ve sade arayüz
- ✅ Yardım/İletişim sayfası
- ✅ Drawer menü ile kolay erişim

---

## 🧱 Kullanılan Teknolojiler

| Teknoloji             | Açıklama                                 |
|----------------------|------------------------------------------|
| Flutter              | UI geliştirme platformu                  |
| Supabase             | Backend, Auth, DB                        |
| SharedPreferences    | Lokal liste saklama                      |
| SQLite               | Alternatif lokal veri çözümü             |
| Material 3 Theme     | Modern görünüm ve widget yapısı          |

---

## 📂 Sayfa Listesi ve İşlevleri

### 1. Giriş Sayfası (`login_page.dart`)
- E-posta ve şifre ile Supabase üzerinden oturum açılır
- Başarılı giriş sonrası `/home` yönlendirmesi yapılır

### 2. Kayıt Sayfası (`register_page.dart`)
- E-posta/şifre ile kayıt
- Doğum tarihi, doğum yeri, yaşanılan il bilgileri girilir
- Supabase üzerinden hem auth hem profil tablosuna veri eklenir

### 3. Anasayfa (`home_page.dart`)
- Sayfa 1, 2 ve 3’e geçiş için kartlar içerir
- Uygulamanın merkezi kontrol ekranı

### 4. Sayfa 1 - Liste Oluşturma (`page1.dart`)
- Kullanıcı metin kutusuna ürün ekler
- Listeyi kaydeder (SharedPreferences)
- Uyarı mesajları ve snack bar destekli

### 5. Sayfa 2 - Kaydedilen Listeler (`page2.dart`)
- Tüm oluşturulan listeleri gösterir
- Listeleri silme özelliği mevcuttur

### 6. Sayfa 3 - Yardım Sayfası (`page3.dart`)
- Uygulamanın nasıl kullanılacağı hakkında bilgiler içerir
- Basit yardım dökümanı arayüzü

### 7. Profil Sayfası (`profile_page.dart`)
- Supabase'den gelen doğum tarihi, doğum yeri ve şehir bilgisi gösterilir
- Kullanıcı e-postası görüntülenir

---

## 🧑‍💻 Geliştirici Ekibi

| Geliştirici       | Katkısı                                    |
|-------------------|--------------------------------------------|
| Ahmet Karanfil    | UI/UX, Sayfa Geçişleri, Supabase kurulumu  |
| Ömer Faruk Gürgen | Auth işlemleri, Profil Sistemi, Page1 ve 2 |

---

## 🚀 Kurulum ve Başlatma

```bash
git clone https://github.com/ahmetkaranfil/listeceptev2.git
cd listecepte
flutter pub get
flutter run

Geliştirme Ortamı

Flutter SDK 3.7+
Android Studio / VS Code
Emulator: Android 13+ veya Chrome/Web
