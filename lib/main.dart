import 'dart:io';

import 'package:carting/assets/colors/colors.dart';
import 'package:carting/infrastructure/core/service_locator.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/routes/app_routes.dart';
import 'package:carting/src/settings/local_provider.dart';
import 'package:carting/utils/bloc_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await StorageRepository.getInstance();
  setupLocator();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LocaleProvider>(
      create: (_) => LocaleProvider(),
      builder: (context, child) {
        return MaterialApp.router(
          title: 'CARTING',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Provider.of<LocaleProvider>(context).locale,
          themeMode: ThemeMode.light,
          theme: ThemeData(
            fontFamily: 'Lufga',
            scaffoldBackgroundColor: scaffoldSecondaryBackground,
            colorSchemeSeed: green,
            appBarTheme: const AppBarTheme(
              backgroundColor: scaffoldSecondaryBackground,
              shadowColor: scaffoldSecondaryBackground,
              surfaceTintColor: scaffoldSecondaryBackground,
              centerTitle: true,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
            dividerTheme: const DividerThemeData(color: Color(0xFFEAEEF2)),
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouts.router,
          builder: (context, child) => KeyboardDismisser(child: child),
        );
      },
    );
  }
}
