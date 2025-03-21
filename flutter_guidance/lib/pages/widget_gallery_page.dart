// lib/pages/widget_gallery_page.dart
import 'package:flutter/material.dart';
import '../models/widget_model.dart';
import '../data/widgets_data.dart';
import '../services/widget_service.dart';
import 'widget_detail_page.dart';

class WidgetGalleryPage extends StatefulWidget {
  const WidgetGalleryPage({super.key});

  @override
  State<WidgetGalleryPage> createState() => _WidgetGalleryPageState();
}

class _WidgetGalleryPageState extends State<WidgetGalleryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final WidgetService _widgetService = WidgetService();
  List<String> _favoriteWidgets = [];
  List<String> _recentWidgets = [];
  String _searchQuery = '';
  bool _isSearching = false;

  final Map<String, List<FlutterWidgetModel>> _widgetsByCategory =
      getWidgetsByCategory();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length:
          _widgetsByCategory.keys.length + 2, // Categories + Favorites + Recent
      vsync: this,
    );
    _loadFavorites();
    _loadRecents();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _loadFavorites() async {
    final favorites = await _widgetService.getFavoriteWidgets();
    setState(() {
      _favoriteWidgets = favorites;
    });
  }

  Future<void> _loadRecents() async {
    final recents = await _widgetService.getRecentlyViewedWidgets();
    setState(() {
      _recentWidgets = recents;
    });
  }

  Future<void> _toggleFavorite(String widgetName) async {
    await _widgetService.toggleFavorite(widgetName);
    await _loadFavorites();
  }

  void _navigateToWidgetDetail(FlutterWidgetModel widget) async {
    await _widgetService.addToRecentlyViewed(widget.name);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => WidgetDetailPage(
              widget: widget,
              isFavorite: _favoriteWidgets.contains(widget.name),
              onToggleFavorite: () => _toggleFavorite(widget.name),
            ),
      ),
    ).then((_) => _loadRecents());
  }

  List<FlutterWidgetModel> _getFilteredWidgets(
    List<FlutterWidgetModel> widgets,
  ) {
    if (_searchQuery.isEmpty) return widgets;

    return widgets
        .where(
          (widget) =>
              widget.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
              widget.description.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ||
              widget.properties.any(
                (prop) =>
                    prop.toLowerCase().contains(_searchQuery.toLowerCase()),
              ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> categories = _widgetsByCategory.keys.toList();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade100, Colors.white],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              _buildHeader(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildSearchBar(),
              ),
              const SizedBox(height: 16),
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  const Tab(text: 'Favorites'),
                  const Tab(text: 'Recent'),
                  ...categories.map((category) => Tab(text: category)).toList(),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // Favorites Tab
                    _buildFavoritesTab(),
                    // Recent Tab
                    _buildRecentTab(),
                    // Category Tabs
                    ...categories
                        .map((category) => _buildCategoryTab(category))
                        .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Icon(Icons.widgets, size: 36, color: Colors.blue),
          const SizedBox(width: 12),
          const Text(
            'Flutter Widget Gallery',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
                if (!_isSearching) {
                  _searchQuery = '';
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    if (!_isSearching) return const SizedBox.shrink();

    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Search widgets...',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
      onChanged: (value) {
        setState(() {
          _searchQuery = value;
        });
      },
    );
  }

  Widget _buildFavoritesTab() {
    if (_favoriteWidgets.isEmpty) {
      return _buildEmptyState(
        'No Favorite Widgets Yet',
        'Add widgets to your favorites by tapping the heart icon.',
        Icons.favorite_border,
      );
    }

    final List<FlutterWidgetModel> favoriteWidgetModels =
        allWidgets
            .where((widget) => _favoriteWidgets.contains(widget.name))
            .toList();

    final filteredWidgets = _getFilteredWidgets(favoriteWidgetModels);

    if (filteredWidgets.isEmpty && _searchQuery.isNotEmpty) {
      return _buildEmptyState(
        'No Results Found',
        'Try a different search term.',
        Icons.search_off,
      );
    }

    return _buildWidgetGrid(filteredWidgets);
  }

  Widget _buildRecentTab() {
    if (_recentWidgets.isEmpty) {
      return _buildEmptyState(
        'No Recently Viewed Widgets',
        'Widgets you view will appear here.',
        Icons.history,
      );
    }

    final List<FlutterWidgetModel> recentWidgetModels =
        _recentWidgets
            .map(
              (name) => allWidgets.firstWhere(
                (w) => w.name == name,
                orElse: () => allWidgets.first,
              ),
            )
            .toList();

    final filteredWidgets = _getFilteredWidgets(recentWidgetModels);

    if (filteredWidgets.isEmpty && _searchQuery.isNotEmpty) {
      return _buildEmptyState(
        'No Results Found',
        'Try a different search term.',
        Icons.search_off,
      );
    }

    return _buildWidgetGrid(filteredWidgets);
  }

  Widget _buildCategoryTab(String category) {
    final List<FlutterWidgetModel> categoryWidgets =
        _widgetsByCategory[category] ?? [];
    final filteredWidgets = _getFilteredWidgets(categoryWidgets);

    if (filteredWidgets.isEmpty) {
      return _buildEmptyState(
        'No Results Found',
        'Try a different search term.',
        Icons.search_off,
      );
    }

    return _buildWidgetGrid(filteredWidgets);
  }

  Widget _buildWidgetGrid(List<FlutterWidgetModel> widgets) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: widgets.length,
      itemBuilder: (context, index) {
        final widget = widgets[index];
        final isFavorite = _favoriteWidgets.contains(widget.name);

        return GestureDetector(
          onTap: () => _navigateToWidgetDetail(widget),
          child: _buildWidgetCard(widget, isFavorite),
        );
      },
    );
  }

  Widget _buildWidgetCard(FlutterWidgetModel widget, bool isFavorite) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Center(
                    child: Icon(
                      _getCategoryIcon(widget.category),
                      size: 60,
                      color: _getCategoryColor(widget.category),
                    ),
                  ),
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  widget.category,
                  style: TextStyle(
                    fontSize: 12,
                    color: _getCategoryColor(widget.category),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
              onTap: () => _toggleFavorite(widget.name),
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState(String title, String message, IconData icon) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ],
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
