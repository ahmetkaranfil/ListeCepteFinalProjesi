import 'pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/list_page.dart';
import 'pages/saved_list_page.dart';
import 'pages/login_info_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'pages/page1.dart';
import 'pages/page2.dart';
import 'pages/page3.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://otmjdhttoijhaacdwnjc.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im90bWpkaHR0b2lqaGFhY2R3bmpjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDg4ODMzMzQsImV4cCI6MjA2NDQ1OTMzNH0.3FvJTQQ1moRAZ2XDvyJ82QmIpQ72FIUKnV7qfjVkLOM',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListeCepte',
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/': (context) => const LoginPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
        '/list': (context) => const ListPage(),
        '/saved': (context) => const SavedListsPage(),
        '/loginInfo': (context) => const LoginInfoPage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/page1': (context) => const Page1(),
        '/page2': (context) => const Page2(),
        '/page3': (context) => const Page3(),
      },
    );
  }
}
