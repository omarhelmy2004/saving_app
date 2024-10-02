class TransactionsModel {
  String title;
  DateTime date;
  double price;
  TransactionsModel({
    required this.title,
    required this.date,
    required this.price,
  });
}
//keep your transaction amounts as double in your model and using a method or getter to format the value as a String whenever you need to display it