import 'package:flutter/material.dart';

class MealDetailSection extends StatelessWidget {
  const MealDetailSection({
    super.key,
    required this.sectionHeading,
    required this.sectionItems,
  });

  final String sectionHeading;
  final List<String> sectionItems;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          sectionHeading, 
          style: theme.textTheme.headlineMedium!.copyWith(
            color: theme.colorScheme.primary,
            fontWeight: FontWeight.bold
          )
        ),
        SizedBox(height: 8),
        Column(
          children: sectionItems
              .map(
                (currentItem) => Text(
                  currentItem,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: theme.colorScheme.secondary,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
