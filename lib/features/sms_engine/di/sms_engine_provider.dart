import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/database/isar_provider.dart';
import '../data/services/sms_parser_engine.dart';

final smsParserEngineProvider = Provider<SmsParserEngine>((ref) {
  final db = ref.watch(isarProvider);
  return SmsParserEngine(db);
});