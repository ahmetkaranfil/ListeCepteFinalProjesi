import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'drawer_menu.dart';

class BasePage extends StatelessWidget {
  final String title;
  final String content;

  const BasePage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title),
      drawer: const DrawerMenu(),
      body: Center(child: Text(content)),
    );
  }
}