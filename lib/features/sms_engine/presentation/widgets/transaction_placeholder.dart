import 'package:flutter/material.dart';

class TransactionPlaceholder extends StatelessWidget {
  const TransactionPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    // This looks exactly like your actual transaction item
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white, // Color doesn't matter, Shimmer will override it
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}