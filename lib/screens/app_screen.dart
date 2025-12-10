import 'package:apetit/screens/category_screen.dart';
import 'package:apetit/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final List<Widget> _screens = const [
    CategoryScreen(),
    FavoriteScreen()
  ];

  int _selectedScreenIndex = 0;
  String _appBarTitle = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if(_selectedScreenIndex == 0){
      _appBarTitle = CategoryScreen.title;
    } else if(_selectedScreenIndex == 1){
      _appBarTitle = FavoriteScreen.title;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_appBarTitle),
      ),
      body: _screens[_selectedScreenIndex],
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