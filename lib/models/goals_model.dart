import 'package:hive/hive.dart';


part 'goals_model.g.dart';

@HiveType(typeId: 2)
class GoalsModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  double amount;
  @HiveField(2)
  double leftAmount;
  GoalsModel({required this.amount , required this.leftAmount, required this.title});
}