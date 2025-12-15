import 'package:apetit/models/food_meal.dart';
import 'package:apetit/screens/meal_detail_screen.dart';
import 'package:apetit/widgets/meal/meal_item.dart';
import 'package:flutter/material.dart';

class MealCategoryScreen extends StatelessWidget {
  final String title;
  final List<FoodMeal> meals;

  const MealCategoryScreen({
    super.key,
    required this.title,
    required this.meals,
    });

  void selectMeal(BuildContext context, FoodMeal meal){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MealDetailScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: meals.isNotEmpty
          ? _buildSucessState(context)
          : _buildEmptyState(context),
    );
  }

  Widget _buildEmptyState(BuildContext context){
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.no_meals,
            size: 62,
            color: theme.colorScheme.secondary,
          ),
          SizedBox(height: 8),
          Text(
            'Umm...No meals here',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.secondary,
            ),
          ),
          Text(
            'Try checking another category or updating the filter',
            style: TextStyle(
              color: theme.colorScheme.secondaryFixed 
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSucessState(BuildContext context){
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (ctx, index) {
        return MealItem(
          meal: meals.elementAt(index),
          onSelectMeal: (meal){
            selectMeal(context, meal);
          },
        );
      },
    );
  }
}