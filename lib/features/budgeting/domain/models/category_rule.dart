import 'package:isar/isar.dart';

part 'category_rule.g.dart';

@collection
class CategoryRule {
  Id id = Isar.autoIncrement;
  
  @Index(unique: true)
  late String identifier; // The phone number or Sender ID (e.g., '0911223344')
  
  late String categoryName; // User's custom name (e.g., 'Sales', 'Rent')
  
  late bool isIncome;

}