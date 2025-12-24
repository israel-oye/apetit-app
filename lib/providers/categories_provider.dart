import 'package:apetit/data/dummy_data.dart';
import 'package:apetit/models/food_category.dart';

class CategoriesProvider{
  final List<FoodCategory> _categories = dummyCategories;

  List<FoodCategory> get categories => _categories;
}