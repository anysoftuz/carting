import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class NoConnectView extends StatelessWidget {
  const NoConnectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcons.noConnection.svg(),
          const SizedBox(height: 16),
          const Text(
            'Internet aloqasi yo‘q',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'Kuchsiz Internet aloqasi, qayta\nurinib ko‘ring',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          WButton(
            onTap: () {},
            width: 260,
            text: 'Qayta urinish',
          )
        ],
      ),
    );
  }
}
