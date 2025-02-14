import 'package:carting/assets/colors/colors.dart';
import 'package:carting/assets/themes/theme_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme() => ThemeData(
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
        extensions: <ThemeExtension<AppThemeColor>>[AppThemeColor.light],
        listTileTheme: const ListTileThemeData(
          textColor: Colors.black,
          iconColor: Colors.black,
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          textColor: Colors.black,
          iconColor: Colors.black,
          collapsedTextColor: Colors.black,
          collapsedIconColor: Colors.black,
        ),
        iconTheme: const IconThemeData(color: dark),
        // Set the default text color to black for the light theme
        textTheme: ThemeData.light().textTheme.copyWith(
              displayLarge: const TextStyle(color: Colors.black),
              displayMedium: const TextStyle(color: Colors.black),
              displaySmall: const TextStyle(color: Colors.black),
              headlineLarge: const TextStyle(color: Colors.black),
              headlineMedium: const TextStyle(color: Colors.black),
              headlineSmall: const TextStyle(color: Colors.black),
              titleLarge: const TextStyle(color: Colors.black),
              titleMedium: const TextStyle(color: Colors.black),
              titleSmall: const TextStyle(color: Colors.black),
              bodyLarge: const TextStyle(color: Colors.black),
              bodyMedium: const TextStyle(color: Colors.black),
              bodySmall: const TextStyle(color: Colors.black),
              labelLarge: const TextStyle(color: Colors.black),
              labelMedium: const TextStyle(color: Colors.black),
              labelSmall: const TextStyle(color: Colors.black),
            ),
      );

  static ThemeData darkTheme() => ThemeData(
        fontFamily: 'Lufga',
        scaffoldBackgroundColor: const Color(0xFF141414),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF141414),
          shadowColor: Color(0xFF141414),
          surfaceTintColor: Color(0xFF141414),
          centerTitle: true,
          elevation: 0,
          iconTheme: IconThemeData(color: Color(0xFF4C4C4C)),
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: white,
          ),
        ),
        dividerTheme: const DividerThemeData(color: Color(0xFF161B26)),
        extensions: <ThemeExtension<AppThemeColor>>[AppThemeColor.dark],
        colorSchemeSeed: green,
        listTileTheme: const ListTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
        ),
        expansionTileTheme: const ExpansionTileThemeData(
          textColor: Colors.white,
          iconColor: Colors.white,
          collapsedTextColor: Colors.white,
          collapsedIconColor: Colors.white,
        ),
        iconTheme: const IconThemeData(color: white),
        // Set the default text color to black for the light theme
        textTheme: ThemeData.dark().textTheme.copyWith(
              displayLarge: const TextStyle(color: Colors.white),
              displayMedium: const TextStyle(color: Colors.white),
              displaySmall: const TextStyle(color: Colors.white),
              headlineLarge: const TextStyle(color: Colors.white),
              headlineMedium: const TextStyle(color: Colors.white),
              headlineSmall: const TextStyle(color: Colors.white),
              titleLarge: const TextStyle(color: Colors.white),
              titleMedium: const TextStyle(color: Colors.white),
              titleSmall: const TextStyle(color: Colors.white),
              bodyLarge: const TextStyle(color: Colors.white),
              bodyMedium: const TextStyle(color: Colors.white),
              bodySmall: const TextStyle(color: Colors.white),
              labelLarge: const TextStyle(color: Colors.white),
              labelMedium: const TextStyle(color: Colors.white),
              labelSmall: const TextStyle(color: Colors.white),
            ),
      );

  // Fonts
  static const displayLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const displayMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const displaySmall = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: white,
  );
  static const headlineMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );
  static const headlineSmall = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: greyText,
  );
  static const titleLarge = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: white,
  );
  static const bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const bodyMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const titleMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: white,
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: white,
  );

  static const labelLarge = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: white,
    letterSpacing: -0.1,
  );

  static const labelSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: white,
    letterSpacing: -0.1,
  );
}
