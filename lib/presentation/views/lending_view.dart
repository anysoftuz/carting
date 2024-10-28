import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LendingView extends StatefulWidget {
  const LendingView({super.key});

  @override
  State<LendingView> createState() => _LendingViewState();
}

class _LendingViewState extends State<LendingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: SizedBox(
          height: 24,
          width: 128,
          child: AppImages.logoTextDark.imgAsset(),
        ),
        backgroundColor: scaffoldBackground,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: AppImages.banner.imgAsset(
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const Text(
            "Xush kelibsiz",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              "Barcha transport xizmatlari bitta ilovada tez, qulay, arzon!",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: dark.withOpacity(.3),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          SafeArea(
            child: WButton(
              margin: const EdgeInsets.all(16),
              onTap: () {
                context.go(AppRouteName.auth);
              },
              text: "Boshlash",
            ),
          )
        ],
      ),
    );
  }
}
