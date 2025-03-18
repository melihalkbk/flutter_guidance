import 'package:flutter/material.dart';

class ListViewView extends StatelessWidget {
  const ListViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView in Flutter"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📌 ListView Widget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                "ListView is a scrolling widget that arranges its children in a single column "
                "and allows them to be scrolled vertically. It is used to display large lists efficiently.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueAccent, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Example Usage:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "ListView(\n"
                      "  children: [\n"
                      "    ListTile(title: Text('Item 1')),\n"
                      "    ListTile(title: Text('Item 2')),\n"
                      "    ListTile(title: Text('Item 3')),\n"
                      "  ],\n"
                      ")",
                      style: TextStyle(fontSize: 14, fontFamily: 'monospace'),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.blue[100],
                      ),
                      child: ListView(
                        children: const [
                          ListTile(
                            title: Text(
                              'Item 1',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              'Item 2',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              'Item 3',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                "✨ Features of ListView:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.check, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(child: Text("Automatically handles scrolling.")),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.check, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Supports infinite lists with ListView.builder.",
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.check, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Can be customized with ListTile, Divider, and other widgets.",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text("⬅ Back to Home"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
