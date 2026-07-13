import 'package:flutter/widgets.dart';
import 'colors.dart';

class SimuniTypography {
  SimuniTypography._();

  static const String fontPackage = 'Inter';

  static const TextStyle netWorthDisplay = TextStyle(
    fontFamily: fontPackage,
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    color: SimuniColors.textPrimary,
    letterSpacing: -1.0,
    height: 1.1,
  );

  static const TextStyle sectionHeading = TextStyle(
    fontFamily: fontPackage,
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: SimuniColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: fontPackage,
    fontSize: 18.0,
    fontWeight: FontWeight.w600, // Fixed: Explicit w600 weight instead of semibold
    color: SimuniColors.textPrimary,
    letterSpacing: -0.2,
  );

  static const TextStyle bodyPrimary = TextStyle(
    fontFamily: fontPackage,
    fontSize: 15.0,
    fontWeight: FontWeight.w500, // Fixed: Explicit w500 weight instead of medium
    color: SimuniColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle bodySecondary = TextStyle(
    fontFamily: fontPackage,
    fontSize: 14.0,
    fontWeight: FontWeight.w400, // Fixed: Explicit w400 weight instead of regular
    color: SimuniColors.textSecondary,
    height: 1.4,
  );

  static const TextStyle captionMuted = TextStyle(
    fontFamily: fontPackage,
    fontSize: 12.0,
    fontWeight: FontWeight.w400, // Fixed: Explicit w400 weight instead of regular
    color: SimuniColors.textMuted,
    letterSpacing: 0.1,
  );

  static const TextStyle transactionRef = TextStyle(
    fontFamily: fontPackage,
    fontSize: 11.0,
    fontWeight: FontWeight.w500,
    color: SimuniColors.textMuted,
    letterSpacing: 0.5,
  );
}