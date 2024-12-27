import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(title: const Text('Bildirishnomalar')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            child: const Text("Yukinggiz allaqachon yo’lda!"),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                    "Haydovchi yuklaringizni manzilga yetkazdi. Buni tasdiqlaysizmi?"),
                const SizedBox(height: 12),
                WButton(
                  onTap: () {},
                  textColor: red,
                  height: 40,
                  borderRadius: 12,
                  color: red.withValues(alpha: .2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.phone.svg(color: red),
                      const SizedBox(width: 8),
                      const Text("Biz bilan bog’lanish")
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: WButton(
          onTap: () {},
          textColor: green,
          color: green.withValues(alpha: .2),
          text: "O’qilgan sifatida belgilash",
        ),
      ),
    );
  }
}
