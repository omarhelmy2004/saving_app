import 'package:intl/intl.dart';

String formatAmount(double amount) {
  if (amount >= 1000000) {
    return NumberFormat.compact().format(amount); // "1M"
  } else if (amount >= 1000) {
    return NumberFormat.compact().format(amount); // "1k"
  } else {
    return amount.toStringAsFixed(2); // Keeps 2 decimal points for smaller amounts
  }
}
