import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_provider.dart';
import '../domain/models/transaction_model.dart';

// Watches the Isar collection and streams updates automatically
final transactionsProvider = StreamProvider<List<TransactionModel>>((ref) {
  final db = ref.watch(isarProvider);
  return db.transactionModels
      .where()
      .sortByTimestampDesc()
      .watch(fireImmediately: true);
});

// Calculate the total balance dynamically from real data
final totalBalanceProvider = Provider<double>((ref) {
  final asyncTransactions = ref.watch(transactionsProvider);
  return asyncTransactions.maybeWhen(
    data: (transactions) {
      if (transactions.isEmpty) return 0.0;
      // Returns the balance of the most recent transaction
      return transactions.first.balanceAfterTransaction;
    },
    orElse: () => 0.0,
  );
});