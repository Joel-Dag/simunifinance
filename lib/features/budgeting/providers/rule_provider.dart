import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import '../../../core/database/isar_provider.dart'; 
import '../domain/models/category_rule.dart';

String autoCategorize(String body) {
  final lower = body.toLowerCase();
  if (lower.contains('deposit') || lower.contains('salary')) return 'Income';
  return 'General';
}

final categoryLogicProvider = Provider((ref) {
  final rulesAsync = ref.watch(categoryRulesProvider);
  final List<CategoryRule> rules = rulesAsync.value ?? [];
  
  return (String sender, String body) {
    // Search using 'identifier'
    CategoryRule? matchedRule;
    for (final rule in rules) {
      if (body.contains(rule.identifier)) {
        matchedRule = rule;
        break;
      }
    }
    return matchedRule?.categoryName ?? autoCategorize(body);
  };
});

final categoryRulesProvider = StreamProvider<List<CategoryRule>>((ref) {
  final db = ref.watch(isarProvider);
  return db.categoryRules.where().watch(fireImmediately: true);
});

final categoryRuleServiceProvider = Provider((ref) => CategoryRuleService(ref));

class CategoryRuleService {
  final Ref ref;
  CategoryRuleService(this.ref);

  Future<void> addRule(String identifier, String category, bool isIncome) async {
    final db = ref.read(isarProvider);
    final newRule = CategoryRule()
      ..identifier = identifier // Corrected setter
      ..categoryName = category
      ..isIncome = isIncome;

    await db.writeTxn(() async {
      await db.categoryRules.put(newRule);
    });
  }
}