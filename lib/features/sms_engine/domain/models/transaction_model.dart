import 'package:isar/isar.dart';

part 'transaction_model.g.dart';

@collection
@Name('tx_model')
class TransactionModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String referenceNumber; // Unique transaction reference string from bank SMS

  late double amount;
  late double balanceAfterTransaction;
  late DateTime timestamp;

  late String sender;
  late String receiver;
  late String rawSmsBody;

  @Index(type: IndexType.value)
  late String bankName; // e.g., CBE, Dashen, Telebirr

  @Index(type: IndexType.value)
  late String transactionType; // deposit, withdrawal, transfer, purchase, salary

  late String category; // food, transport, shopping, bills, income, uncategorized
  
  String? notes;
  String? accountNickname;
}