import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class CallView extends StatefulWidget {
  const CallView({super.key});

  @override
  State<CallView> createState() => _CallViewState();
}

class _CallViewState extends State<CallView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qo’llab-quvvatlash markazi")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: whiteSmoke,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: const CustomTextField(
            hintText: "Muammo haqida yozing",
            expands: false,
            minLines: 4,
            noHeight: true,
            maxLines: 8,
            maxLength: 500,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: WButton(
          margin: const EdgeInsets.all(16),
          onTap: () {},
          text: "Yuborish",
        ),
      ),
    );
  }
}
