// lib/pages/widget_detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/widget_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WidgetDetailPage extends StatefulWidget {
  final FlutterWidgetModel widget;
  final bool isFavorite;
  final VoidCallback onToggleFavorite;

  const WidgetDetailPage({
    super.key,
    required this.widget,
    required this.isFavorite,
    required this.onToggleFavorite,
  });

  @override
  State<WidgetDetailPage> createState() => _WidgetDetailPageState();
}

class _WidgetDetailPageState extends State<WidgetDetailPage> {
  bool _isCodeExpanded = true;

  void _openDocumentation() async {
    try {
      final url = Uri.parse(widget.widget.docUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not open ${url.toString()}')),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  void _copyCode() {
    Clipboard.setData(ClipboardData(text: widget.widget.sampleCode));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Code copied to clipboard')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.widget.name),
        actions: [
          IconButton(
            icon: Icon(
              widget.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: widget.isFavorite ? Colors.red : null,
            ),
            onPressed: widget.onToggleFavorite,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildTags(),
              const SizedBox(height: 16),
              _buildDescription(),
              const SizedBox(height: 24),
              _buildCodeSection(),
              const SizedBox(height: 24),
              _buildPropertiesSection(),
              const SizedBox(height: 40),
              _buildDocumentationButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: _getCategoryColor(
                  widget.widget.category,
                ).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getCategoryIcon(widget.widget.category),
                size: 40,
                color: _getCategoryColor(widget.widget.category),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.widget.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.widget.category,
                    style: TextStyle(
                      fontSize: 16,
                      color: _getCategoryColor(widget.widget.category),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTags() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        ...widget.widget.properties
            .map((property) => _buildTag(property))
            .toList(),
      ],
    );
  }

  Widget _buildTag(String tag) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tag,
        style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          widget.widget.description,
          style: const TextStyle(fontSize: 16, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildCodeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Sample Code',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.copy),
                  onPressed: _copyCode,
                  tooltip: 'Copy code',
                ),
                IconButton(
                  icon: Icon(
                    _isCodeExpanded ? Icons.expand_less : Icons.expand_more,
                  ),
                  onPressed: () {
                    setState(() {
                      _isCodeExpanded = !_isCodeExpanded;
                    });
                  },
                  tooltip: _isCodeExpanded ? 'Collapse code' : 'Expand code',
                ),
              ],
            ),
          ],
        ),
        AnimatedCrossFade(
          firstChild: _buildCodeBlock(),
          secondChild: const SizedBox(height: 0),
          crossFadeState:
              _isCodeExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
          duration: const Duration(milliseconds: 300),
        ),
      ],
    );
  }

  Widget _buildCodeBlock() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(
          widget.widget.sampleCode,
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildPropertiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Properties',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.widget.properties.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final property = widget.widget.properties[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.arrow_right, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(property, style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDocumentationButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: _openDocumentation,
        icon: const Icon(Icons.open_in_new),
        label: const Text('Open Official Documentation'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Layout':
        return Icons.grid_view;
      case 'Lists':
        return Icons.format_list_bulleted;
      case 'Input':
        return Icons.input;
      case 'Display':
        return Icons.visibility;
      case 'Feedback':
        return Icons.feedback;
      default:
        return Icons.widgets;
    }
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Layout':
        return Colors.blue;
      case 'Lists':
        return Colors.green;
      case 'Input':
        return Colors.purple;
      case 'Display':
        return Colors.orange;
      case 'Feedback':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
