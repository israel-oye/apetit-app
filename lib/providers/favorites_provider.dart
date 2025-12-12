import 'package:apetit/models/food_meal.dart';
import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<FoodMeal> _favorites = [];

  List<FoodMeal> get favorites => _favorites;

  void addFavorite(FoodMeal meal){
    _favorites.add(meal);
    notifyListeners();
  }

  void removeFavorite(FoodMeal meal){
    _favorites.remove(meal);
    notifyListeners();
  }

  void restoreFavorite(int index, FoodMeal meal){
    _favorites.insert(index, meal);
    notifyListeners();
  }
}