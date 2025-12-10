import 'package:apetit/models/food_category.dart';
import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  final FoodCategory category;

  const CategoryGridItem({
      super.key, 
      required this.category
    });

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    final brightness = ThemeData.estimateBrightnessForColor(category.color);
    final textColor = brightness == Brightness.dark
        ? appTheme.colorScheme.onSurface
        : appTheme.colorScheme.onInverseSurface;

    return InkWell(
      onTap: (){
        print(category.title);
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [
              category.color.withAlpha(150),
              category.color.withAlpha(200)
            ]
          )
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              category.title,
              style: appTheme.textTheme.titleMedium!.copyWith(
                color: textColor,
              ),
            ),
            SizedBox(width: 6,),
            Icon(
              category.categoryIcon, 
              size: 16,
              color: textColor,
              )
          ],
        ),
      ),
    );
  }
}