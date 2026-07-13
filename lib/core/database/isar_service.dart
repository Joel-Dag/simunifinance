import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../../features/sms_engine/domain/models/transaction_model.dart';
import '../../features/sms_engine/domain/models/bank_connection_model.dart';


class IsarService {
  IsarService._();
  static final IsarService instance = IsarService._();

  Isar? _isarInstance;

  Isar get db {
    if (_isarInstance == null) {
      throw StateError('Isar Service has not been initialized.');
    }
    return _isarInstance!;
  }

  Future<void> init() async {
    if (_isarInstance != null) return;

    final dir = await getApplicationDocumentsDirectory();

    _isarInstance = await Isar.open(
      [
        TransactionModelSchema,
        BankConnectionModelSchema,
        // 2. Add the schema here
        // CategoryRuleSchema, 
      ],
      directory: dir.path,
      name: 'simuni_secure_vault',
    );
  }

  Future<void> clearAllData() async {
    if (_isarInstance == null) return;
    await db.writeTxn(() => db.clear());
  }
}