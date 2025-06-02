// lib/pages/login_info_page.dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_menu.dart';

class LoginInfoPage extends StatefulWidget {
  const LoginInfoPage({super.key});

  @override
  State<LoginInfoPage> createState() => _LoginInfoPageState();
}

class _LoginInfoPageState extends State<LoginInfoPage> {
  List<String> _loginInfos = [];

  @override
  void initState() {
    super.initState();
    _loadLoginInfos();
  }

  Future<void> _loadLoginInfos() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _loginInfos = prefs.getStringList('login_infos') ?? [];
    });
  }

  Future<void> _clearLoginInfos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('login_infos');
    _loadLoginInfos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Giriş Bilgileri"),
      drawer: const DrawerMenu(),
      body: _loginInfos.isEmpty
          ? const Center(child: Text("Henüz giriş yapılmamış."))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _loginInfos.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: const Icon(Icons.person),
                      title: Text(_loginInfos[index]),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: _clearLoginInfos,
                  icon: const Icon(Icons.delete),
                  label: const Text("Tüm Girişleri Temizle"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
    );
  }
}
