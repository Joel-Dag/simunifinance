import 'package:isar/isar.dart';

part 'bank_connection_model.g.dart';

@collection
@Name('bank_conn')
class BankConnectionModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String bankName; // e.g., CBE, Dashen, Telebirr, Abyssinia
  
  late bool isConnected;
  late DateTime lastSyncedTimestamp;
  late int parsedMessageCount;
}