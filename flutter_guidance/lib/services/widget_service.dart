import '../models/widget_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WidgetService {
  Future<void> toggleFavorite(String widgetName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final favorites = prefs.getStringList('favorite_widgets') ?? [];

      if (favorites.contains(widgetName)) {
        favorites.remove(widgetName);
      } else {
        favorites.add(widgetName);
      }

      await prefs.setStringList('favorite_widgets', favorites);
    } catch (e) {
      print('Error toggling favorite: $e');
    }
  }

  Future<List<String>> getFavoriteWidgets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList('favorite_widgets') ?? [];
    } catch (e) {
      print('Error getting favorite widgets: $e');
      return [];
    }
  }

  Future<void> addToRecentlyViewed(String widgetName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> recents = prefs.getStringList('recent_widgets') ?? [];

      if (recents.contains(widgetName)) {
        recents.remove(widgetName);
      }
      recents.insert(0, widgetName);

      if (recents.length > 10) {
        recents = recents.sublist(0, 10);
      }

      await prefs.setStringList('recent_widgets', recents);
    } catch (e) {
      print('Error adding to recently viewed: $e');
    }
  }

  Future<List<String>> getRecentlyViewedWidgets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList('recent_widgets') ?? [];
    } catch (e) {
      print('Error getting recently viewed widgets: $e');
      return [];
    }
  }
}
