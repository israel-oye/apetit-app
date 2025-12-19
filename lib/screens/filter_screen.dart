import 'package:apetit/providers/filters_provider.dart';
import 'package:apetit/widgets/filter/consumer_filter_menu.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: Column(
        children: [
          ConsumerFilterMenu(
            menuName: 'Gluten-Free', 
            description: 'Include only gluten-free meals',
            filter: Filter.glutenFree
          ),
          ConsumerFilterMenu(
            menuName: 'Lactose-Tolerant',
            filter: Filter.lactoseFree
          ),
          ConsumerFilterMenu(
            menuName: 'Vegan',
            filter: Filter.vegan,
          ),
          ConsumerFilterMenu(
            menuName: 'Vegetarian',
            filter: Filter.vegetarian,
          ),
        ],
      ),
    );
  }
}

