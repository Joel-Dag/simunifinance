import '../../domain/entities/sms_parse_result.dart';

abstract class BaseSmsParser {
  String get bankIdentifier; // e.g., 'CBE', '123' (Telebirr)
  bool canParse(String senderAddress);
  SmsParseResult parse(String rawBody, String senderAddress, DateTime smsTimestamp);
}