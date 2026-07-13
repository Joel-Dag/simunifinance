import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/database/isar_service.dart';
import 'core/theme/app_theme.dart';
// 1. Import your new onboarding screen
import 'features/onboarding/presentation/onboarding_screen.dart';

void main() async {
  // Ensure engine bindings are set up before loading async services
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the AES-256 local encrypted Isar database service
  await IsarService.instance.init();

  runApp(
    const ProviderScope(
      child: SimuniApp(),
    ),
  );
}

class SimuniApp extends StatelessWidget {
  const SimuniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simuni',
      debugShowCheckedModeBanner: false,
      theme: SimuniTheme.darkTheme,
      // 2. Wire the OnboardingScreen as the entry point
      home: const OnboardingScreen(),
    );
  }
}