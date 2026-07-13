import 'package:flutter/widgets.dart';

class SimuniTokens {
  SimuniTokens._();

  // 8-Point Spacing Grid
  static const double x4 = 4.0;
  static const double x8 = 8.0;
  static const double x12 = 12.0;
  static const double x16 = 16.0;
  static const double x24 = 24.0;
  static const double x32 = 32.0;
  static const double x40 = 40.0;
  static const double x48 = 48.0;
  static const double x64 = 64.0;

  // Premium Corner Radii
  static const double radiusSm = 12.0; // Small contextual buttons, mini badges
  static const double radiusMd = 16.0; // Standard interactive cards, bottom sheets
  static const double radiusLg = 24.0; // Large hero containers, wallet card layouts

  // Elevation Soft Shadows (Linear/Apple Style)
  static List<BoxShadow> elevationLow = [
    BoxShadow(
      color: const Color(0xFF000000).withAlpha(10),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> elevationCard = [
    BoxShadow(
      color: const Color(0xFF000000).withAlpha(40),
      blurRadius: 24,
      offset: const Offset(0, 8),
    ),
    BoxShadow(
      color: const Color(0xFF000000).withAlpha(20),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  // Screen Layout Breakpoints for Cross-Platform Adaptability
  static const double breakpointMobile = 480.0;
  static const double breakpointTablet = 768.0;
  static const double breakpointDesktop = 1024.0;

  // Structural Helper Utilities
  static bool isMobile(BuildContext context) =>
      MediaQuery.sizeOf(context).width < breakpointTablet;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return width >= breakpointTablet && width < breakpointDesktop;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= breakpointDesktop;
}