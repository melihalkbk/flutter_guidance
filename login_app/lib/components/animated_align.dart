import 'package:flutter/material.dart';

class AnimatedAlignView extends StatefulWidget {
  const AnimatedAlignView({super.key});

  @override
  _AnimatedAlignViewState createState() => _AnimatedAlignViewState();
}

class _AnimatedAlignViewState extends State<AnimatedAlignView> {
  bool _isLeft = true;

  void _toggleAlignment() {
    setState(() {
      _isLeft = !_isLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedAlign in Flutter")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📌 AnimatedAlign Widget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "AnimatedAlign allows you to animate the alignment of a widget smoothly. "
                "It is useful when you want to move elements dynamically with animations.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 200,
                child: Container(
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: AnimatedAlign(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    alignment:
                        _isLeft ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: ElevatedButton(
                  onPressed: _toggleAlignment,
                  child: const Text("Toggle Alignment"),
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
                      "✨ Features of AnimatedAlign:",
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
                          child: Text("Smoothly animates alignment changes."),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text("Supports different animation curves."),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(child: Text("Great for dynamic UI changes.")),
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
            ],
          ),
        ),
      ),
    );
  }
}
