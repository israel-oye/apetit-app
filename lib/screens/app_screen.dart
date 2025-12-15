import 'package:apetit/data/dummy_data.dart';
import 'package:apetit/models/food_meal.dart';
import 'package:apetit/pages/categories_page.dart';
import 'package:apetit/pages/favorite_screen.dart';
import 'package:apetit/screens/filter_screen.dart';
import 'package:apetit/widgets/main_drawer.dart';
import 'package:flutter/material.dart';

const Map<Filter, bool> kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.veganFree: false,
  Filter.vegetarian: false,
};

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  int _selectedScreenIndex = 0;
  String _appBarTitle = '';
  Map<Filter, bool> _selectedFilters =  kInitialFilters;
  late List<FoodMeal> availableMeals;

  void _goToNavPage(String navLabel) async {
    if (navLabel == 'Meals'){
      setState(() => _selectedScreenIndex = 0);
    } else{
      final filters = await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (_) => FilterScreen(currentFilter: _selectedFilters),
        ),
      );
      setState(() {
        _selectedFilters = filters ?? kInitialFilters;
      });
    }
  }

  @override
  void initState() {
    availableMeals = dummyMeals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    availableMeals = dummyMeals.where((meal) {
      if ((_selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) ||
          (_selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) ||
          (_selectedFilters[Filter.veganFree]! && !meal.isVegan) ||
          (_selectedFilters[Filter.vegetarian]! && !meal.isVegetarian)) {
        return false;
      }
      return true;
    }).toList();
    
    final Widget currentScreen = _selectedScreenIndex == 0
        ? CategoriesPage(availableMeals: availableMeals)
        : const FavoritesPage();

    if(_selectedScreenIndex == 0){
      _appBarTitle = CategoriesPage.title;
    } else if(_selectedScreenIndex == 1){
      _appBarTitle = FavoritesPage.title;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      drawer: MainDrawer(onSelectNav: _goToNavPage,),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: (idx) {
          setState(() => _selectedScreenIndex = idx);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              _selectedScreenIndex == 0
                  ? Icons.category
                  : Icons.category_outlined,
            ), 
            label: 'Categories'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              _selectedScreenIndex == 1
                  ? Icons.favorite
                  : Icons.favorite_border_outlined,
            ),
            label: 'Favorites',
          ),
        ]
      ),

    );
  }
}