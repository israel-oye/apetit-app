import 'package:apetit/models/food_meal.dart';
import 'package:apetit/widgets/filter_menu.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFilter});

  final Map<Filter, bool> currentFilter;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late bool _glutenFreeFilterSet;
  late bool _lactoseFreeFilterSet;
  late bool _veganFilterSet;
  late bool _vegetarianFilterSet;

  @override
  void initState() {
    _glutenFreeFilterSet = widget.currentFilter[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilter[Filter.lactoseFree]!;
    _veganFilterSet = widget.currentFilter[Filter.veganFree]!;
    _vegetarianFilterSet = widget.currentFilter[Filter.vegetarian]!;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Map<Filter, bool> filterConfig = {
      Filter.glutenFree: _glutenFreeFilterSet,
      Filter.lactoseFree: _lactoseFreeFilterSet,
      Filter.veganFree: _veganFilterSet,
      Filter.vegetarian: _vegetarianFilterSet,
    };
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
          if (didPop) return;
          Navigator.pop(context, filterConfig);
        },
        child: Column(
          children: [
            FilterMenu(
              menuName: 'Gluten-Free',
              menuDescription: 'Include only gluten-free meals',
              filterSet: _glutenFreeFilterSet,
              onChanged: (isChecked){
                setState(() => _glutenFreeFilterSet = isChecked);
              },
            ),
            FilterMenu(
              menuName: 'Lactose-Tolerant',
              menuDescription: 'Include only lactose-free meals',
              filterSet: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() => _lactoseFreeFilterSet = isChecked);
              },
            ),
            FilterMenu(
              menuName: 'Vegan',
              menuDescription: 'Include only vegan meals',
              filterSet: _veganFilterSet,
              onChanged: (isChecked) {
                setState(() => _veganFilterSet = isChecked);
              },
            ),
            FilterMenu(
              menuName: 'Vegetarian',
              menuDescription: 'Include only vegetarian meals',
              filterSet: _vegetarianFilterSet,
              onChanged: (isChecked) {
                setState(() => _vegetarianFilterSet = isChecked);
              },
            ),
          ],
        ),
      ),
    );
  }
}

