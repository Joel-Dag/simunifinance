import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../sms_engine/providers/transaction_provider.dart';

final monthlyLimitProvider = StateProvider<double>((ref) => 10000.0); // Default limit

final budgetStatusProvider = Provider<double>((ref) {
  final transactions = ref.watch(transactionsProvider).value ?? [];
  final limit = ref.watch(monthlyLimitProvider);
  
  // Sum up all expenses (non-deposits)
  final totalSpent = transactions
      .where((tx) => !tx.transactionType.toLowerCase().contains('deposit'))
      .fold(0.0, (sum, tx) => sum + tx.amount);
      
  return totalSpent / limit; // Returns 0.0 to 1.0+
});