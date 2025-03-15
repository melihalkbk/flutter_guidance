import 'package:flutter/material.dart';

class TransformExample extends StatelessWidget {
  const TransformExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transform Example")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📌 Transform Widget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "The `Transform` widget allows you to apply scaling, rotation, "
                "translation, and skewing to widgets. It is commonly used for "
                "animations, creative UI effects, and gesture-based transformations.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Example Usage:\n\n"
                  "Transform.rotate(\n"
                  "  angle: 0.5,\n"
                  "  child: Container(width: 100, height: 100, color: Colors.blue),\n"
                  ")",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Transform.rotate(
                  angle: 0.5,
                  child: const Icon(Icons.sync, size: 80, color: Colors.blue),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Transform.scale(
                  scale: 1.5,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Scaled Button"),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Transform.translate(
                  offset: const Offset(20, 10),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 60,
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Transform(
                  transform: Matrix4.skewX(0.3),
                  child: Container(
                    width: 100,
                    height: 50,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text(
                      "Skewed",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "✨ Features of Transform:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "Applies scaling, rotation, and translation.",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text("Does not affect widget layout size."),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "Useful for animations and interactive UI.",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  label: const Text("Back to Home"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
