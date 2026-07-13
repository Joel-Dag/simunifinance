enum SmsTransactionType { deposit, withdrawal, transfer, purchase, salary, unknown }

class SmsParseResult {
  final String referenceNumber;
  final double amount;
  final double balanceAfterTransaction;
  final DateTime timestamp;
  final String sender; // e.g., "CBE", "telebirr"
  final String receiver;
  final SmsTransactionType transactionType;

  SmsParseResult({
    required this.referenceNumber,
    required this.amount,
    required this.balanceAfterTransaction,
    required this.timestamp,
    required this.sender,
    required this.receiver,
    required this.transactionType,
  });
}