import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/themes/theme_changer.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:carting/assets/assets/icons.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: AppScope.of(context).themeMode != ThemeMode.light
                      ? AppImages.logoText.imgAsset(height: 24)
                      : AppIcons.logoCarting.svg(height: 24),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
            bottom: 56,
            child: Column(
              children: [
                SpinKitCircle(
                  size: 52,
                  color: context.color.white,
                ),
                const SizedBox(height: 10),
                Text(
                  '© All rights reserved',
                  style: TextStyle(color: context.color.darkText),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
