import 'package:apetit/models/food_meal.dart';
import 'package:apetit/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static String title = 'Favorites';

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesProvider>(
      builder: (context, provider, child){
        return provider.favorites.isEmpty
        ? _buildEmptyState(context)
        : _buildSucessState(context, provider.favorites);
      },
    );
  }

  Widget _buildEmptyState(BuildContext context){
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.list_rounded,
            size: 62,
            color: theme.colorScheme.secondary,
          ),
          SizedBox(height: 8),
          Text(
            'Oops...No favorites here',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.secondary,
            ),
          ),
          Text(
            'Add a meal to favorites and it will show up here',
            style: TextStyle(
              color: theme.colorScheme.secondaryFixed 
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSucessState(BuildContext context, List<FoodMeal> favoriteMeals){
    return ListView.builder(
      itemCount: favoriteMeals.length,
      itemBuilder: (ctx, index) {
        final currentItem = favoriteMeals.elementAt(index);
        return ListTile(
          title: Text(currentItem.title),
          trailing: Consumer<FavoritesProvider>(
            builder: (ctx, provider, _) {
              return IconButton(
                onPressed: () async {
                  bool confirmDelete = await showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(
                        'Remove favorite',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      content: Text(
                        'Are you sure you want to remove ${currentItem.title} from favorites?',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          child: Text('Cancel'),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            foregroundColor: Colors.white,
                          ),
                          label: Text('Delete'),
                          icon: Icon(Icons.delete_rounded),
                        ),
                      ],
                    ),
                  );

                  if (confirmDelete) {
                    provider.removeFavorite(currentItem);
                    if (!context.mounted) return;                    
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Removed item from favorites'),
                        duration: Duration(milliseconds: 1200),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            provider.restoreFavorite(index, currentItem);
                          },
                        ),
                      ),
                    );
                  }
                },
                icon: Icon(
                  provider.favorites.contains(currentItem)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                )
              );
            },
          ),
        );
      },
    );
  }
}