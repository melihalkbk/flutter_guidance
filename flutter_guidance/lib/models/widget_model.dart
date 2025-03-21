class FlutterWidgetModel {
  final String name;
  final String description;
  final String sampleCode;
  final String category;
  final String docUrl;
  final List<String> properties;
  final String imageUrl;
  final bool isFavorite;

  FlutterWidgetModel({
    required this.name,
    required this.description,
    required this.sampleCode,
    required this.category,
    required this.docUrl,
    required this.properties,
    required this.imageUrl,
    this.isFavorite = false,
  });

  FlutterWidgetModel copyWith({
    String? name,
    String? description,
    String? sampleCode,
    String? category,
    String? docUrl,
    List<String>? properties,
    String? imageUrl,
    bool? isFavorite,
  }) {
    return FlutterWidgetModel(
      name: name ?? this.name,
      description: description ?? this.description,
      sampleCode: sampleCode ?? this.sampleCode,
      category: category ?? this.category,
      docUrl: docUrl ?? this.docUrl,
      properties: properties ?? this.properties,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
