import 'package:flutter_riverpod/flutter_riverpod.dart';

enum OnboardingStep { welcome, permissions, historicalScan, completion }

class OnboardingState {
  final OnboardingStep currentStep;
  final bool hasSmsPermission;
  final double scanProgress; // 0.0 to 1.0
  final int discoveredTransactionsCount;
  final bool isScanning;

  OnboardingState({
    this.currentStep = OnboardingStep.welcome,
    this.hasSmsPermission = false,
    this.scanProgress = 0.0,
    this.discoveredTransactionsCount = 0,
    this.isScanning = false,
  });

  OnboardingState copyWith({
    OnboardingStep? currentStep,
    bool? hasSmsPermission,
    double? scanProgress,
    int? discoveredTransactionsCount,
    bool? isScanning,
  }) {
    return OnboardingState(
      currentStep: currentStep ?? this.currentStep,
      hasSmsPermission: hasSmsPermission ?? this.hasSmsPermission,
      scanProgress: scanProgress ?? this.scanProgress,
      discoveredTransactionsCount: discoveredTransactionsCount ?? this.discoveredTransactionsCount,
      isScanning: isScanning ?? this.isScanning,
    );
  }
}

class OnboardingNotifier extends StateNotifier<OnboardingState> {
  OnboardingNotifier() : super(OnboardingState());

  void nextStep() {
    final nextIndex = state.currentStep.index + 1;
    if (nextIndex < OnboardingStep.values.length) {
      state = state.copyWith(currentStep: OnboardingStep.values[nextIndex]);
    }
  }

  void previousStep() {
    final prevIndex = state.currentStep.index - 1;
    if (prevIndex >= 0) {
      state = state.copyWith(currentStep: OnboardingStep.values[prevIndex]);
    }
  }

  void updatePermission(bool granted) {
    state = state.copyWith(hasSmsPermission: granted);
  }

  /// Simulates a premium, fluid scan of the local SMS inbox
  Future<void> startInboxScan() async {
    state = state.copyWith(isScanning: true, scanProgress: 0.0, discoveredTransactionsCount: 0);
    
    // Simulate steps for a buttery smooth 60fps UI experience
    for (int i = 1; i <= 100; i++) {
      await Future.delayed(const Duration(milliseconds: 30));
      state = state.copyWith(
        scanProgress: i / 100,
        discoveredTransactionsCount: (i * 2.4).round(), // Simulating found items over time
      );
    }
    
    state = state.copyWith(isScanning: false);
    nextStep(); // Advance to completion view automatically
  }
}

final onboardingProvider = StateNotifierProvider<OnboardingNotifier, OnboardingState>((ref) {
  return OnboardingNotifier();
});