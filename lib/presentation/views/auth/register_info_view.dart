import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterInfoView extends StatefulWidget {
  const RegisterInfoView({super.key, required this.isLegal});
  final bool isLegal;

  @override
  State<RegisterInfoView> createState() => _RegisterInfoViewState();
}

class _RegisterInfoViewState extends State<RegisterInfoView> {
  late ValueNotifier<bool> isActive;
  @override
  void initState() {
    isActive = ValueNotifier(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isLegal
              ? "Yuridik shaxs ma’lumotlari"
              : "Jismoniy shaxs ma’lumotlari",
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                ValueListenableBuilder(
                  valueListenable: isActive,
                  builder: (context, value, __) {
                    return CupertinoCheckbox(
                      activeColor: blue,
                      value: value,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      onChanged: (value) {
                        isActive.value = value!;
                      },
                    );
                  },
                ),
                const Text(
                  "Foydalanish shartlariga roziman",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: blue,
                  ),
                )
              ],
            ),
            WButton(
              onTap: () {
                context.go(AppRouteName.home);
              },
              margin: const EdgeInsets.symmetric(horizontal: 16),
              text: "Ro‘yxatdan o‘tish",
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: widget.isLegal
              ? [
                  CustomTextField(
                    title: 'STIR',
                    hintText: "STIR kiriting",
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Kompaniya nomi',
                    hintText: "Kompaniya nomi kiriting",
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Telefon',
                    hintText: "+998",
                    onChanged: (value) {},
                  ),
                ]
              : [
                  CustomTextField(
                    title: 'Ism',
                    hintText: "Ismingizni kiriting",
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Familiya',
                    hintText: "Familiyangizni kiriting",
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Telefon',
                    hintText: "+998",
                    onChanged: (value) {},
                  ),
                ],
        ),
      ),
    );
  }
}
