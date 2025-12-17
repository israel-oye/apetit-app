import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, veganFree, vegetarian }

Map<Filter, bool> kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.veganFree: false,
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