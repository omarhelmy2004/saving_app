import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel extends HiveObject {
  @HiveField(0)
  int transactionType; // 0 outcome, 1 income

  @HiveField(1)
  double amount;

  @HiveField(2)
  String category; // e.g., Food, Rent, Entertainment

  @HiveField(3)
  DateTime date;



  TransactionModel({
    required this.transactionType,
    required this.amount,
    required this.category,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
