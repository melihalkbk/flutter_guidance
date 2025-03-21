import '../models/widget_model.dart';

final List<FlutterWidgetModel> allWidgets = [
  FlutterWidgetModel(
    name: "Container",
    description:
        "A convenience widget that combines common painting, positioning, and sizing widgets.",
    sampleCode: '''
Container(
  width: 200,
  height: 200,
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
  ),
  child: Center(
    child: Text(
      'Hello World!',
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
  ),
)
''',
    category: "Layout",
    docUrl: "https://api.flutter.dev/flutter/widgets/Container-class.html",
    properties: [
      "child",
      "alignment",
      "padding",
      "color",
      "decoration",
      "width",
      "height",
      "margin",
      "transform",
    ],
    imageUrl: "assets/widgets/container.png",
  ),

  FlutterWidgetModel(
    name: "Row",
    description: "A widget that displays its children in a horizontal array.",
    sampleCode: '''
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
    Icon(Icons.star, size: 50),
  ],
)
''',
    category: "Layout",
    docUrl: "https://api.flutter.dev/flutter/widgets/Row-class.html",
    properties: [
      "children",
      "mainAxisAlignment",
      "crossAxisAlignment",
      "mainAxisSize",
      "textDirection",
      "verticalDirection",
    ],
    imageUrl: "assets/widgets/row.png",
  ),

  FlutterWidgetModel(
    name: "Column",
    description: "A widget that displays its children in a vertical array.",
    sampleCode: '''
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text('First Text'),
    SizedBox(height: 10),
    Text('Second Text'),
    SizedBox(height: 10),
    Text('Third Text'),
  ],
)
''',
    category: "Layout",
    docUrl: "https://api.flutter.dev/flutter/widgets/Column-class.html",
    properties: [
      "children",
      "mainAxisAlignment",
      "crossAxisAlignment",
      "mainAxisSize",
      "textDirection",
      "verticalDirection",
    ],
    imageUrl: "assets/widgets/column.png",
  ),

  FlutterWidgetModel(
    name: "ListView",
    description: "A scrollable list of widgets arranged linearly.",
    sampleCode: '''
ListView(
  children: <Widget>[
    ListTile(
      leading: Icon(Icons.map),
      title: Text('Map'),
    ),
    ListTile(
      leading: Icon(Icons.photo_album),
      title: Text('Album'),
    ),
    ListTile(
      leading: Icon(Icons.phone),
      title: Text('Phone'),
    ),
  ],
)
''',
    category: "Lists",
    docUrl: "https://api.flutter.dev/flutter/widgets/ListView-class.html",
    properties: [
      "children",
      "scrollDirection",
      "controller",
      "physics",
      "padding",
      "itemExtent",
    ],
    imageUrl: "assets/widgets/listview.png",
  ),

  FlutterWidgetModel(
    name: "TextField",
    description:
        "Allows users to enter text, either with hardware keyboard or with an on-screen keyboard.",
    sampleCode: '''
TextField(
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'Email',
    hintText: 'Enter your email',
    prefixIcon: Icon(Icons.email),
  ),
  keyboardType: TextInputType.emailAddress,
)
''',
    category: "Input",
    docUrl: "https://api.flutter.dev/flutter/material/TextField-class.html",
    properties: [
      "controller",
      "decoration",
      "keyboardType",
      "obscureText",
      "onChanged",
      "onSubmitted",
      "maxLines",
    ],
    imageUrl: "assets/widgets/textfield.png",
  ),
];

// Widget'ları kategorilere göre grupla
Map<String, List<FlutterWidgetModel>> getWidgetsByCategory() {
  final Map<String, List<FlutterWidgetModel>> map = {};

  for (var widget in allWidgets) {
    if (!map.containsKey(widget.category)) {
      map[widget.category] = [];
    }
    map[widget.category]!.add(widget);
  }

  return map;
}
