import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wrap in Flutter"), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📌 Wrap Widget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              const Text(
                "The Wrap widget is used when you need a dynamic layout where widgets automatically "
                "wrap to the next line if they exceed available space.",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
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
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Example Usage:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Wrap(\n"
                      "  spacing: 8.0,\n"
                      "  runSpacing: 8.0,\n"
                      "  children: [\n"
                      "    Chip(label: Text('Item 1')),\n"
                      "    Chip(label: Text('Item 2')),\n"
                      "    Chip(label: Text('Item 3')),\n"
                      "    Chip(label: Text('Item 4')),\n"
                      "  ],\n"
                      ")",
                      style: TextStyle(fontSize: 14, fontFamily: 'monospace'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Wrap(
                  spacing: 10.0,
                  runSpacing: 10.0,
                  children: List.generate(6, (index) {
                    return Chip(
                      label: Text('Item ${index + 1}'),
                      backgroundColor: Colors.blue[100],
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                "✨ Features of Wrap:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.check, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Prevents overflow by wrapping items automatically.",
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.check, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text("Allows horizontal & vertical spacing."),
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.check, color: Colors.green),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text("Best for dynamic layouts like tags or chips."),
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
