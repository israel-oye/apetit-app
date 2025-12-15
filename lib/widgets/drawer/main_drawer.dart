import 'package:apetit/widgets/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectNav});

  final void Function(String navLabel) onSelectNav;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                radius: 0.3,
                colors: <Color>[
                  theme.colorScheme.primaryContainer.withRed(120),
                  theme.colorScheme.primaryContainer,
                ],
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Image.asset(
                      'assets/images/burger-outline-on.png',
                      width: 72,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    'Apetit',
                    style: GoogleFonts.sniglet(
                      color: theme.colorScheme.onPrimaryContainer.withAlpha(
                        100,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          DrawerMenu(
            label: 'Meals',
            icon: Icons.fastfood_rounded,
            onSelectMenu: onSelectNav,
          ),
          DrawerMenu(
            label: 'Filter',
            icon: Icons.tune_rounded,
            onSelectMenu: onSelectNav,
          ),
        ],
      ),
    );
  }
}
