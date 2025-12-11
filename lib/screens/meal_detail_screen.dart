import 'package:apetit/models/food_meal.dart';
import 'package:apetit/widgets/meal_detail_section.dart';
import 'package:apetit/widgets/meal_image.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final FoodMeal meal;
  const MealDetailScreen({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
        ],
      ),
      body: ListView(
        children: [
          MealImage(imageUrl: meal.imageUrl, imageHeight: 400,),
          const SizedBox(height: 12,),
          MealDetailSection(
            sectionHeading: 'Ingredients',
            sectionItems: meal.ingredients,
          ),
          const SizedBox(height: 16,),
          MealDetailSection(
            sectionHeading: 'Steps', 
            sectionItems: meal.steps
          ),
      
        ],
      ),
    );
  }
}