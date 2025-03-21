import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/components/elevated_button.dart';
import 'package:login_app/components/range_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../services/auth_service.dart';
import '../components/column.dart';
import '../components/row.dart';
import '../components/stack.dart';
import '../components/list_view.dart';
import '../components/grid_view.dart';
import '../components/single_child_scroll_view.dart';
import '../components/expanded.dart';
import '../components/flexible.dart';
import '../components/wrap.dart';
import '../components/align.dart';
import '../components/center.dart';
import '../components/sizedbox.dart';
import '../components/padding.dart';
import '../components/margin_via_container.dart';
import '../components/container.dart';
import '../components/card.dart';
import '../components/divider.dart';
import '../components/spacer.dart';
import '../components/aspect_ratio.dart';
import '../components/text.dart';
import '../components/richtext.dart';
import '../components/selectable_text.dart';
import '../components/textfield.dart';
import '../components/image.dart';
import '../components/icon.dart';
import '../components/circle_avatar.dart';
import '../components/text_button.dart';
import '../components/outlined_button.dart';
import '../components/floating_action_button.dart';
import '../components/icon_button.dart';
import '../components/popup_menu.dart';
import '../components/textfield_form.dart';
import '../components/checkbox.dart';
import '../components/radio.dart';
import '../components/switch.dart';
import '../components/slider.dart';
import '../components/datepicker.dart';
import '../components/drop_down_button.dart';
import '../components/auto_complete.dart';
import '../components/navigator.dart';
import '../components/material_page_route.dart';
import '../components/named_routes.dart';
import '../components/bottom_navigation_bar.dart';
import '../components/tab_bar.dart';
import '../components/drawer.dart';
import '../components/app_bar.dart';
import '../components/animated_container.dart';
import '../components/animated_opacity.dart';
import '../components/animated_align.dart';
import '../components/animated_cross_fade.dart';
import '../components/animated_switcher.dart';
import '../components/hero.dart';
import '../components/fade_transition.dart';
import '../components/slide_transition.dart';
import '../components/scale_transition.dart';
import '../components/gesture_detector.dart';
import '../components/inkwell.dart';
import '../components/dismissible.dart';
import '../components/draggable.dart';
import '../components/alert_dialog.dart';
import '../components/snack_bar.dart';
import '../components/bottom_sheet.dart';
import '../components/modal_bottom_sheet.dart';
import '../components/simple_dialog.dart';
import '../components/toast.dart';
import '../components/http.dart';
import '../components/dio.dart';
import '../components/web_socket.dart';
import '../components/shared_preferences.dart';
import '../components/custom_painter.dart';
import '../components/clip_rrect.dart';
import '../components/clip_oval.dart';
import '../components/clip_path.dart';
import '../components/transform.dart';
import 'profile_page.dart';
import 'exercise_page.dart';
import 'settings_page.dart';
import 'widget_gallery_page.dart';
import 'tip_detail_page.dart';

enum WidgetViewMode { all, favorites, recentlyViewed }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> widgetList = [];
  List<Widget> _filteredButtons = [];
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _dailyTips = [
    {
      'title': 'StatefulWidget vs StatelessWidget',
      'description':
          'Use StatefulWidget when your widget needs to maintain state that changes over time.',
      'icon': Icons.compare_arrows,
      'color': Colors.blue,
      'detailedExplanation':
          'StatelessWidget is used when the widget doesn\'t need to maintain state. It\'s simpler and more efficient when you don\'t need to track changes or update the UI based on user interactions. StatefulWidget, on the other hand, has a separate State object that can change during the widget\'s lifetime. Use it when you need to handle user interactions, animations, or any data that might change.',
      'codeExample':
          'See detailed examples in the documentation on how to use StatelessWidget and StatefulWidget properly.',
      'bestPractices': [
        'Use StatelessWidget when the UI doesn\'t change dynamically',
        'Use StatefulWidget when you need to maintain state or handle user interactions',
        'Keep StatefulWidget as small as possible for better performance',
        'Extract complex UI parts into StatelessWidget components',
      ],
      'docUrl':
          'https://api.flutter.dev/flutter/widgets/StatefulWidget-class.html',
    },
    {
      'title': 'const Constructor Benefits',
      'description':
          'Always use const constructors when possible to improve performance.',
      'icon': Icons.speed,
      'color': Colors.green,
      'detailedExplanation':
          'Using the const keyword for constructors in Flutter allows the framework to optimize rendering by reusing widget instances. When a widget is const, Flutter doesn\'t have to rebuild it if its parent rebuilds, leading to better performance, especially in large widget trees. In essence, const widgets are cached and reused when possible.',
      'codeExample':
          'See examples in the documentation for how to effectively use const constructors to improve app performance.',
      'bestPractices': [
        'Use const constructors whenever all constructor arguments are also const',
        'Consider making your custom widget constructors const-compatible',
        'Use IntelliJ/Android Studio\'s "Add const constructor" intention',
        'Remember that const widgets can\'t depend on non-const values like variables',
      ],
      'docUrl':
          'https://dart.dev/guides/language/effective-dart/usage#do-use-const-for-constant-expressions',
    },
    {
      'title': 'ListView.builder for Large Lists',
      'description':
          'For long lists, use ListView.builder instead of ListView for better performance.',
      'icon': Icons.list,
      'color': Colors.orange,
      'detailedExplanation':
          'ListView.builder creates items as they become visible on screen (lazy loading), while a standard ListView with children creates all items at once. For long lists, ListView.builder is much more memory-efficient because it only renders the items that are currently visible plus a small buffer for smooth scrolling.',
      'codeExample':
          'Check the documentation for complete examples of how to implement ListView.builder for efficient list rendering.',
      'bestPractices': [
        'Use ListView.builder for lists with many items or unknown length',
        'Implement proper item recycling with keys for stateful items',
        'Consider ListView.separated when you need dividers between items',
        'For even better performance with complex items, consider caching widgets',
      ],
      'docUrl':
          'https://api.flutter.dev/flutter/widgets/ListView/ListView.builder.html',
    },
    {
      'title': 'Using Future Builder',
      'description':
          'FutureBuilder helps you handle async operations and their UI states elegantly.',
      'icon': Icons.update,
      'color': Colors.purple,
      'detailedExplanation':
          'FutureBuilder is a built-in widget in Flutter that makes it easier to work with asynchronous data. It provides a clean way to handle different states of a Future (loading, success, error) and update the UI accordingly. This reduces the need for manual state management when working with async operations like network requests or database queries.',
      'codeExample':
          'See the documentation for detailed examples of handling loading, error, and success states with FutureBuilder.',
      'bestPractices': [
        'Always handle all possible states: loading, error, and success',
        'Consider using a cache for frequently accessed data',
        'Use FutureBuilder.initialData for a better user experience',
        'Extract FutureBuilder into a separate widget for better code organization',
      ],
      'docUrl':
          'https://api.flutter.dev/flutter/widgets/FutureBuilder-class.html',
    },
  ];

  int _currentTipIndex = 0;
  PageController _tipPageController = PageController(viewportFraction: 0.9);

  Map<String, List<Map<String, dynamic>>> _categorizedWidgets = {};
  List<String> _categoryOrder = [];
  String _selectedCategory = 'All';

  List<Map<String, dynamic>> _recentlyViewedWidgets = [];

  final int _maxRecentItems = 5;

  List<Map<String, dynamic>> _favoriteWidgets = [];
  WidgetViewMode _currentViewMode = WidgetViewMode.all;
  bool _showCategoryFilter = true;

  @override
  void initState() {
    super.initState();
    _initializeWidgetList();
    _filterButtons('');
    _loadSavedWidgets();

    _tipPageController.addListener(() {
      if (_tipPageController.page!.round() != _currentTipIndex) {
        setState(() {
          _currentTipIndex = _tipPageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _tipPageController.dispose();
    super.dispose();
  }

  void _initializeWidgetList() {
    final Map<String, List<Map<String, dynamic>>> categorizedWidgets = {
      'Layout': [
        {"title": "Column", "page": const ColumnView()},
        {"title": "Row", "page": const RowView()},
        {"title": "Stack", "page": const StackView()},
        {"title": "ListView", "page": const ListViewView()},
        {"title": "GridView", "page": const GridViewView()},
        {
          "title": "Single Child Scroll View",
          "page": const SingleChildScrollViewExample(),
        },
        {"title": "Expanded", "page": const ExpandedExample()},
        {"title": "Flexible", "page": const FlexibleExample()},
        {"title": "Wrap", "page": const WrapExample()},
        {"title": "Align", "page": const AlignView()},
        {"title": "Center", "page": const CenterView()},
        {"title": "SizedBox", "page": const SizedBoxView()},
        {"title": "Padding", "page": const PaddingView()},
        {"title": "Margin Via Container", "page": const MarginContainerView()},
        {"title": "Container", "page": const ContainerView()},
        {"title": "Card", "page": const CardView()},
        {"title": "Divider", "page": const DividerView()},
        {"title": "Spacer", "page": const SpacerView()},
        {"title": "Aspect Ratio", "page": const AspectRatioView()},
      ],
      'Content': [
        {"title": "Text", "page": const TextView()},
        {"title": "RichText", "page": const RichTextView()},
        {"title": "Selectable Text", "page": const SelectableTextView()},
        {"title": "TextField", "page": const TextFieldView()},
        {"title": "Image", "page": const ImageView()},
        {"title": "Icon", "page": const IconView()},
        {"title": "Circle Avatar", "page": const CircleAvatarView()},
      ],
      'Input & Buttons': [
        {"title": "Elevated Button", "page": const ElevatedButtonView()},
        {"title": "Text Button", "page": const TextButtonView()},
        {"title": "Outlined Button", "page": const OutlinedButtonView()},
        {
          "title": "Floating Action Button",
          "page": const FloatingActionButtonView(),
        },
        {"title": "Icon Button", "page": const IconButtonView()},
        {"title": "Popup Menu Button", "page": const PopupMenuButtonView()},
        {"title": "TextForm Field Button", "page": const TextFormFieldView()},
        {"title": "CheckBox", "page": const CheckboxView()},
        {"title": "Radio", "page": const RadioView()},
        {"title": "Switch", "page": const SwitchView()},
        {"title": "Slider", "page": const SliderView()},
        {"title": "Date Picker", "page": const DatePickerView()},
        {"title": "Dropdown Button", "page": const DropdownButtonView()},
        {"title": "Auto Complete", "page": const AutocompleteView()},
        {"title": "Ranger Slider", "page": const RangeSliderView()},
      ],
      'Navigation': [
        {"title": "Navigator", "page": const NavigatorView()},
        {"title": "Material Page Route", "page": const MaterialPageRouteView()},
        {"title": "Named Routes", "page": const NamedRoutesView()},
        {
          "title": "Bottom Navigation Bar",
          "page": const BottomNavigationBarView(),
        },
        {"title": "Tab Bar", "page": const TabBarViewExample()},
        {"title": "Drawer", "page": const DrawerExample()},
        {"title": "App Bar", "page": const AppBarExample()},
      ],
      'Animation': [
        {"title": "Animated Container", "page": const AnimatedContainerView()},
        {"title": "Animated Opacity", "page": const AnimatedOpacityView()},
        {"title": "Animated Align", "page": const AnimatedAlignView()},
        {"title": "Animated Cross Fade", "page": const AnimatedCrossFadeView()},
        {"title": "Animated Switcher", "page": const AnimatedSwitcherView()},
        {"title": "Hero", "page": const HeroView()},
        {"title": "Fade Transition", "page": const FadeTransitionView()},
        {"title": "Slide Transition", "page": const SlideTransitionView()},
        {"title": "Scale Transition", "page": const ScaleTransitionView()},
      ],
      'Interaction': [
        {"title": "Gesture Detector", "page": const GestureDetectorView()},
        {"title": "Inkwell", "page": const InkWellView()},
        {"title": "Dismissible", "page": const DismissibleView()},
        {"title": "Draggable", "page": const DraggableView()},
      ],
      'Dialog & Feedback': [
        {"title": "Alert Dialog", "page": const AlertDialogView()},
        {"title": "Snack Bar", "page": const SnackBarView()},
        {"title": "Bottom Sheet", "page": const BottomSheetView()},
        {"title": "Modal Bottom Sheet", "page": const ModalBottomSheetView()},
        {"title": "Simple Dialog", "page": const SimpleDialogView()},
        {"title": "Toast", "page": const ToastExampleView()},
      ],
      'Data & Backend': [
        {"title": "HTTP", "page": const HttpExampleView()},
        {"title": "Dio", "page": const DioExampleView()},
        {"title": "Web Socket", "page": const WebSocketExampleView()},
        {
          "title": "Shared Preferences",
          "page": const SharedPreferencesExample(),
        },
      ],
      'Drawing & Clipping': [
        {"title": "Custom Painter", "page": const AnimatedPainterExample()},
        {"title": "Clip RRect", "page": const ClipRRectExample()},
        {"title": "Clip Oval", "page": const ClipOvalExample()},
        {"title": "Clip Path", "page": const ClipPathExample()},
        {"title": "Transform", "page": const TransformExample()},
      ],
    };

    final List<String> categoryOrder = [
      'Layout',
      'Content',
      'Input & Buttons',
      'Navigation',
      'Animation',
      'Interaction',
      'Dialog & Feedback',
      'Data & Backend',
      'Drawing & Clipping',
    ];

    widgetList = [];
    for (final category in categoryOrder) {
      widgetList.addAll(categorizedWidgets[category] ?? []);
    }

    _categorizedWidgets = categorizedWidgets;
    _categoryOrder = categoryOrder;
  }

  void _filterButtons(String query) {
    setState(() {
      _filteredButtons = [];
      List<Map<String, dynamic>> widgetsToFilter;

      switch (_currentViewMode) {
        case WidgetViewMode.favorites:
          widgetsToFilter = List.from(_favoriteWidgets);
          break;
        case WidgetViewMode.recentlyViewed:
          widgetsToFilter = List.from(_recentlyViewedWidgets);
          break;
        case WidgetViewMode.all:
        default:
          if (_selectedCategory == 'All') {
            widgetsToFilter = List.from(widgetList);
          } else {
            widgetsToFilter = List.from(
              _categorizedWidgets[_selectedCategory] ?? [],
            );
          }
          break;
      }

      _showCategoryFilter = _currentViewMode == WidgetViewMode.all;

      if (query.isEmpty) {
        _filteredButtons =
            widgetsToFilter.map((widget) => _buildButton(widget)).toList();
      } else {
        _filteredButtons =
            widgetsToFilter
                .where(
                  (widget) => widget["title"].toString().toLowerCase().contains(
                    query.toLowerCase(),
                  ),
                )
                .map((widget) => _buildButton(widget))
                .toList();
      }
    });
  }

  void _changeCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _filterButtons(_searchController.text);
    });
  }

  bool isFavorite(Map<String, dynamic> widget) {
    return _favoriteWidgets.any(
      (element) => element["title"] == widget["title"],
    );
  }

  void toggleFavorite(Map<String, dynamic> widget) {
    setState(() {
      if (isFavorite(widget)) {
        _favoriteWidgets.removeWhere(
          (element) => element["title"] == widget["title"],
        );
      } else {
        _favoriteWidgets.add(widget);
      }

      _saveFavoriteWidgets();
    });
  }

  void addToRecentlyViewed(Map<String, dynamic> widget) {
    setState(() {
      _recentlyViewedWidgets.removeWhere(
        (element) => element["title"] == widget["title"],
      );

      _recentlyViewedWidgets.insert(0, widget);

      if (_recentlyViewedWidgets.length > _maxRecentItems) {
        _recentlyViewedWidgets = _recentlyViewedWidgets.sublist(
          0,
          _maxRecentItems,
        );
      }

      _saveRecentlyViewedWidgets();
    });
  }

  Future<void> _loadSavedWidgets() async {
    final prefs = await SharedPreferences.getInstance();

    final favoriteWidgetsJson = prefs.getStringList('favorite_widgets') ?? [];
    _favoriteWidgets =
        favoriteWidgetsJson
            .map((jsonStr) => json.decode(jsonStr) as Map<String, dynamic>)
            .map((map) => _resolveWidgetFromData(map))
            .toList();

    final recentWidgetsJson = prefs.getStringList('recent_widgets') ?? [];
    _recentlyViewedWidgets =
        recentWidgetsJson
            .map((jsonStr) => json.decode(jsonStr) as Map<String, dynamic>)
            .map((map) => _resolveWidgetFromData(map))
            .toList();
  }

  Future<void> _saveFavoriteWidgets() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        _favoriteWidgets
            .map(
              (widget) => json.encode({
                "title": widget["title"],
                "category": _getWidgetCategory(widget),
              }),
            )
            .toList();

    await prefs.setStringList('favorite_widgets', jsonList);
  }

  Future<void> _saveRecentlyViewedWidgets() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        _recentlyViewedWidgets
            .map(
              (widget) => json.encode({
                "title": widget["title"],
                "category": _getWidgetCategory(widget),
              }),
            )
            .toList();

    await prefs.setStringList('recent_widgets', jsonList);
  }

  Map<String, dynamic> _resolveWidgetFromData(Map<String, dynamic> data) {
    final String title = data["title"];
    final String category = data["category"];

    if (_categorizedWidgets.containsKey(category)) {
      final widget = _categorizedWidgets[category]?.firstWhere(
        (w) => w["title"] == title,
        orElse: () => {"title": title, "page": const Placeholder()},
      );

      if (widget != null) {
        return widget;
      }
    }

    return widgetList.firstWhere(
      (w) => w["title"] == title,
      orElse: () => {"title": title, "page": const Placeholder()},
    );
  }

  String _getWidgetCategory(Map<String, dynamic> widget) {
    for (final entry in _categorizedWidgets.entries) {
      if (entry.value.any((w) => w["title"] == widget["title"])) {
        return entry.key;
      }
    }
    return "Unknown";
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final Map<String, dynamic>? args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final String displayName =
        user?.email ??
        "${args?['firstName'] ?? 'Guest'} ${args?['lastName'] ?? ''}";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue.shade50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Flutter Guidance",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await _authService.signOut();
                Navigator.pushReplacementNamed(context, "/login");
              },
              icon: const Icon(Icons.logout, size: 20),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
      body:
          _selectedIndex == 0
              ? Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue.shade50, Colors.white],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User Profile Section
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.account_circle,
                                  size: 60,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Welcome,",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: Text(
                                      displayName,
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Daily Flutter Tips Section
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Daily Flutter Tips",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "View All",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Container(
                                height: 230,
                                child: PageView.builder(
                                  controller: _tipPageController,
                                  itemCount: _dailyTips.length,
                                  itemBuilder: (context, index) {
                                    final tip = _dailyTips[index];
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 12),
                                      child: Card(
                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                          10,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: (tip['color']
                                                              as Color)
                                                          .withOpacity(0.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                    ),
                                                    child: Icon(
                                                      tip['icon'] as IconData,
                                                      color:
                                                          tip['color'] as Color,
                                                      size: 24,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          "Tip #${index + 1}",
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors
                                                                    .grey
                                                                    .shade600,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 4,
                                                        ),
                                                        Text(
                                                          tip['title']
                                                              as String,
                                                          style:
                                                              const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                          maxLines: 1,
                                                          overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 12),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Text(
                                                    tip['description']
                                                        as String,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color:
                                                          Colors.grey.shade700,
                                                      height: 1.5,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ), // azalttık
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (
                                                            context,
                                                          ) => TipDetailPage(
                                                            tip: tip,
                                                            relatedTips:
                                                                _dailyTips
                                                                    .where(
                                                                      (t) =>
                                                                          t !=
                                                                          tip,
                                                                    )
                                                                    .take(2)
                                                                    .toList(),
                                                          ),
                                                    ),
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      tip['color'] as Color,
                                                  foregroundColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                  minimumSize: const Size(
                                                    double.infinity,
                                                    40,
                                                  ),
                                                ),
                                                child: const Text("Learn More"),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  _dailyTips.length,
                                  (index) => Container(
                                    width: 8,
                                    height: 8,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color:
                                          index == _currentTipIndex
                                              ? Colors.blue
                                              : Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // About Section Enhancement
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.blue.shade50, Colors.white],
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue.withOpacity(0.1),
                                spreadRadius: 5,
                                blurRadius: 10,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "📱 Welcome to Flutter Guidance",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                "Your ultimate companion for mastering Flutter UI development! This comprehensive guide brings you a carefully curated collection of Flutter widgets and their practical implementations.",
                                style: TextStyle(fontSize: 16, height: 1.5),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "🎯 Why This App?",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Whether you're a beginner starting your Flutter journey or an experienced developer looking for quick references, this app is designed to accelerate your learning process with hands-on examples and clear explanations.",
                                style: TextStyle(fontSize: 16, height: 1.5),
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "🚀 Key Features:",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 12),
                              _buildFeatureRow(
                                icon: Icons.widgets,
                                text:
                                    "Extensive collection of 50+ Flutter widgets with practical examples",
                              ),
                              _buildFeatureRow(
                                icon: Icons.code,
                                text:
                                    "Interactive code examples with clear explanations",
                              ),
                              _buildFeatureRow(
                                icon: Icons.category,
                                text:
                                    "Organized by categories for easier navigation",
                              ),
                              _buildFeatureRow(
                                icon: Icons.search,
                                text:
                                    "Searchable widget catalog for quick access",
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: () async {
                                  final url = Uri.parse(
                                    'https://flutter.dev/docs',
                                  );
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                    horizontal: 24,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.link),
                                    SizedBox(width: 8),
                                    Text(
                                      "Visit Flutter Documentation",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Search Bar Enhancement
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _searchController,
                            decoration: InputDecoration(
                              hintText: 'Search widgets...',
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey.shade400,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged: _filterButtons,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16, top: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 10,
                                spreadRadius: 0,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              _buildViewTab(
                                title: "All",
                                isActive:
                                    _currentViewMode == WidgetViewMode.all,
                                onTap: () {
                                  setState(() {
                                    _currentViewMode = WidgetViewMode.all;
                                    _filterButtons(_searchController.text);
                                  });
                                },
                                icon: Icons.widgets,
                              ),
                              _buildViewTab(
                                title: "Favorites",
                                isActive:
                                    _currentViewMode ==
                                    WidgetViewMode.favorites,
                                onTap: () {
                                  setState(() {
                                    _currentViewMode = WidgetViewMode.favorites;
                                    _filterButtons(_searchController.text);
                                  });
                                },
                                icon: Icons.favorite,
                              ),
                              _buildViewTab(
                                title: "Recently",
                                isActive:
                                    _currentViewMode ==
                                    WidgetViewMode.recentlyViewed,
                                onTap: () {
                                  setState(() {
                                    _currentViewMode =
                                        WidgetViewMode.recentlyViewed;
                                    _filterButtons(_searchController.text);
                                  });
                                },
                                icon: Icons.history,
                              ),
                            ],
                          ),
                        ),
                        if (_showCategoryFilter)
                          Container(
                            height: 50,
                            margin: const EdgeInsets.only(bottom: 16),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildCategoryChip('All'),
                                ...(_categoryOrder.map(
                                  (category) => _buildCategoryChip(category),
                                )).toList(),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _getHeaderTitle(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${_filteredButtons.length} widgets',
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Buttons Grid Enhancement
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                childAspectRatio: 1,
                              ),
                          itemCount: _filteredButtons.length,
                          itemBuilder: (context, index) {
                            return _filteredButtons[index];
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
              : _selectedIndex == 1
              ? const ExercisePage()
              : _selectedIndex == 2
              ? const WidgetGalleryPage()
              : _selectedIndex == 3
              ? const ProfilePage()
              : const SettingsPage(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment),
              label: 'Exercises',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.widgets),
              label: 'Widgets',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(Map<String, dynamic> widget) {
    String? category;

    for (final cat in _categorizedWidgets.keys) {
      if (_categorizedWidgets[cat]!.contains(widget)) {
        category = cat;
        break;
      }
    }

    Color color = _getCategoryColor(category ?? 'Unknown');
    bool favorite = isFavorite(widget);

    return Stack(
      children: [
        ElevatedButton(
          onPressed: () {
            addToRecentlyViewed(widget);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => widget["page"]),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(_getCategoryIcon(category ?? 'Unknown'), size: 18),
              const SizedBox(height: 4),
              Text(
                widget["title"],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: IconButton(
              icon: Icon(
                favorite ? Icons.favorite : Icons.favorite_border,
                color: favorite ? Colors.red : Colors.grey.shade400,
              ),
              iconSize: 16,
              constraints: const BoxConstraints(minWidth: 24, minHeight: 24),
              padding: EdgeInsets.zero,
              onPressed: () => toggleFavorite(widget),
            ),
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Layout':
        return Colors.blueAccent;
      case 'Content':
        return Colors.green;
      case 'Input & Buttons':
        return Colors.amber.shade700;
      case 'Navigation':
        return Colors.purple;
      case 'Animation':
        return Colors.pinkAccent;
      case 'Interaction':
        return Colors.teal;
      case 'Dialog & Feedback':
        return Colors.deepOrange;
      case 'Data & Backend':
        return Colors.indigo;
      case 'Drawing & Clipping':
        return Colors.brown;
      default:
        return Colors.blue.shade700;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case 'Layout':
        return Icons.grid_view;
      case 'Content':
        return Icons.text_fields;
      case 'Input & Buttons':
        return Icons.touch_app;
      case 'Navigation':
        return Icons.navigation;
      case 'Animation':
        return Icons.animation;
      case 'Interaction':
        return Icons.swipe;
      case 'Dialog & Feedback':
        return Icons.notifications;
      case 'Data & Backend':
        return Icons.cloud;
      case 'Drawing & Clipping':
        return Icons.brush;
      default:
        return Icons.widgets;
    }
  }

  Widget _buildFeatureRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.blue, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = _selectedCategory == category;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(category),
        selected: isSelected,
        onSelected: (bool selected) {
          if (selected) {
            _changeCategory(category);
          }
        },
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.blue,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        backgroundColor: Colors.blue.withOpacity(0.1),
        selectedColor: Colors.blue,
        checkmarkColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),
    );
  }

  Widget _buildViewTab({
    required String title,
    required bool isActive,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? Colors.blue : Colors.transparent,
                width: 3,
              ),
            ),
          ),
          child: Column(
            children: [
              Icon(icon, color: isActive ? Colors.blue : Colors.grey),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  color: isActive ? Colors.blue : Colors.grey,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getHeaderTitle() {
    switch (_currentViewMode) {
      case WidgetViewMode.favorites:
        return 'Favorite Widgets';
      case WidgetViewMode.recentlyViewed:
        return 'Recently Viewed Widgets';
      case WidgetViewMode.all:
      default:
        return _selectedCategory == 'All'
            ? 'All Widgets'
            : '$_selectedCategory Widgets';
    }
  }
}
