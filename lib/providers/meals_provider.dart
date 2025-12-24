import 'package:apetit/data/dummy_data.dart';
import 'package:apetit/models/food_category.dart';
import 'package:apetit/models/food_meal.dart';
import 'package:apetit/providers/filters_provider.dart';

class MealsProvider{
  MealsProvider({required this.selectedFilters});
  
  final Map<Filter, bool> selectedFilters;
  final List<FoodMeal> _meals = dummyMeals;

  List<FoodMeal> get allMeals => _meals;

  List<FoodMeal> getCategoryMeals(FoodCategory category){
    return _meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
  }

  List<FoodMeal> getFilteredCategoryMeals(FoodCategory category){
    return getCategoryMeals(category).where((meal) {
      if ((selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) ||
          (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) ||
          (selectedFilters[Filter.vegan]! && !meal.isVegan) ||
          (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();
  }

}