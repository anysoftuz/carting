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
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.main),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        body: Padding(
          padding: MediaQuery.of(context).viewPadding,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.sizeOf(context).height * .1),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48),
                        child: AppImages.logoText.imgAsset(),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                        child: Text(
                          "O’zbekiston bo’ylab yuk tashish",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.sizeOf(context).height * .14),
                    ],
                  ),
                ),
                const Text(
                  "Raqamingizni kiriting",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: white,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: "Raqamingizni kiriting",
                  textColor: white,
                  formatter: [Formatters.phoneFormatter],
                  keyboardType: TextInputType.phone,
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: white,
                  ),
                  fillColor: whiteSmoke.withOpacity(.24),
                ),
                const Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                      child: Text(
                        "Yoki",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: white,
                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                WButton(
                  onTap: () {
                    context.go(AppRouteName.homeDeliver);
                  },
                  color: whiteSmoke.withOpacity(.24),
                  text: "Google orqali kirish",
                ),
                const SizedBox(height: 56),
                WButton(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SmsView(),
                    ));
                  },
                  text: "Davom etish",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
