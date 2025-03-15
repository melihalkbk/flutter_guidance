import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/components/elevated_button.dart';
import 'package:login_app/components/range_slider.dart';
import 'package:url_launcher/url_launcher.dart';
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

  @override
  void initState() {
    super.initState();
    _initializeWidgetList();
    _filterButtons('');
  }

  void _initializeWidgetList() {
    widgetList = [
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
      {"title": "Text", "page": const TextView()},
      {"title": "RichText", "page": const RichTextView()},
      {"title": "Selectable Text", "page": const SelectableTextView()},
      {"title": "TextField", "page": const TextFieldView()},
      {"title": "Image", "page": const ImageView()},
      {"title": "Icon", "page": const IconView()},
      {"title": "Circle Avatar", "page": const CircleAvatarView()},
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
      {"title": "Navigator", "page": const NavigatorView()},
      {"title": "Material Page Route", "page": const MaterialPageRouteView()},
      {"title": "Named Routes", "page": const NamedRoutesView()},
      {
        "title": "Bottom Navigation Bar ",
        "page": const BottomNavigationBarView(),
      },
      {"title": "Tab Bar", "page": const TabBarViewExample()},
      {"title": "Drawer", "page": const DrawerExample()},
      {"title": "App Bar", "page": const AppBarExample()},
    ];
  }

  void _filterButtons(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredButtons =
            widgetList.map((widget) => _buildButton(widget)).toList();
      } else {
        _filteredButtons =
            widgetList
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

  Widget _buildButton(Map<String, dynamic> widget) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => widget["page"]),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
            child: Text("Go to ${widget["title"]}"),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String displayName = user?.displayName ?? "Guest";

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Flutter Widgets App"),
            ElevatedButton(
              onPressed: () async {
                await _authService.signOut();
                Navigator.pushReplacementNamed(context, "/login");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const Icon(
                      Icons.account_circle,
                      size: 80,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Welcome, $displayName!",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // About This App section first
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "📌 About This App",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "This app is designed to help Flutter developers understand various UI components. "
                      "Each widget is explained with examples, making it easy to learn and implement in real projects.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "🚀 Features:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "Learn 50+ Flutter widgets with examples.",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "Each widget has a detailed explanation and sample usage.",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: const [
                        Icon(Icons.check_circle, color: Colors.green, size: 18),
                        SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "Easy navigation between widget examples.",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),

                    // GitHub Repository Button
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          final Uri githubUrl = Uri.parse(
                            "https://github.com/melihalkbk/login-app",
                          );
                          launchUrl(githubUrl);
                        },
                        icon: const Icon(Icons.code, color: Colors.white),
                        label: const Text("View Source Code"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search widgets...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                onChanged: _filterButtons,
              ),
              const SizedBox(height: 20),
              ..._filteredButtons,
            ],
          ),
        ),
      ),
    );
  }
}
