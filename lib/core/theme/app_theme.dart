import 'package:flutter/material.dart';
import 'colors.dart';

class SimuniTheme {
  SimuniTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: SimuniColors.obsidianBackground,
      
      // Fixed: Using the correct CardThemeData type signature
      cardTheme: const CardThemeData(
        color: SimuniColors.cardFill,
        elevation: 0,
        margin: EdgeInsets.zero,
      ),

      splashColor: const Color(0xFFFFFFFF).withAlpha(12),
      highlightColor: const Color(0xFFFFFFFF).withAlpha(8),
      
      // Fixed: Replaced deprecated background with modern surface values
      colorScheme: const ColorScheme.dark(
        surface: SimuniColors.surfaceElevated,
        primary: SimuniColors.emeraldGreen,
        error: SimuniColors.expenseRed,
      ),
    );
  }
}