import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:permission_handler/permission_handler.dart';
import '../providers/onboarding_provider.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(onboardingProvider);
    final notifier = ref.read(onboardingProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0E12), // Deep premium dark background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top Step Progress Indicator Row
              _buildHeaderProgress(state.currentStep),
              const SizedBox(height: 40),

              // Animated Wizard Body Switcher
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: _buildStepContent(state, notifier),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderProgress(OnboardingStep currentStep) {
    return Row(
      children: OnboardingStep.values.map((step) {
        final isCompleted = step.index < currentStep.index;
        final isActive = step == currentStep;
        return Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            height: 4,
            decoration: BoxDecoration(
              color: isCompleted
                  ? const Color(0xFF00E676) // Vibrant green signature accent
                  : isActive
                      ? Colors.white
                      : Colors.white10,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildStepContent(OnboardingState state, OnboardingNotifier notifier) {
    switch (state.currentStep) {
      case OnboardingStep.welcome:
        return Column(
          key: const ValueKey('welcome'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.auto_graph_rounded, size: 80, color: Color(0xFF00E676))
                .animate()
                .fade(duration: 500.ms)
                .scale(delay: 200.ms),
            const SizedBox(height: 32),
            const Text(
              'Financial Intelligence,\nOffline First.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, letterSpacing: -0.5, color: Colors.white),
            ),
            const SizedBox(height: 16),
            const Text(
              'Simuni transforms your transaction SMS into clean, intelligent operational insights without touching the cloud.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.white60, height: 1.4),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: notifier.nextStep,
              child: const Text('Get Started', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );

      case OnboardingStep.permissions:
        return Column(
          key: const ValueKey('permissions'),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.security_rounded, size: 70, color: Colors.white30),
            const SizedBox(height: 24),
            const Text(
              'Permission Handshake',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            const Text(
              'To automatically map your bank entries from CBE, Dashen, or Telebirr, Simuni requires permission to safely read inbound shortcodes.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.white54, height: 1.4),
            ),
            const SizedBox(height: 40),
            
            // Tactile Custom Row Box
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.03),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.sms_outlined, color: Color(0xFF00E676)),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SMS Read Permissions', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                        Text('Only local parsed bank alerts', style: TextStyle(fontSize: 12, color: Colors.white38)),
                      ],
                    ),
                  ),
                  Switch(
                    value: state.hasSmsPermission,
                    activeThumbColor: const Color(0xFF00E676),
                    onChanged: (val) async {
                      if (val) {
                        final res = await Permission.sms.request();
                        notifier.updatePermission(res.isGranted);
                      } else {
                        notifier.updatePermission(false);
                      }
                    },
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                TextButton(onPressed: notifier.previousStep, child: const Text('Back', style: TextStyle(color: Colors.white38))),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: state.hasSmsPermission ? const Color(0xFF00E676) : Colors.white10,
                    foregroundColor: state.hasSmsPermission ? Colors.black : Colors.white30,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: state.hasSmsPermission ? notifier.nextStep : null,
                  child: const Text('Continue', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            )
          ],
        );

      case OnboardingStep.historicalScan:
        return Column(
          key: const ValueKey('historicalScan'),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Reconstructing Your Vault',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              state.isScanning ? 'Analyzing historical device transactions...' : 'Ready to index inbox telemetry.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.white38),
            ),
            const SizedBox(height: 48),

            // Scanning Progress Meter Widget
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 160,
                    height: 160,
                    child: CircularProgressIndicator(
                      value: state.scanProgress,
                      strokeWidth: 6,
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00E676)),
                      backgroundColor: Colors.white10,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${(state.scanProgress * 100).toInt()}%',
                        style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        '${state.discoveredTransactionsCount} Found',
                        style: const TextStyle(fontSize: 12, color: Color(0xFF00E676), fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (!state.isScanning)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00E676),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: notifier.startInboxScan,
                child: const Text('Begin Local Scan', style: TextStyle(fontWeight: FontWeight.bold)),
              ),
          ],
        );

      case OnboardingStep.completion:
        return Column(
          key: const ValueKey('completion'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle_outline_rounded, size: 80, color: Color(0xFF00E676))
                .animate()
                .scale(duration: 400.ms, curve: Curves.elasticOut),
            const SizedBox(height: 24),
            const Text(
              'Vault Ready!',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              'Successfully ledgered ${state.discoveredTransactionsCount} entries. Your local engine is fully calibrated.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.white54, height: 1.4),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size.fromHeight(54),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                // Next milestone configuration hook: Navigate to Dashboard view
              },
              child: const Text('Enter Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
    }
  }
}