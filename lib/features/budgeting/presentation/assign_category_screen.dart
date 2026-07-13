import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simuni/features/budgeting/providers/rule_provider.dart';
import '../../../core/common_widgets/index.dart';

class AssignCategoryScreen extends ConsumerStatefulWidget {
  final String sender;

  const AssignCategoryScreen({super.key, required this.sender});

  @override
  ConsumerState<AssignCategoryScreen> createState() => _AssignCategoryScreenState();
}

class _AssignCategoryScreenState extends ConsumerState<AssignCategoryScreen> {
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _patternController = TextEditingController();
  bool _isIncome = false;

  @override
  void initState() {
    super.initState();
    _patternController.text = widget.sender;
  }

  @override
  void dispose() {
    _categoryController.dispose();
    _patternController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0E12),
      appBar: AppBar(
        title: const Text('Add Categorization Rule'), 
        backgroundColor: Colors.transparent
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _patternController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Pattern to Match (e.g., 0911)', 
                labelStyle: TextStyle(color: Colors.white38)
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _categoryController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Category Name (e.g., Sales)', 
                labelStyle: TextStyle(color: Colors.white38)
              ),
            ),
            SwitchListTile(
              title: const Text('Is this Income?', style: TextStyle(color: Colors.white)),
              value: _isIncome,
              onChanged: (val) => setState(() => _isIncome = val),
            ),
            const SizedBox(height: 24),
            SimuniButton(
              label: 'Save Rule',
              onPressed: () async {
                // 1. Perform the async operation
                await ref.read(categoryRuleServiceProvider).addRule(
                  _patternController.text, 
                  _categoryController.text, 
                  _isIncome
                );

                // 2. Clear, explicit mounted check
                if (!mounted) return;
                
                // 3. Final navigation
                // ignore: use_build_context_synchronously
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}