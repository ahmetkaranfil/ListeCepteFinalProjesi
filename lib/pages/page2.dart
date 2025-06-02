import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_menu.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<List<String>> allLists = [];

  @override
  void initState() {
    super.initState();
    _loadLists();
  }

  Future<void> _loadLists() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('saved_lists') ?? [];
    setState(() {
      allLists = saved.map((e) => List<String>.from(json.decode(e))).toList();
    });
  }

  Future<void> _deleteList(int index) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> saved = prefs.getStringList('saved_lists') ?? [];
    saved.removeAt(index);
    await prefs.setStringList('saved_lists', saved);
    _loadLists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Kayıtlı Alışveriş Listeleri"),
      drawer: const DrawerMenu(),
      body: allLists.isEmpty
          ? const Center(child: Text("Henüz kayıtlı bir listeniz yok."))
          : ListView.builder(
        itemCount: allLists.length,
        itemBuilder: (context, index) {
          final list = allLists[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ExpansionTile(
              title: Text('Liste ${index + 1}'),
              children: [
                ...list.map((item) => ListTile(title: Text(item))),
                TextButton.icon(
                  onPressed: () => _deleteList(index),
                  icon: const Icon(Icons.delete),
                  label: const Text("Bu listeyi sil"),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
