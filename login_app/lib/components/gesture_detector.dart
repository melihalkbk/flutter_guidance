import 'package:flutter/material.dart';

class GestureDetectorView extends StatefulWidget {
  const GestureDetectorView({super.key});

  @override
  _GestureDetectorViewState createState() => _GestureDetectorViewState();
}

class _GestureDetectorViewState extends State<GestureDetectorView> {
  String _gestureText = "Tap or Swipe";

  void _updateText(String text) {
    setState(() {
      _gestureText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GestureDetector in Flutter")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📌 GestureDetector Widget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "GestureDetector is a widget that captures user gestures such as taps, "
                "swipes, long presses, and more. It is useful for making widgets interactive.",
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
                  "GestureDetector(\n"
                  "  onTap: () {\n"
                  "    print('Tapped!');\n"
                  "  },\n"
                  "  child: Container(\n"
                  "    width: 100,\n"
                  "    height: 100,\n"
                  "    color: Colors.blue,\n"
                  "  ),\n"
                  ")",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 20),

              GestureDetector(
                onTap: () => _updateText("Tapped!"),
                onDoubleTap: () => _updateText("Double Tapped!"),
                onLongPress: () => _updateText("Long Pressed!"),
                onHorizontalDragEnd: (_) => _updateText("Swiped Horizontally!"),
                child: Container(
                  width: double.infinity,
                  height: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    _gestureText,
                    style: const TextStyle(fontSize: 18, color: Colors.white),
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
                      "✨ Features of GestureDetector:",
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
                            "Detects taps, double taps, and long presses.",
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
                          child: Text(
                            "Supports swipe gestures and drag interactions.",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(child: Text("Can be used with any widget.")),
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
