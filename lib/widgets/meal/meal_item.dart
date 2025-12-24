import 'package:apetit/models/food_meal.dart';
import 'package:apetit/providers/favorites_provider.dart';
import 'package:apetit/widgets/meal/meal_image.dart';
import 'package:apetit/widgets/meal/meal_item_meta_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealItem extends StatelessWidget {
  final FoodMeal meal;
  final void Function(FoodMeal) onSelectMeal;

  const MealItem({
      super.key,
      required this.meal,
      required this.onSelectMeal
    });

  @override
  Widget build(BuildContext context) {
    return _buildUI(context);
  }

  Widget _buildUI(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () {
          onSelectMeal(meal);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            MealImage(imageUrl: meal.imageUrl),
            Positioned(
              bottom: -6,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.shadow.withAlpha(170),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      meal.title,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealItemMetaInfo(
                          label: '${meal.duration} mins',
                          icon: Icons.timer,
                        ),
                        const SizedBox(width: 16),
                        MealItemMetaInfo(
                          label: meal.complexity.name,
                          icon: Icons.work,
                        ),
                        const SizedBox(width: 16),
                        MealItemMetaInfo(
                          label: meal.affordability.name,
                          icon: Icons.attach_money,
                          width: 4,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 0,
              child: Consumer<FavoritesProvider>(
                builder: (ctx, provider, _) => IconButton(
                  onPressed: () {
                    if (provider.favorites.contains(meal)){
                      provider.removeFavorite(meal);
                      _displayFavoritingMessage(context, meal.title, isAdding: false);
                    } else {
                      provider.addFavorite(meal);
                      _displayFavoritingMessage(context, meal.title);
                    }
                  },
                  icon: Icon(
                    provider.favorites.contains(meal)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 36,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _displayFavoritingMessage(BuildContext context, String mealName, {bool isAdding = true}){
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(
      SnackBar(
        content: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: isAdding ? 'Added' : 'Removed'),
              TextSpan(
                text: ' $mealName ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '${isAdding ? 'to' : 'from'} favorites')
            ],
          ),
        ),
      ),
    );
  }
}