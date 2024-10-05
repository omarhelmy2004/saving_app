import 'package:hive/hive.dart';

part 'budget_model.g.dart';

@HiveType(typeId: 1)
class BudgetModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  double budgetedPrice;
  @HiveField(2)
  double spentPrice;
  BudgetModel({required this.title, required this.budgetedPrice, required this.spentPrice});
}