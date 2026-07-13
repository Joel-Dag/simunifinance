import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SimuniLoadingIndicator extends StatelessWidget {
  final Widget child;

  const SimuniLoadingIndicator({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white10,      // Matches your GlassCard tint
      highlightColor: Colors.white24, // Subtle shimmer sweep
      child: child,
    );
  }
}