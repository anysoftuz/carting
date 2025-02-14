import 'dart:io';

import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/assets/themes/theme.dart';
import 'package:carting/assets/themes/theme_changer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:provider/provider.dart';

import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/infrastructure/core/service_locator.dart';
import 'package:carting/infrastructure/repo/auth_repo.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/routes/app_routes.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/src/settings/local_provider.dart';
import 'package:carting/utils/bloc_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await StorageRepository.getInstance();
  setupLocator();

  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }

  runApp(DependencyScope(
    initialModel: AppScope(
      themeMode: getTheme(StorageRepository.getString(StorageKeys.MODE)),
    ),
    child: const MyApp(),
  ));
}

ThemeMode getTheme(String mode) {
  switch (mode) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(serviceLocator<AuthRepo>())..add(CheckUserEvent()),
      child: ChangeNotifierProvider<LocaleProvider>(
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
            theme: AppTheme.lightTheme(),
            darkTheme: AppTheme.darkTheme(),
            themeMode: AppScope.of(context).themeMode,
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouts.router,
            builder: (context, child) => BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                debugPrint('STATE LISTENER ============> ${state.status}');
                switch (state.status) {
                  case AuthenticationStatus.unauthenticated:
                    // AppRouts.router.pushReplacement(AppRouteName.auth);
                    AppRouts.router.go(AppRouteName.home);
                    break;
                  case AuthenticationStatus.authenticated:
                    AppRouts.router.go(AppRouteName.home);
                    break;
                  case AuthenticationStatus.loading:
                  case AuthenticationStatus.cancelLoading:
                    break;
                }
              },
              child: KeyboardDismisser(child: child),
            ),
          );
        },
      ),
    );
  }
}
