import 'package:isar/isar.dart';
import '../../domain/models/transaction_model.dart';
import '../parsers/base_sms_parser.dart';
import '../parsers/cbe_sms_parser.dart';
import '../parsers/telebirr_sms_parser.dart';

class SmsParserEngine {
  final Isar _db;
  final List<BaseSmsParser> _parsers = [
    CbeSmsParser(),
    TelebirrSmsParser(),
  ];

  SmsParserEngine(this._db);

  /// Central entry point to ingest incoming hardware SMS events
  Future<void> processIncomingSms(String rawBody, String senderAddress, DateTime timestamp) async {
    // Find matching strategy
    BaseSmsParser? matchingParser;
    for (final parser in _parsers) {
      if (parser.canParse(senderAddress)) {
        matchingParser = parser;
        break;
      }
    }

    // If it's an unrecognized SMS (like a personal text), discard silently
    if (matchingParser == null) return;

    // Run structural extraction
    final parsed = matchingParser.parse(rawBody, senderAddress, timestamp);

    // Map straight to our beautiful Isar Collection structure
    final transactionRecord = TransactionModel()
      ..referenceNumber = parsed.referenceNumber
      ..amount = parsed.amount
      ..balanceAfterTransaction = parsed.balanceAfterTransaction
      ..timestamp = parsed.timestamp
      ..sender = parsed.sender
      ..receiver = parsed.receiver
      ..rawSmsBody = rawBody
      ..bankName = matchingParser.bankIdentifier
      ..transactionType = parsed.transactionType.name
      ..category = 'uncategorized';

    // Persist to local vault asynchronously using a write transaction
    await _db.writeTxn(() async {
      await _db.transactionModels.put(transactionRecord);
    });
  }
}