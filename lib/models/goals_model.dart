import 'package:hive/hive.dart';

class GoalsModel extends HiveObject {
  String title;
  double amount;
  double leftAmount;
  GoalsModel({required this.amount , required this.leftAmount, required this.title});
}