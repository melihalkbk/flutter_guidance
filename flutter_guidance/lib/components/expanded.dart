import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expanded in Flutter"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title
            const Text(
              "📌 Expanded Widget",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Explanation
            const Text(
              "The Expanded widget allows a child to take up all available space inside a Row, Column, or Flex. "
              "It is useful for making UI elements flexible and responsive.",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Code Example Box
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
                    "    Expanded(child: Container(color: Colors.red, height: 100)),\n"
                    "    Expanded(child: Container(color: Colors.blue, height: 100)),\n"
                    "  ],\n"
                    ")",
                    style: TextStyle(fontSize: 14, fontFamily: 'monospace'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Example UI with Expanded
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red, height: 100)),
                  Expanded(child: Container(color: Colors.blue, height: 100)),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Features List
            const Text(
              "✨ Features of Expanded:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text("Expands to fill available space in Row/Column."),
                ),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 8),
                Expanded(child: Text("Prevents layout overflow errors.")),
              ],
            ),
            const Row(
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Supports multiple Expanded widgets with different flex values.",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Back to Home Button
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
