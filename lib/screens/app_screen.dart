import 'package:apetit/pages/categories_page.dart';
import 'package:apetit/pages/favorite_page.dart';
import 'package:apetit/screens/filter_screen.dart';
import 'package:apetit/widgets/drawer/main_drawer.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {

  int _selectedScreenIndex = 0;
  String _appBarTitle = '';

  void _goToNavPage(String navLabel) async {
    if (navLabel == 'Meals'){
      setState(() => _selectedScreenIndex = 0);
    } else{
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const FilterScreen(),
        ),
      );
      setState(() => _selectedScreenIndex = 0);
    }
  }

  @override
  Widget build(BuildContext context) {

    final Widget currentScreen = _selectedScreenIndex == 0
        ? CategoriesPage()
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