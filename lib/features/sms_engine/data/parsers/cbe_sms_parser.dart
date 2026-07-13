import '../../domain/entities/sms_parse_result.dart';
import 'base_sms_parser.dart';

class CbeSmsParser implements BaseSmsParser {
  @override
  String get bankIdentifier => 'CBE';

  @override
  bool canParse(String senderAddress) => senderAddress.toUpperCase() == 'CBE';

  @override
  SmsParseResult parse(String rawBody, String senderAddress, DateTime smsTimestamp) {
    // Example: "Dear Customer, ETB 1,500.00 has been debited from your account... Ref: FT2605XXX. Balance is ETB 12,450.00"
    
    // Regex matches numbers with optional commas/decimals
    final amountRegex = RegExp(r'(?:debited|credited|sent|received)\s+(?:from|to|of)?\s*ETB\s*([\d,]+\.?\sub\d*)', caseSensitive: false);
    final balanceRegex = RegExp(r'Balance\s+is\s+ETB\s*([\d,]+\.?\d*)', caseSensitive: false);
    final refRegex = RegExp(r'Ref(?:erence)?[:\s]+([A-Z0-9]+)', caseSensitive: false);
    
    final isDeposit = rawBody.toLowerCase().contains('credited') || rawBody.toLowerCase().contains('received');

    final amountStr = amountRegex.firstMatch(rawBody)?.group(1)?.replaceAll(',', '') ?? '0.0';
    final balanceStr = balanceRegex.firstMatch(rawBody)?.group(1)?.replaceAll(',', '') ?? '0.0';
    final refNum = refRegex.firstMatch(rawBody)?.group(1) ?? 'MOCK-${smsTimestamp.millisecondsSinceEpoch}';

    return SmsParseResult(
      referenceNumber: refNum,
      amount: double.tryParse(amountStr) ?? 0.0,
      balanceAfterTransaction: double.tryParse(balanceStr) ?? 0.0,
      timestamp: smsTimestamp,
      sender: isDeposit ? 'External Party' : 'Your Account',
      receiver: isDeposit ? 'Your Account' : 'External Party',
      transactionType: isDeposit ? SmsTransactionType.deposit : SmsTransactionType.withdrawal,
    );
  }
}