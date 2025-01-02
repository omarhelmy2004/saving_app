import 'package:hive/hive.dart';

part 'balance_model.g.dart';

@HiveType(typeId: 3)
class Balance extends HiveObject {
  @HiveField(0)
  double totalBalance = 0;
  Balance({required this.totalBalance});
}