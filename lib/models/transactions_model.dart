import 'package:hive/hive.dart';

part 'transactions_model.g.dart';

@HiveType(typeId: 0)
class TransactionsModel extends HiveObject{
  @HiveField(0)
  String title;
  @HiveField(1)
  double budgetedPrice;
  @HiveField(2)
  double spentPrice;
  @HiveField(3)
  TransactionType type;
  TransactionsModel({required this.title, required this.budgetedPrice, required this.spentPrice, required this.type});
  
}
enum TransactionType { income, outcome }
//keep your transaction amounts as double in your model and using a method or getter to format the value as a String whenever you need to display it