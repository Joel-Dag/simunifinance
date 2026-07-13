import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/common_widgets/index.dart';
import '../providers/budget_provider.dart';

class BudgetScreen extends ConsumerWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(budgetStatusProvider);
    
    return Scaffold(
      backgroundColor: const Color(0xFF0D0E12),
      appBar: AppBar(title: const Text('Budget Control'), backgroundColor: Colors.transparent),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            GlassCard(
              child: Column(
                children: [
                  const Text('Monthly Consumption', style: TextStyle(color: Colors.white60)),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    backgroundColor: Colors.white10,
                    color: progress > 0.8 ? Colors.redAccent : const Color(0xFF00E676),
                    minHeight: 12,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  const SizedBox(height: 8),
                  Text('${(progress * 100).toInt()}% of limit used', 
                       style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Here you can add Category breakdown cards...
          ],
        ),
      ),
    );
  }
}