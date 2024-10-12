import 'package:hive/hive.dart';

part 'outcome_transaction_model.g.dart';

@HiveType(typeId: 1)
class OutcomeModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  double amount;

  @HiveField(2)
  String category; // e.g., Food, Rent, Entertainment

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  

  OutcomeModel({
    required this.title,
    required this.amount,
    required this.category,
    DateTime? date,
  
  }) : date = date ?? DateTime.now();
}
