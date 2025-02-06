import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/auth/register_view.dart';
import 'package:carting/presentation/views/auth/sms_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/formatters.dart';
import 'package:carting/utils/log_service.dart';
import 'package:carting/utils/my_function.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  late TextEditingController controller;
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
                color: dark.withValues(alpha: .3),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            CustomTextField(
              title: "Telefon",
              hintText: "+998",
              controller: controller,
              formatter: [Formatters.phoneFormatter],
              keyboardType: TextInputType.phone,
              onChanged: (value) {
                Log.i(value.length);
                if (value.length >= 18) {
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 32),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return WButton(
                  isLoading: state.statusSms.isInProgress,
                  onTap: () {
                    context.read<AuthBloc>().add(SendCodeEvent(
                          phone: MyFunction.convertPhoneNumber(controller.text),
                          onError: () {},
                          onSucces: (model) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SmsView(
                                isRegister: false,
                                model: model,
                                phone: MyFunction.convertPhoneNumber(
                                  controller.text,
                                ),
                              ),
                            ));
                          },
                          isLogin: true,
                        ));
                  },
                  isDisabled:
                      controller.text.isEmpty || controller.text.length < 19,
                  text: "Kirsh",
                );
              },
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
                    color: dark.withValues(alpha: .3),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // context.go(AppRouteName.register);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const RegisterView(),
                    ));
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
