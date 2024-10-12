import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class DeliverInfoView extends StatelessWidget {
  const DeliverInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              WButton(
                onTap: () {},
                text: "+998 99 123 45 67",
              ),
              const SizedBox(height: 8),
              WButton(
                onTap: () {},
                color: blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppIcons.telegram.svg(),
                    const SizedBox(width: 12),
                    const Text("Telegram orqali bog'lanish")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Container(),
    );
  }
}
