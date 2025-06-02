import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_menu.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yardım ve Destek"),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: const [
            Text(
              "📌 Uygulama Kullanım Rehberi",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text("📝 Liste Oluşturma:\n\nSayfa 1 üzerinden alışveriş listenizi oluşturabilir ve 'Listeyi Kaydet' butonuyla kaydedebilirsiniz."),
            SizedBox(height: 16),
            Text("📂 Liste Görüntüleme:\n\nSayfa 2 üzerinde daha önce kaydettiğiniz listeleri görebilir ve dilerseniz silebilirsiniz."),
            SizedBox(height: 16),
            Text("👤 Profil Bilgisi:\n\nProfil sayfanızda kayıt olurken girdiğiniz doğum tarihi, yeri ve yaşadığınız ili görüntüleyebilirsiniz."),
            SizedBox(height: 16),
            Text("🔐 Giriş / Kayıt:\n\nUygulamaya giriş yapabilir ya da yeni bir kullanıcı olarak kayıt olabilirsiniz."),
            SizedBox(height: 16),
            Text("❓ Destek:\n\nHerhangi bir sorunla karşılaşırsanız destek almak için proje sorumlusuna başvurabilirsiniz."),
          ],
        ),
      ),
    );
  }
}
