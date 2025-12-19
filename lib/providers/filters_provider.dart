import 'package:flutter/material.dart';

enum Filter { 
  glutenFree("Gluten Free"), 
  lactoseFree("Lactose Free"), 
  vegan("Vegan"), 
  vegetarian("Vegetarian"); 
  
  final String name; 
  const Filter(this.name);
}

Map<Filter, bool> kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class FiltersProvider extends ChangeNotifier{
  final Map<Filter, bool> _filters = kInitialFilters;

  Map<Filter, bool> get filters => _filters;

  void setFilter(Filter filter, bool isActive){
    _filters.update(filter, (val)=> isActive, ifAbsent: ()=> false);

    notifyListeners();
  }
}