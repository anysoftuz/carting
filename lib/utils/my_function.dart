import 'package:intl/intl.dart';

class MyFunction {
  static String convertPhoneNumber(String formattedNumber) {
    // Faqat raqamlarni olib tashlash uchun `RegExp` dan foydalanamiz
    return formattedNumber.replaceAll(RegExp(r'[^\d]'), '');
  }

  static String dateFormat(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
