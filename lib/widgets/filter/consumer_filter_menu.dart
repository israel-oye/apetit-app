import 'package:apetit/providers/filters_provider.dart';
import 'package:apetit/widgets/filter/filter_menu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConsumerFilterMenu extends StatelessWidget {
  ConsumerFilterMenu({
    super.key,
    required this.menuName,
    String? description,
    required this.filter,
  }): menuDescription = description ?? "Include ${menuName.toLowerCase()} meals";

  final String menuName;
  final String menuDescription;
  final Filter filter;

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersProvider>(
      builder:(context, provider, _){
        final currentFilters = provider.filters;
        return FilterMenu(
          menuName: menuName, 
          menuDescription: menuDescription,
          isFilterSet: currentFilters[filter]!,
          onChanged: (isChecked){
            provider.setFilter(filter, isChecked);
          }
        );
      },
    );
  }
}