import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/views/auth/sms_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: AppImages.logoTextDark.imgAsset(height: 24),
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
              "Ro‘yxatdan o‘tish uchun telefon \n raqamingizni kiriting!",
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
                  builder: (context) => const SmsView(isRegister: true),
                ));
              },
              text: "Kirish",
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Avval ro‘yhatdan o‘tganmisiz? ",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: dark.withOpacity(.3),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.go(AppRouteName.auth);
                  },
                  child: const Text(
                    " Kirish",
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
