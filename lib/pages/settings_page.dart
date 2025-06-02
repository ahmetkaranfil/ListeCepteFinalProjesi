// lib/pages/settings_page.dart
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Ayarlar"),
      drawer: DrawerMenu(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Uygulama Ayarları",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text("- Tema: Açık/Koyu Mod (Geliştirilebilir)"),
            Text("- Bildirimler: Açık/Kapalı (Geliştirilebilir)"),
            Text("- Versiyon: 1.0.0"),
            Text("- Geliştirici: Ahmet Yılmaz"),
          ],
        ),
      ),
    );
  }
}
