import 'package:flutter/foundation.dart';

class FavoriteManager extends ChangeNotifier {
  static final FavoriteManager _instance = FavoriteManager._internal();
  factory FavoriteManager() => _instance;
  FavoriteManager._internal();

  final List<Map<String, dynamic>> _favoriteRecipes = [];

  List<Map<String, dynamic>> get favoriteRecipes => List.unmodifiable(_favoriteRecipes);

  bool isFavorite(String title) {
    return _favoriteRecipes.any((recipe) => recipe['title'] == title);
  }

  void toggleFavorite(Map<String, dynamic> recipe) {
    final index = _favoriteRecipes.indexWhere((r) => r['title'] == recipe['title']);

    if (index >= 0) {
      _favoriteRecipes.removeAt(index);
    } else {
      _favoriteRecipes.add(recipe);
    }

    notifyListeners();
  }

  void addFavorite(Map<String, dynamic> recipe) {
    if (!isFavorite(recipe['title'] ?? '')) {
      _favoriteRecipes.add(recipe);
      notifyListeners();
    }
  }

  void removeFavorite(String title) {
    _favoriteRecipes.removeWhere((recipe) => recipe['title'] == title);
    notifyListeners();
  }
}
