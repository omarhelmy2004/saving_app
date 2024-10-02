class TransactionsModel {
  String title;
  double budgetedPrice;
  double spentPrice;
  TransactionType type;
  TransactionsModel({required this.title, required this.budgetedPrice, required this.spentPrice, required this.type});
  
}
enum TransactionType { income, outcome }
//keep your transaction amounts as double in your model and using a method or getter to format the value as a String whenever you need to display it