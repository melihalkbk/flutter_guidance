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
      {"title": "Animated Container", "page": const AnimatedContainerView()},
      {"title": "Animated Opacity", "page": const AnimatedOpacityView()},
      {"title": "Animated Align", "page": const AnimatedAlignView()},
      {"title": "Animated Cross Fade", "page": const AnimatedCrossFadeView()},
      {"title": "Animated Switcher", "page": const AnimatedSwitcherView()},
      {"title": "Hero", "page": const HeroView()},
      {"title": "Fade Transition", "page": const FadeTransitionView()},
      {"title": "Slide Transition", "page": const SlideTransitionView()},
      {"title": "Scale Transition", "page": const ScaleTransitionView()},
      {"title": "Gesture Detector", "page": const GestureDetectorView()},
      {"title": "Inkwell", "page": const InkWellView()},
      {"title": "Dismissible", "page": const DismissibleView()},
      {"title": "Draggable", "page": const DraggableView()},
      {"title": "Alert Dialog", "page": const AlertDialogView()},
      {"title": "Snack Bar", "page": const SnackBarView()},
      {"title": "Bottom Sheet", "page": const BottomSheetView()},
      {"title": "Modal Bottom Sheet", "page": const ModalBottomSheetView()},
      {"title": "Simple Dialog", "page": const SimpleDialogView()},
      {"title": "Toast", "page": const ToastExampleView()},
      {"title": "HTTP", "page": const HttpExampleView()},
      {"title": "Dio", "page": const DioExampleView()},
      {"title": "Web Socket", "page": const WebSocketExampleView()},
      {"title": "Shared Preferences", "page": const SharedPreferencesExample()},
      {"title": "Custom Painter", "page": const AnimatedPainterExample()},
      {"title": "Clip RRect", "page": const ClipRRectExample()},
      {"title": "Clip Oval", "page": const ClipOvalExample()},
      {"title": "Clip Path", "page": const ClipPathExample()},
      {"title": "Transform", "page": const TransformExample()},
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
                                    "Clear, copy-paste ready code samples for quick implementation",
                              ),
                              _buildFeatureRow(
                                icon: Icons.touch_app,
                                text:
                                    "Interactive examples to see widgets in action",
                              ),
                              _buildFeatureRow(
                                icon: Icons.search,
                                text:
                                    "Quick search functionality to find specific widgets",
                              ),
                              _buildFeatureRow(
                                icon: Icons.auto_awesome,
                                text:
                                    "Best practices and real-world usage scenarios",
                              ),
                              _buildFeatureRow(
                                icon: Icons.update,
                                text:
                                    "Regular updates with new widgets and features",
                              ),
                              const SizedBox(height: 20),
                              const Text(
                                "💡 Pro Tips:",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "• Experiment with the interactive examples",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "• Study the source code for implementation details",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "• Combine multiple widgets to create complex UIs",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    final Uri githubUrl = Uri.parse(
                                      "https://github.com/melihalkbk/login-app",
                                    );
                                    launchUrl(githubUrl);
                                  },
                                  icon: const Icon(
                                    Icons.code,
                                    color: Colors.white,
                                  ),
                                  label: const Text(
                                    "Explore Source Code",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black87,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                      horizontal: 24,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
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

                        // Buttons Grid Enhancement
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 2.5,
                              ),
                          itemCount: _filteredButtons.length,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.blue.shade400,
                                    Colors.blue.shade600,
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: _filteredButtons[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              )
              : _selectedIndex == 1
              ? const ExercisePage()
              : const ProfilePage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Exercise'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildButton(Map<String, dynamic> widget) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget["page"]),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        widget["title"],
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
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
}
