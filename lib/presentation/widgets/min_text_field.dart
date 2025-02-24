import 'package:carting/assets/colors/colors.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MinTextField extends StatelessWidget {
  const MinTextField({
    super.key,
    required this.text,
    this.hintText = "",
    this.hintStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.suffixText,
    this.prefix,
    this.onsuffixIconPressed,
    this.onprefixIconPressed,
    this.formatter,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
  });
  final String text;
  final String hintText;
  final String? suffixText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final Widget? prefix;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? formatter;
  final TextInputType keyboardType;
  final void Function()? onsuffixIconPressed;
  final void Function()? onprefixIconPressed;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.contColor,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: context.color.darkText,
            ),
          ),
          Row(
            children: [
              prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: prefixIcon,
                    )
                  : const SizedBox(),
              Expanded(
                child: TextField(
                  controller: controller,
                  onChanged: onChanged,
                  readOnly: readOnly,
                  inputFormatters: formatter,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    prefix: prefix,
                    suffixStyle: const TextStyle(color: darkText),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: hintStyle ?? const TextStyle(),
                  ),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: suffixIcon,
                    )
                  : const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
