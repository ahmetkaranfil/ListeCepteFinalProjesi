import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final supabase = Supabase.instance.client;
  Map<String, dynamic>? profileData;

  Future<void> _loadProfile() async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        debugPrint('Kullanıcı oturumu yok');
        return;
      }

      final response = await supabase
          .from('user_profiles')
          .select()
          .eq('user_id', user.id)
          .maybeSingle();

      setState(() {
        profileData = response;
      });

      if (response == null) {
        debugPrint('Kullanıcı profili bulunamadı');
      }
    } catch (e) {
      debugPrint('Profil yüklenemedi: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Hata: ${e.toString()}")),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: profileData == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Profil Bilgileriniz", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Text("E-Posta: ${Supabase.instance.client.auth.currentUser?.email ?? '-'}"),
            Text("Doğum Tarihi: ${profileData!['birth_date'] ?? '-'}"),
            Text("Doğduğu Ülke: ${profileData!['birth_country'] ?? '-'}"),
            Text("Yaşadığı Şehir: ${profileData!['birth_city'] ?? '-'}"),
          ],
        ),
      ),
    );
  }
}
