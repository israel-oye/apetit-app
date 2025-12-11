import 'package:apetit/models/food_category.dart';
import 'package:flutter/material.dart';

class CategoryListItem extends StatelessWidget {
  const CategoryListItem({
    super.key, 
    required this.category,
    required this.onSelectCategory,
  });

  final FoodCategory category;
  final VoidCallback onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(6),
      onTap: onSelectCategory,
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