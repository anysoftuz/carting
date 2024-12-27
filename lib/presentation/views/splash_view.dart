import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFF66C61C).withValues(alpha: .7),
        ),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: [
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: AppImages.logoText.imgAsset(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                    child: Text(
                      "O’zbekiston bo’ylab yuk tashish",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 120)
                ],
              ),
            ),
            const Positioned(
              bottom: 56,
              child: Column(
                children: [
                  SpinKitCircle(
                    size: 52,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '© All rights reserved',
                    style: TextStyle(color: white),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
