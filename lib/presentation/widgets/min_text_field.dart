import 'package:carting/assets/colors/colors.dart';
import 'package:flutter/material.dart';

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
  final void Function()? onsuffixIconPressed;
  final void Function()? onprefixIconPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: darkText.withOpacity(.3),
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
                  decoration: InputDecoration(
                    prefix: prefix,
                    suffixStyle: const TextStyle(color: darkText),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    hintText: hintText,
                    hintStyle: hintStyle ??
                        TextStyle(
                          color: darkText.withOpacity(.3),
                        ),
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
