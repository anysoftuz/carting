import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CARTING',
      themeMode: ThemeMode.dark,
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
  }
}
