import 'package:flutter/material.dart';

class FlexibleExample extends StatelessWidget {
  const FlexibleExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flexible in Flutter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "📌 Flexible Widget",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            const Text(
              "The Flexible widget is similar to Expanded but allows a child to either expand or shrink dynamically "
              "instead of taking up all available space.",
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
                    "Row(\n"
                    "  children: [\n"
                    "    Flexible(child: Container(color: Colors.red, height: 100)),\n"
                    "    Flexible(child: Container(color: Colors.blue, height: 100)),\n"
                    "  ],\n"
                    ")",
                    style: TextStyle(fontSize: 14, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Row(
                children: [
                  Flexible(child: Container(color: Colors.red, height: 100)),
                  Flexible(child: Container(color: Colors.blue, height: 100)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "✨ Features of Flexible:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Allows a widget to expand but also shrink when needed.",
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
                    "Prevents overflow errors in Row/Column layouts.",
                  ),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text("Works well with multiple Flexible widgets."),
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
    );
  }
}
