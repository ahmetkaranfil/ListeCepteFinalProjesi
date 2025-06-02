// lib/pages/list_page.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/drawer_menu.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<String> _items = [];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  Future<void> _saveList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedLists = prefs.getStringList('saved_lists') ?? [];
    savedLists.add(json.encode(_items));
    await prefs.setStringList('saved_lists', savedLists);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Liste kaydedildi!')),
    );

    setState(() => _items.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Liste Oluştur"),
      drawer: const DrawerMenu(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ürün adı',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addItem,
                  child: const Text('Ekle'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (ctx, i) => Card(
                  child: ListTile(
                    title: Text(_items[i]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() => _items.removeAt(i));
                      },
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _saveList,
              child: const Text('Listeyi Kaydet'),
            ),
          ],
        ),
      ),
    );
  }
}
