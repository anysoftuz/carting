import 'package:intl/intl.dart';

class MyFunction {
  static String priceFormat(num data) {
    if (data % 1 >= 0.01) {
      return priceFormat24(data.toDouble());
    }
    int price = doubleInt(data.toDouble());
    String result = '';
    int count = 0;

    if (price == 0) {
      return '0';
    } else {
      for (int i = price.toString().length - 1; i >= 0; i--) {
        if (count == 3) {
          result = '${price.toString()[i]} $result';
          count = 0;
        } else {
          result = price.toString()[i] + result;
        }
        count++;
      }
      return result;
    }
  }

  static int doubleInt(double number) {
    if (number % 1 >= 0.5) {
      return (number + 0.5).toInt();
    } else {
      return number.toInt();
    }
  }

  static String priceFormat24(double data) {
    // Define a NumberFormat with a space as the grouping separator
    final formatter = NumberFormat("#,##0.00", "en_US");
    // formatter.turnOffGrouping(); // Remove default grouping
    String formatted = formatter.format(data).replaceAll(" ", ",");

    return formatted;
  }

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
