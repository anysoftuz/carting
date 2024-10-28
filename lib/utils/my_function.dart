import 'package:intl/intl.dart';

class MyFunction {
  static String dateFormat(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
