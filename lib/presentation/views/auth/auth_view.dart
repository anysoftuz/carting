import 'dart:io';

import 'package:carting/presentation/widgets/custom_snackbar.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
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

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin {
  late TextEditingController controller;
  late TextEditingController controllerEmail;

  late TabController _tabController;
  @override
  void initState() {
    controller = TextEditingController();
    controllerEmail = TextEditingController();
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  void dispose() {
    controller.dispose();
    controllerEmail.dispose();
    _tabController.dispose();
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
            WTabBar(
              color: white,
              labelColor: const Color(0xFF292D32),
              tabController: _tabController,
              onTap: (p0) {
                setState(() {});
              },
              tabs: const [
                Text(
                  'Telefon raqam orqali',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Email pochta orqali',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 90,
              child: TabBarView(
                controller: _tabController,
                children: [
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
                  CustomTextField(
                    title: "Email",
                    hintText: "namuna@mail.com",
                    controller: controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      Log.i(value.length);
                      if (value.length >= 12) {
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return WButton(
                  isLoading: state.statusSms.isInProgress,
                  onTap: () {
                    context.read<AuthBloc>().add(SendCodeEvent(
                          phone: _tabController.index == 0
                              ? MyFunction.convertPhoneNumber(controller.text)
                              : controller.text,
                          onError: () {
                            CustomSnackbar.show(context, "Malumot topilmadi");
                          },
                          onSucces: (model) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SmsView(
                                isRegister: false,
                                model: model,
                                isPhone: _tabController.index == 0,
                                phone: MyFunction.convertPhoneNumber(
                                  controller.text,
                                ),
                              ),
                            ));
                          },
                          isLogin: true,
                        ));
                  },
                  isDisabled: _tabController.index == 0
                      ? controller.text.isEmpty || controller.text.length < 19
                      : controllerEmail.text.length < 12,
                  text: "Kirish",
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
