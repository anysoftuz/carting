import 'package:flutter/services.dart';

class PriceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Raqamlarni formatlash
    String formatted = _formatPrice(newValue.text);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }

  String _formatPrice(String value) {
    // Raqamlarni formatlash uchun maxsus kod
    value = value.replaceAll(RegExp(r'\D'), ''); // Faqat raqamlarni qoldirish
    if (value.isEmpty) return '';
    if (value.length <= 3) return value;

    // Har 3 raqamdan keyin vergul qo'yish
    StringBuffer buffer = StringBuffer();
    int count = 0;

    for (int i = value.length - 1; i >= 0; i--) {
      if (count > 0 && count % 3 == 0) {
        buffer.write(' ');
      }
      buffer.write(value[i]);
      count++;
    }

    return buffer.toString().split('').reversed.join();
  }
}
