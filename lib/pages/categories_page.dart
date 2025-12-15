import 'package:apetit/data/dummy_data.dart';
import 'package:apetit/models/food_category.dart';
import 'package:apetit/models/food_meal.dart';
import 'package:apetit/screens/meal_category_screen.dart';
import 'package:apetit/widgets/category/category_grid_item.dart';
import 'package:apetit/widgets/category/category_list_item.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key, required this.availableMeals});

  final List<FoodMeal> availableMeals;
  static String title = 'Categories';

  @override
  State<CategoriesPage> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoriesPage> {
  final allCategories = dummyCategories;

  bool _isListLayout = false;

  void _selectCategory(FoodCategory category){
    List<FoodMeal> categoryMeals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_)=> MealCategoryScreen(
          title: category.title, 
          meals: categoryMeals
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentGeometry.centerRight,
          child: TextButton.icon(
            onPressed: (){
              setState(() {
                _isListLayout = !_isListLayout;
              });
            },
            icon: Icon(_isListLayout? Icons.grid_view_rounded : Icons.list),
            label: Text(_isListLayout? 'Grid' : 'List')),
        ),
        Expanded(
          child: _isListLayout
              ? _buildListLayout(context)
              : _buildGridLayout(context),
        )
      ],
    );
  }

  Widget _buildGridLayout(BuildContext context){
    return GridView.builder(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        crossAxisSpacing: 16,
        mainAxisSpacing: 20
      ),
      itemCount: allCategories.length,
      itemBuilder: (context, index){
        final currentCategory = allCategories[index];
        return CategoryGridItem(
          category: currentCategory,
          onSelectCategory: () {
            _selectCategory(currentCategory);
          },
        );
      },
    );
  }

  Widget _buildListLayout(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inversePrimary.withAlpha(50),
          borderRadius: BorderRadius.circular(8)
        ),
        child: ListView.separated(
          itemCount: allCategories.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (ctx, idx){
            final currentCategory = allCategories[idx];
            return CategoryListItem(
              category: currentCategory,
              onSelectCategory: () {
                _selectCategory(currentCategory);
              },
            );
          }
        ),
      ),
    );
  }
}