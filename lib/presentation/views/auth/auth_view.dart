import 'dart:io';

import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/views/auth/sms_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: Platform.isIOS ? 0 : 16),
          child: AppImages.logoTextDark.imgAsset(height: 24),
        ),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Kirish",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Profilingizga kirish uchun ro’yxatdan o’tgan raqamingizni kiriting!",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: dark.withOpacity(.3),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              title: "Telefon",
              hintText: "+998",
              formatter: [Formatters.phoneFormatter],
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 32),
            WButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SmsView(isRegister: false),
                ));
              },
              text: "Kirish",
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Platformamizda yangimisiz? ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: dark.withOpacity(.3),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go(AppRouteName.register);
                  },
                  child: const Text(
                    " Ro‘yhatdan o‘tish",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blue,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
