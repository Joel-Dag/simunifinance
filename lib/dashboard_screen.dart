import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/common_widgets/index.dart';
import 'features/sms_engine/providers/transaction_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the real-time stream of transactions and the calculated balance
    final transactionsAsync = ref.watch(transactionsProvider);
    final totalBalance = ref.watch(totalBalanceProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0D0E12),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 1. Hero Header
            SliverToBoxAdapter(
              child: _buildHeroHeader(totalBalance),
            ),
            
            // 2. Action Grid
            SliverToBoxAdapter(child: _buildActionGrid()),

            // 3. Transactions Feed Section
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(24, 32, 24, 16),
              sliver: SliverToBoxAdapter(
                child: Text('Recent Transactions', 
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
            
            // 4. Real Data List
            transactionsAsync.when(
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator(color: Color(0xFF00E676))),
              ),
              error: (err, stack) => SliverToBoxAdapter(
                child: Center(child: Text('Error: $err', style: const TextStyle(color: Colors.red))),
              ),
              data: (transactions) {
                if (transactions.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Text('No transactions yet.', textAlign: TextAlign.center, style: TextStyle(color: Colors.white30)),
                    ),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final tx = transactions[index];
                        final isDeposit = tx.transactionType.toLowerCase().contains('deposit');
                        
                        return GlassCard(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          margin: const EdgeInsets.only(bottom: 12),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: isDeposit ? Colors.green.withValues(alpha: 0.1) : Colors.red.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                isDeposit ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                                color: isDeposit ? Colors.green : Colors.red,
                              ),
                            ),
                            title: Text(tx.sender, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                            subtitle: Text(tx.timestamp.toString().substring(0, 16), style: const TextStyle(color: Colors.white38, fontSize: 12)),
                            trailing: Text(
                              '${isDeposit ? '+' : '-'} ETB ${tx.amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                color: isDeposit ? Colors.green : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                      childCount: transactions.length,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroHeader(double balance) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Total Balance', style: TextStyle(color: Colors.white38, fontSize: 14)),
          const SizedBox(height: 4),
          Text('ETB ${balance.toStringAsFixed(2)}', 
               style: const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: -1)),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(child: SimuniButton(label: 'Transfer', onPressed: () {})),
              const SizedBox(width: 12),
              Expanded(child: SimuniButton(label: 'Budget', onPressed: () {}, isPrimary: false)),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildActionGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildGridItem(Icons.analytics_rounded, 'Analytics'),
          _buildGridItem(Icons.wallet_rounded, 'Wallet'),
          _buildGridItem(Icons.account_balance_rounded, 'Banks'),
        ],
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.05), borderRadius: BorderRadius.circular(16)),
          child: Icon(icon, color: const Color(0xFF00E676)),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12)),
      ],
    );
  }
}