import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../widgets/custom_drawer.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  final List<String> items = [];
  final TextEditingController _controller = TextEditingController();

  void _addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        items.add(_controller.text);
        _controller.clear();
      });
    }
  }

  void _saveList() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> savedLists = prefs.getStringList('saved_lists') ?? [];
    savedLists.add(json.encode(items));
    await prefs.setStringList('saved_lists', savedLists);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Liste kaydedildi!')),
    );

    setState(() {
      items.clear();
    });

    Navigator.pushReplacementNamed(context, '/home'); // Ana sayfaya dön
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alışveriş Listesi"),
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                itemCount: items.length,
                itemBuilder: (ctx, i) => Card(
                  child: ListTile(
                    title: Text(items[i]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        setState(() {
                          items.removeAt(i);
                        });
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
