import 'package:flutter/material.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  _SliderViewState createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  double _currentValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Slider in Flutter")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📌 Slider Widget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Slider allows users to select a value from a defined range "
                "by dragging a handle along a track. It is commonly used for volume, "
                "brightness, and other adjustable settings.",
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
                  "Slider(\n"
                  "  value: _currentValue,\n"
                  "  min: 0,\n"
                  "  max: 100,\n"
                  "  divisions: 10,\n"
                  "  label: _currentValue.round().toString(),\n"
                  "  onChanged: (value) {\n"
                  "    setState(() {\n"
                  "      _currentValue = value;\n"
                  "    });\n"
                  "  },\n"
                  ")",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Selected Value: ${_currentValue.round()}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Slider(
                    value: _currentValue,
                    min: 0,
                    max: 100,
                    divisions: 10,
                    label: _currentValue.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        _currentValue = value;
                      });
                    },
                  ),
                ],
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
                      "✨ Features of Slider Widget:",
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
                            "Allows users to select a value from a range.",
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
                          child: Text("Supports min, max, and divisions."),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text("Can display current value using label."),
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
