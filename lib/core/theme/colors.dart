import 'package:flutter/widgets.dart';

class SimuniColors {
  SimuniColors._();

  // Premium Dark Mode Foundation (Primary Canvas)
  static const Color obsidianBackground = Color(0xFF0F1012);
  static const Color surfaceElevated = Color(0xFF18191D);
  static const Color cardFill = Color(0xFF1E2025);
  static const Color borderSubtle = Color(0xFF2C2F36);

  // Core Typographic Neutrals
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E939E);
  static const Color textMuted = Color(0xFF535763);

  // Semantic Financial Accents
  static const Color emeraldGreen = Color(0xFF10B981); // Core Brand / Income Green
  static const Color expenseRed = Color(0xFFEF4444);   // Outflow / Debit Red
  static const Color warningOrange = Color(0xFFF59E0B); // Budgets exceeding limits
  static const Color savingsBlue = Color(0xFF3B82F6);    // Goals & Vault pools
  static const Color investmentPurple = Color(0xFF8B5CF6); // Long-term growth assets
  static const Color analyticsCyan = Color(0xFF06B6D4);   // Velocity tracking metrics
  static const Color premiumGold = Color(0xFFD97706);     // Premium tier features

  // Localized Platform Accents
  static const Color telebirrYellow = Color(0xFFFFCC00); // Telebirr structural identity

  // Soft Fluid Gradients (Linear UI Look)
  static const Gradient heroCardGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1E2025),
      Color(0xFF141518),
    ],
  );

  static const Gradient incomeGlowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x1010B981),
      Color(0x0010B981),
    ],
  );
}