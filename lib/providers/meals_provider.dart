import 'package:apetit/data/dummy_data.dart';
import 'package:apetit/models/food_category.dart';
import 'package:apetit/models/food_meal.dart';
import 'package:apetit/providers/filters_provider.dart';

class MealsProvider{
  final List<FoodMeal> _meals = dummyMeals;

  List<FoodMeal> get allMeals => _meals;

  List<FoodMeal> getCategoryMeals(FoodCategory category){
    return _meals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
  }

  List<FoodMeal> getFilteredMeals(Map<Filter, bool> filters){
    return _meals.where((meal) {
      if ((filters[Filter.glutenFree]! && !meal.isGlutenFree) ||
          (filters[Filter.lactoseFree]! && !meal.isLactoseFree) ||
          (filters[Filter.veganFree]! && !meal.isVegan) ||
          (filters[Filter.vegetarian]! && !meal.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();
  }

  List<FoodMeal> getFilteredCategoryMeals(FoodCategory category, Map<Filter, bool> filters){
    return getCategoryMeals(category).where((meal) {
      if ((filters[Filter.glutenFree]! && !meal.isGlutenFree) ||
          (filters[Filter.lactoseFree]! && !meal.isLactoseFree) ||
          (filters[Filter.veganFree]! && !meal.isVegan) ||
          (filters[Filter.vegetarian]! && !meal.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();
  }

}