import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class TipDetailPage extends StatelessWidget {
  final Map<String, dynamic> tip;
  final List<Map<String, dynamic>> relatedTips;

  const TipDetailPage({Key? key, required this.tip, required this.relatedTips})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Tip",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: tip['color'] as Color,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: (tip['color'] as Color).withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          tip['icon'] as IconData,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          tip['title'] as String,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Description Section
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main description
                  const Text(
                    "Overview",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tip['description'] as String,
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.grey.shade800,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Code Example Section (if available)
                  if (tip['codeExample'] != null) ...[
                    const Text(
                      "Code Example",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            _getCodeExample(tip['title'] as String),
                            style: const TextStyle(
                              fontFamily: 'monospace',
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextButton.icon(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(
                                  text: _getCodeExample(tip['title'] as String),
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Code copied to clipboard'),
                                ),
                              );
                            },
                            icon: const Icon(Icons.copy, size: 16),
                            label: const Text('Copy'),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  // Detailed Explanation
                  const Text(
                    "Detailed Explanation",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    tip['detailedExplanation'] ??
                        "This widget is ${tip['title']} that helps you create beautiful Flutter UIs. It's commonly used for creating responsive layouts and implementing advanced UI patterns in Flutter applications.",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.6,
                      color: Colors.grey.shade800,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Best Practices
                  const Text(
                    "Best Practices",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  if (tip['bestPractices'] != null &&
                      (tip['bestPractices'] as List).isNotEmpty)
                    ...List.generate(
                      (tip['bestPractices'] as List).length,
                      (i) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                color: tip['color'] as Color,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                (tip['bestPractices'] as List)[i],
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  else
                    _buildBestPractice(
                      "Use ${tip['title']} when you need to make your Flutter UI more structured and efficient.",
                    ),

                  const SizedBox(height: 24),

                  // Related Documentation button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _launchURL(tip['docUrl'] ?? 'https://flutter.dev/docs');
                      },
                      icon: const Icon(Icons.link),
                      label: const Text('Official Documentation'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tip['color'] as Color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),

                  // Related Tips
                  if (relatedTips.isNotEmpty) ...[
                    const SizedBox(height: 32),
                    const Text(
                      "Related Tips",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    for (final relatedTip in relatedTips)
                      _buildRelatedTipCard(context, relatedTip),
                  ],

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBestPractice(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: tip['color'] as Color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedTipCard(
    BuildContext context,
    Map<String, dynamic> relatedTip,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => TipDetailPage(tip: relatedTip, relatedTips: []),
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (relatedTip['color'] as Color).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  relatedTip['icon'] as IconData,
                  color: relatedTip['color'] as Color,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      relatedTip['title'] as String,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      relatedTip['description'] as String,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  String _getCodeExample(String title) {
    switch (title) {
      case 'StatefulWidget vs StatelessWidget':
        return '''
// StatelessWidget Example
class MyStatelessWidget extends StatelessWidget {
  final String title;
  
  const MyStatelessWidget({Key? key, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}

// StatefulWidget Example
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
  
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _counter = 0;
  
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: \$_counter'),
        ElevatedButton(
          onPressed: _incrementCounter,
          child: Text('Increment'),
        ),
      ],
    );
  }
}''';

      case 'const Constructor Benefits':
        return '''
// Without const
Widget buildItem() {
  return Container(
    padding: EdgeInsets.all(8.0),
    child: Text('Hello World'),
  );
}

// With const - much more efficient
Widget buildItem() {
  return const Container(
    padding: EdgeInsets.all(8.0),
    child: Text('Hello World'),
  );
}''';

      case 'ListView.builder for Large Lists':
        return '''
// Inefficient for long lists - creates all items at once
ListView(
  children: [
    for (int i = 0; i < 1000; i++)
      ListTile(
        title: Text('Item \$i'),
      )
  ],
)

// Efficient approach - creates items only when needed
ListView.builder(
  itemCount: 1000,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Item \$index'),
    );
  },
)''';

      case 'Using Future Builder':
        return '''
FutureBuilder<String>(
  future: fetchData(), // Your async function
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text('Error: \${snapshot.error}');
    } else {
      return Text('Data: \${snapshot.data}');
    }
  },
)

// Example async function
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Hello from the server';
}''';

      default:
        return 'No code example available for this tip.';
    }
  }
}
