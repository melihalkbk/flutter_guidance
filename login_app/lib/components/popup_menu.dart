import 'package:flutter/material.dart';

class PopupMenuButtonView extends StatefulWidget {
  const PopupMenuButtonView({super.key});

  @override
  _PopupMenuButtonViewState createState() => _PopupMenuButtonViewState();
}

class _PopupMenuButtonViewState extends State<PopupMenuButtonView> {
  String _selectedOption = "None";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PopupMenuButton in Flutter")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "📌 PopupMenuButton Widget",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "PopupMenuButton is used to display a list of options when the user taps on the button. "
                "It is commonly used for overflow menus or context-based options.",
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
                  "PopupMenuButton<String>(\n"
                  "  onSelected: (value) {\n"
                  "    print('Selected: \$value');\n"
                  "  },\n"
                  "  itemBuilder: (context) => [\n"
                  "    PopupMenuItem(value: 'Option 1', child: Text('Option 1')),\n"
                  "    PopupMenuItem(value: 'Option 2', child: Text('Option 2')),\n"
                  "  ],\n"
                  ")",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "✨ PopupMenuButton Example:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              Center(
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    setState(() {
                      _selectedOption = value;
                    });
                  },
                  itemBuilder:
                      (context) => [
                        const PopupMenuItem(
                          value: "Option 1",
                          child: Text("Option 1"),
                        ),
                        const PopupMenuItem(
                          value: "Option 2",
                          child: Text("Option 2"),
                        ),
                        const PopupMenuItem(
                          value: "Option 3",
                          child: Text("Option 3"),
                        ),
                      ],
                  child: const Icon(
                    Icons.more_vert,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Text(
                  "Selected: $_selectedOption",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
                      "✨ Features of PopupMenuButton Widget:",
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
                        Expanded(child: Text("Displays a dropdown menu.")),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "Can contain multiple selectable options.",
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
                            "Can be customized with icons and styles.",
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
