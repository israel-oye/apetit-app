import 'package:apetit/providers/filters_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FiltersRow extends StatelessWidget {
  const FiltersRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FiltersProvider>(
      builder: (context, provider, child) {
        final activeFilters = provider.filters;
        return Row(
          spacing: 8,
          children: activeFilters.entries
              .map(
                (filterConfigEntry) => FilterChip(
                  selected: filterConfigEntry.value,
                  showCheckmark: false,
                  // selectedColor: Theme.of(context).colorScheme.tertiary,
                  shape: StadiumBorder(),
                  label: Text(filterConfigEntry.key.name),
                  onSelected: (isSelected) {
                    provider.setFilter(filterConfigEntry.key, isSelected);
                  },
                ),
              )
              .toList(),
        );
      },
    );
  }
}
