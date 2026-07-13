import '../../domain/entities/sms_parse_result.dart';
import 'base_sms_parser.dart';

class TelebirrSmsParser implements BaseSmsParser {
  @override
  String get bankIdentifier => 'telebirr';

  @override
  bool canParse(String senderAddress) => 
      senderAddress.toLowerCase() == 'telebirr' || senderAddress == '8554';

  @override
  SmsParseResult parse(String rawBody, String senderAddress, DateTime smsTimestamp) {
    // Example: "You have received ETB 500.00 from 251911XXXX. Transaction ID: MT2607... Balance: ETB 2,100"
    final amountRegex = RegExp(r'(?:received|transferred|paid)\s+ETB\s*([\d,]+\.?\d*)', caseSensitive: false);
    final balanceRegex = RegExp(r'Balance\s*[:\s]\s*ETB\s*([\d,]+\.?\d*)', caseSensitive: false);
    final txIdRegex = RegExp(r'(?:Transaction ID|Txn ID)[:\s]+([A-Z0-9]+)', caseSensitive: false);

    final isDeposit = rawBody.toLowerCase().contains('received');

    final amountStr = amountRegex.firstMatch(rawBody)?.group(1)?.replaceAll(',', '') ?? '0.0';
    final balanceStr = balanceRegex.firstMatch(rawBody)?.group(1)?.replaceAll(',', '') ?? '0.0';
    final refNum = txIdRegex.firstMatch(rawBody)?.group(1) ?? 'TELE-${smsTimestamp.millisecondsSinceEpoch}';

    return SmsParseResult(
      referenceNumber: refNum,
      amount: double.tryParse(amountStr) ?? 0.0,
      balanceAfterTransaction: double.tryParse(balanceStr) ?? 0.0,
      timestamp: smsTimestamp,
      sender: 'telebirr System',
      receiver: 'User',
      transactionType: isDeposit ? SmsTransactionType.deposit : SmsTransactionType.purchase,
    );
  }
}