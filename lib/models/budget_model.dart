import 'package:hive/hive.dart';

class BudgetModel extends HiveObject {
  String title;
  double budgetedPrice;
  double spentPrice;
  BudgetModel({required this.title, required this.budgetedPrice, required this.spentPrice});
}