import 'package:carting/assets/themes/theme_changer.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/presentation/widgets/custom_snackbar.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/auth/sms_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/formatters.dart';
import 'package:carting/utils/log_service.dart';
import 'package:carting/utils/my_function.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView>
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
      appBar: AppBar(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AppScope.of(context).themeMode == ThemeMode.dark
              ? AppImages.logoText.imgAsset(height: 24)
              : AppImages.logoTextDark.imgAsset(height: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.register,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              AppLocalizations.of(context)!.enterPhoneNumberToRegister,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: context.color.darkText,
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
                    title: AppLocalizations.of(context)!.phone,
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
                  isDisabled:
                      controller.text.isEmpty || controller.text.length < 19,
                  onTap: () {
                    context.read<AuthBloc>().add(SendCodeEvent(
                          phone: _tabController.index == 0
                              ? MyFunction.convertPhoneNumber(controller.text)
                              : controller.text,
                          isPhone: _tabController.index == 0,
                          onError: () {
                            CustomSnackbar.show(
                              context,
                              AppLocalizations.of(context)!.infoNotFound,
                            );
                          },
                          onSucces: (model) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SmsView(
                                isRegister: true,
                                model: model,
                                isPhone: _tabController.index == 0,
                                phone: MyFunction.convertPhoneNumber(
                                  controller.text,
                                ),
                              ),
                            ));
                          },
                          isLogin: false,
                        ));
                  },
                  text: AppLocalizations.of(context)!.enter,
                );
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.haveRegisteredBefore,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: context.color.darkText,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.enter,
                    style: const TextStyle(
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
