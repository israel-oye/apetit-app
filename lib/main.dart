import 'package:apetit/providers/categories_provider.dart';
import 'package:apetit/providers/favorites_provider.dart';
import 'package:apetit/providers/filters_provider.dart';
import 'package:apetit/providers/meals_provider.dart';
import 'package:apetit/screens/title_screen.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
  ),
  textTheme: GoogleFonts.figtreeTextTheme(),
);

void main() {
  runApp(const ApetitApp());
}

class ApetitApp extends StatelessWidget {
  const ApetitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CategoriesProvider>(create: (_)=> CategoriesProvider()),
        ChangeNotifierProvider(create: (_)=> FavoritesProvider()),
        ChangeNotifierProvider(create: (_)=> FiltersProvider()),
        ProxyProvider<FiltersProvider, MealsProvider>(
          update: (context, filtersProvider, prev) {
            if (prev != null && prev.selectedFilters == filtersProvider.filters){
              return prev;
            }
            return MealsProvider(selectedFilters: filtersProvider.filters);
          },
        ),
        
      ],
      child: MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: const TitleScreen()
      ),
    );
  }
}