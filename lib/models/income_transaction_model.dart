import 'package:hive/hive.dart';

part 'income_transaction_model.g.dart';

@HiveType(typeId: 0)
class IncomeModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  double amount;

  @HiveField(2)
  String source; // e.g., Salary, Freelance

  @HiveField(3)
  DateTime date;



  IncomeModel({
    required this.title,
    required this.amount,
    required this.source,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
