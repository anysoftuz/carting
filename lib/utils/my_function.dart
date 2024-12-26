import 'package:intl/intl.dart';

class MyFunction {
  static String convertPhoneNumber(String formattedNumber) {
    // Faqat raqamlarni olib tashlash uchun `RegExp` dan foydalanamiz
    return formattedNumber.replaceAll(RegExp(r'[^\d]'), '');
  }

  static String formatPhoneNumber(String phoneNumber) {
    // Faqat raqamlarni olish uchun
    phoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');

    // Agar raqam uzunligi 12 bo'lsa, formatlash
    if (phoneNumber.length == 12) {
      return "+${phoneNumber.substring(0, 3)} (${phoneNumber.substring(3, 5)}) "
          "${phoneNumber.substring(5, 8)}-${phoneNumber.substring(8, 10)}-${phoneNumber.substring(10, 12)}";
    } else {
      throw Exception("Telefon raqami noto'g'ri uzunlikda");
    }
  }

  static String dateFormat(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}
