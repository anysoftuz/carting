import 'package:carting/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WTitle extends StatelessWidget {
  const WTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: scaffoldSecondaryBackground,
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: black.withOpacity(.3),
        ),
      ),
    );
  }
}