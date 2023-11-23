import 'package:intl/intl.dart';

String convertToIdr(double number) {
  NumberFormat currencyFormatter = NumberFormat.currency(
      locale: "id",
      decimalDigits: 0,
      symbol: "Rp. "
  );
  return currencyFormatter.format(number);
}