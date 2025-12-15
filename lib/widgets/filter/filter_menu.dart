import 'package:flutter/material.dart';

class FilterMenu extends StatelessWidget {
  const FilterMenu({
    super.key,
    required this.menuName,
    required this.menuDescription,
    required this.filterSet,
    required this.onChanged,
  });

  final bool filterSet;
  final String menuName;
  final String menuDescription;
  final void Function(bool newValue) onChanged;

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);

    return SwitchListTile(
      contentPadding: const EdgeInsets.only(left: 24, right: 36),
      value: filterSet,
      onChanged: onChanged,
      title: Text(
        menuName,
        style: appTheme.textTheme.titleLarge!.copyWith(
          color: appTheme.colorScheme.onSurface,
        ),
      ),
      subtitle: Text(
        menuDescription,
        style: appTheme.textTheme.labelMedium!.copyWith(
          color: appTheme.colorScheme.tertiary,
        ),
      ),
    );
  }
}