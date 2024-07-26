import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class OrderChatView extends StatefulWidget {
  const OrderChatView({super.key});

  @override
  State<OrderChatView> createState() => _OrderChatViewState();
}

class _OrderChatViewState extends State<OrderChatView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rustamjon Abdullaev")),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 84),
        itemCount: 3,
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.sizeOf(context).width - 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: green,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                child: const Text(
                  "Let’s get lunch soon! When are you free? ",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: white,
                  ),
                ),
              ),
            );
          }
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: MediaQuery.sizeOf(context).width - 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: whiteSmoke,
              ),
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              child: const Text(
                "Let’s get lunch soon! When are you free? ",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: black,
                ),
              ),
            ),
          );
        },
      ),
      bottomSheet: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 76,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 8 : 24,
        ),
        color: backGroundColor,
        child: CustomTextField(
          suffixIcon: AppIcons.rightIcon.svg(),
          hintText: "Xabaringizni kiriting",
        ),
      ),
    );
  }
}
