import 'package:apetit/models/food_category.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key, 
    required this.category
  });

  final FoodCategory category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(6),
      // tileColor: Theme.of(context).colorScheme.inversePrimary.withBlue(6,
      leading: CircleAvatar(
        child: Icon(
          category.categoryIcon, 
          color: category.color,
        ),
      ),
      title: Text(category.title),
    );
  }
}