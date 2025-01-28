import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcons.emptyFile.svg(),
          const SizedBox(height: 16),
          const Text(
            'Ma’lumot yo’q',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Xizmatga oid E’lonlar va \nhaydovchilar yo‘q',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          WButton(
            onTap: () {
              Navigator.pop(context);
            },
            width: 260,
            text: 'Ortga',
          )
        ],
      ),
    );
  }
}
