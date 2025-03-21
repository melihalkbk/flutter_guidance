// lib/services/widget_service.dart
import '../models/widget_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class WidgetService {
  // Widget'ların favorilere eklenip çıkarılmasını yöneten servis
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

  // Favorileri alma
  Future<List<String>> getFavoriteWidgets() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getStringList('favorite_widgets') ?? [];
    } catch (e) {
      print('Error getting favorite widgets: $e');
      return [];
    }
  }

  // Son görüntülenen widget'ları saklama
  Future<void> addToRecentlyViewed(String widgetName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      List<String> recents = prefs.getStringList('recent_widgets') ?? [];

      // Eğer zaten listede varsa kaldır (en başa ekleyeceğiz)
      if (recents.contains(widgetName)) {
        recents.remove(widgetName);
      }

      // En başa ekle
      recents.insert(0, widgetName);

      // Maksimum 10 widget tutalım
      if (recents.length > 10) {
        recents = recents.sublist(0, 10);
      }

      await prefs.setStringList('recent_widgets', recents);
    } catch (e) {
      print('Error adding to recently viewed: $e');
    }
  }

  // Son görüntülenen widget'ları alma
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
