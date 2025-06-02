// lib/pages/saved_list_page.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_menu.dart';

class SavedListsPage extends StatefulWidget {
  const SavedListsPage({super.key});

  @override
  State<SavedListsPage> createState() => _SavedListsPageState();
}

class _SavedListsPageState extends State<SavedListsPage> {
  List<List<String>> _allLists = [];

  @override
  void initState() {
    super.initState();
    _loadLists();
  }

  Future<void> _loadLists() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('saved_lists') ?? [];
    setState(() {
      _allLists = saved.map((e) => List<String>.from(json.decode(e))).toList();
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
      appBar: const CustomAppBar(title: "Kayıtlı Listeler"),
      drawer: const DrawerMenu(),
      body: _allLists.isEmpty
          ? const Center(child: Text("Henüz kayıtlı bir listeniz yok."))
          : ListView.builder(
              itemCount: _allLists.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ExpansionTile(
                    title: Text('Liste ${index + 1}'),
                    children: [
                      ..._allLists[index].map((item) => ListTile(title: Text(item))),
                      TextButton.icon(
                        icon: const Icon(Icons.delete),
                        label: const Text("Sil"),
                        onPressed: () => _deleteList(index),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
