import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'isar_service.dart';

/// Provider to access the active Isar instance anywhere across Simuni
final isarProvider = Provider<Isar>((ref) {
  return IsarService.instance.db;
});