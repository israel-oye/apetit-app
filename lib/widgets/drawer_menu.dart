import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key, required this.label, required this.icon, required this.onSelectMenu});

  final String label;
  final IconData icon;
  final void Function(String navLabel) onSelectMenu;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: (){
        Navigator.pop(context);
        onSelectMenu(label);
      },
      leading: Icon(icon, size: 24, color: theme.colorScheme.onSurface),
      title: Text(
        label,
        style: theme.textTheme.titleSmall!.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}
