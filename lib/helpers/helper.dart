import 'package:intl/intl.dart';

class Helpers {
  static String convertRupiah(int number, int decimalDigit){
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: decimalDigit,
    );
    return currencyFormatter.format(number);
  }
}