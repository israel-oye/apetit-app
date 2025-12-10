import 'package:apetit/screens/app_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
            colors: [
              appTheme.colorScheme.primary,
              appTheme.colorScheme.primary.withAlpha(150),
            ],
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Opacity(
                opacity: 0.65,
                child: Image.asset('assets/images/burger.png')
                ),
              const SizedBox(height: 16),
              Text(
                'Apetit',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 72),
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: appTheme.colorScheme.onPrimary,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (ctx) => AppScreen()),
                    );
                  },
                  icon: const Icon(Icons.arrow_right_alt),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}