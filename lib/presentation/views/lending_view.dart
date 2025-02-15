import 'package:carting/assets/themes/theme_changer.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/widgets/w_button.dart';


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
          child: AppScope.of(context).themeMode != ThemeMode.light
              ? AppImages.logoText.imgAsset()
              : AppImages.logoTextDark.imgAsset(),
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
          Text(
            AppLocalizations.of(context)!.welcome,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              AppLocalizations.of(context)!.transportServices,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: context.color.darkText,
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
              text: AppLocalizations.of(context)!.start, 
            ),
          )
        ],
      ),
    );
  }
}
