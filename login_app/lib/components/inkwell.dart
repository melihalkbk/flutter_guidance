import 'package:flutter/material.dart';

class InkWellView extends StatefulWidget {
  const InkWellView({super.key});

  @override
  _InkWellViewState createState() => _InkWellViewState();
}

class _InkWellViewState extends State<InkWellView> {
  String _tapMessage = "Tap the box";

  void _updateText(String message) {
    setState(() {
      _tapMessage = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("InkWell in Flutter")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📌 InkWell Widget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "InkWell is a material widget that provides a ripple effect "
                "when tapped. It is commonly used to make widgets interactive, "
                "such as buttons, cards, or custom clickable areas.",
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
                  "InkWell(\n"
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

              Center(
                child: InkWell(
                  onTap: () => _updateText("Tapped!"),
                  onDoubleTap: () => _updateText("Double Tapped!"),
                  onLongPress: () => _updateText("Long Pressed!"),
                  borderRadius: BorderRadius.circular(10),
                  splashColor: Colors.red,
                  child: Container(
                    width: 150,
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _tapMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.white),
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
                      "✨ Features of InkWell:",
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
                        Expanded(child: Text("Adds ripple effect on tap.")),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "Supports gestures like tap, double tap, and long press.",
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
                            "Can be used with any widget like containers or images.",
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
            ],
          ),
        ),
      ),
    );
  }
}
