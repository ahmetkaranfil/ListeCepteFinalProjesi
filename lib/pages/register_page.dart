import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _birthCountryController = TextEditingController();
  final _birthCityController = TextEditingController();
  DateTime? _birthDate;

  final supabase = Supabase.instance.client;

  Future<void> _signUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final birthCountry = _birthCountryController.text.trim();
    final birthCity = _birthCityController.text.trim();

    if (_birthDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Lütfen doğum tarihinizi seçin")),
      );
      return;
    }

    try {
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        await supabase.from('user_profiles').insert({
          'user_id': user.id,
          'birth_date': _birthDate!.toIso8601String(),
          'birth_country': birthCountry,
          'birth_city': birthCity,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kayıt başarılı!')),
        );
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Kayıt başarısız.')),

        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Hata: ${e.toString()}')),
      );
    }
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(now.year - 18),
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kayıt Ol")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: _emailController, decoration: const InputDecoration(labelText: 'E-Posta')),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Şifre'),
                obscureText: true,
              ),
              const SizedBox(height: 16),
              TextField(controller: _birthCountryController, decoration: const InputDecoration(labelText: 'Doğum Yeri (Ülke)')),
              TextField(controller: _birthCityController, decoration: const InputDecoration(labelText: 'Doğum Yeri (Şehir)')),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(_birthDate == null
                        ? 'Doğum tarihi seçilmedi'
                        : 'Seçilen tarih: ${_birthDate!.toLocal().toString().split(' ')[0]}'),
                  ),
                  TextButton(
                    onPressed: _pickBirthDate,
                    child: const Text('Tarih Seç'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _signUp, child: const Text('Kayıt Ol')),
            ],
          ),
        ),
      ),
    );
  }
}
