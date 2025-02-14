import 'package:flutter/material.dart';

class AppThemeColor extends ThemeExtension<AppThemeColor> {
  final Color green;
  final Color longGrey;
  final Color white;
  final Color red;
  final Color black;
  final Color darkText;
  final Color grey;
  final Color iron;
  final Color whiteSmoke;
  final Color greyText;
  final Color whiteGrey;
  final Color blackGrey;
  final Color blue;
  final Color lightBlue;
  final Color shuttleGrey;
  final Color bGrey;
  final Color orang;
  final Color iconGrey;
  final Color imageB;
  final Color backGroundColor;
  final Color inputBlue;
  final Color contColor;
  final Color white50;
  final Color whiteBlack;
  final Color scaffoldBackground;
  final Color buttonBackgroundColor;
  final Color contBlue;
  final Color contGrey;
  final Color borderColor;
  final Color categoryColor;

  const AppThemeColor({
    required this.green,
    required this.longGrey,
    required this.white,
    required this.red,
    required this.black,
    required this.darkText,
    required this.grey,
    required this.iron,
    required this.whiteSmoke,
    required this.greyText,
    required this.whiteGrey,
    required this.blackGrey,
    required this.blue,
    required this.lightBlue,
    required this.shuttleGrey,
    required this.bGrey,
    required this.orang,
    required this.iconGrey,
    required this.imageB,
    required this.backGroundColor,
    required this.inputBlue,
    required this.contColor,
    required this.white50,
    required this.whiteBlack,
    required this.scaffoldBackground,
    required this.buttonBackgroundColor,
    required this.contBlue,
    required this.contGrey,
    required this.borderColor,
    required this.categoryColor,
  });

  // Dark
  static AppThemeColor dark = const AppThemeColor(
    white: Color(0xffFFFFFF),
    white50: Color(0xff8FA0B8),
    black: Color(0xff0C161D),
    darkText: Color(0xFF4C4C4C),
    red: Color(0xffFA193E),
    grey: Color(0xffE7E7E8),
    greyText: Color(0xFF445776),
    iron: Color(0xffBFC0C2),
    green: Color(0xff2CDB66),
    whiteSmoke: Color(0xff1F242F),
    whiteGrey: Color(0xffF2F2F2),
    whiteBlack: Color(0xFF2C394C),
    blackGrey: Color(0xFF323438),
    iconGrey: Color(0xff828282),
    blue: Color(0xff1A79FF),
    categoryColor: Color(0xff1A79FF),
    bGrey: Color(0xffEFF0F8),
    orang: Color(0xFFFD9644),
    shuttleGrey: Color(0xff606469),
    imageB: Color(0xffd9d9d9),
    lightBlue: Color(0xFF706FD3),
    backGroundColor: Color(0xFF141414),
    longGrey: Color(0xffDFE0EB),
    inputBlue: Color(0xFFD5E5FB),
    scaffoldBackground: Color(0xFF141414),
    buttonBackgroundColor: Color(0xFFDDFF8F),
    contColor: Color(0xFF1C1C1D),
    contBlue: Color.fromRGBO(26, 121, 255, 0.20),
    contGrey: Color(0xFF1C1C1D),
    borderColor: Color(0xFFF6F6F6),
  );

  // Light
  static AppThemeColor light = const AppThemeColor(
    white: Color(0xff1A1F23),
    white50: Color(0xff8FA0B8),
    black: Color(0xffFFFFFF),
    categoryColor: Color(0xffFFFFFF),
    darkText: Color(0xFFCBCCCD),
    red: Color(0xffFA193E),
    grey: Color(0xffE7E7E8),
    greyText: Color(0xFF445776),
    iron: Color(0xffBFC0C2),
    green: Color(0xff2CDB66),
    whiteSmoke: Color(0xffF7F8FC),
    whiteGrey: Color(0xff0C161D),
    whiteBlack: Color(0xFFF6F6F6),
    blackGrey: Color(0xFF1A1F23),
    iconGrey: Color(0xff828282),
    blue: Color(0xff1A79FF),
    bGrey: Color(0xffEFF0F8),
    orang: Color(0xFFFD9644),
    shuttleGrey: Color(0xff606469),
    imageB: Color(0xffd9d9d9),
    lightBlue: Color(0xFF706FD3),
    backGroundColor: Color(0xffFFFFFF),
    longGrey: Color(0xffDFE0EB),
    inputBlue: Color(0xFFD5E5FB),
    scaffoldBackground: Color(0xFFFAFAFA),
    buttonBackgroundColor: Color(0xFFDDFF8F),
    contColor: Color(0xFFFFFFFF),
    contBlue: Color.fromRGBO(26, 121, 255, 0.20),
    contGrey: Color(0xFFF4F4F4),
    borderColor: Color(0xFFEAEEF2),
  );

  @override
  ThemeExtension<AppThemeColor> copyWith({
    Color? white,
    Color? white50,
    Color? black,
    Color? darkText,
    Color? red,
    Color? grey,
    Color? greyText,
    Color? iron,
    Color? green,
    Color? whiteSmoke,
    Color? whiteGrey,
    Color? whiteBlack,
    Color? blackGrey,
    Color? iconGrey,
    Color? blue,
    Color? bGrey,
    Color? orang,
    Color? shuttleGrey,
    Color? imageB,
    Color? lightBlue,
    Color? backGroundColor,
    Color? longGrey,
    Color? inputBlue,
    Color? scaffoldBackground,
    Color? buttonBackgroundColor,
    Color? contColor,
    Color? contBlue,
    Color? contGrey,
    Color? borderColor,
    Color? categoryColor,
  }) {
    return AppThemeColor(
      white: white ?? this.white,
      white50: white50 ?? this.white50,
      black: black ?? this.black,
      darkText: darkText ?? this.darkText,
      red: red ?? this.red,
      grey: grey ?? this.grey,
      greyText: greyText ?? this.greyText,
      iron: iron ?? this.iron,
      green: green ?? this.green,
      whiteSmoke: whiteSmoke ?? this.whiteSmoke,
      whiteGrey: whiteGrey ?? this.whiteGrey,
      whiteBlack: whiteBlack ?? this.whiteBlack,
      blackGrey: blackGrey ?? this.blackGrey,
      iconGrey: iconGrey ?? this.iconGrey,
      blue: blue ?? this.blue,
      bGrey: bGrey ?? this.bGrey,
      orang: orang ?? this.orang,
      shuttleGrey: shuttleGrey ?? this.shuttleGrey,
      imageB: imageB ?? this.imageB,
      lightBlue: lightBlue ?? this.lightBlue,
      backGroundColor: backGroundColor ?? this.backGroundColor,
      longGrey: longGrey ?? this.longGrey,
      inputBlue: inputBlue ?? this.inputBlue,
      scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
      buttonBackgroundColor:
          buttonBackgroundColor ?? this.buttonBackgroundColor,
      contColor: contColor ?? this.contColor,
      contBlue: contBlue ?? this.contBlue,
      contGrey: contGrey ?? this.contGrey,
      categoryColor: categoryColor ?? this.categoryColor,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  @override
  ThemeExtension<AppThemeColor> lerp(
      covariant ThemeExtension<AppThemeColor>? other, double t) {
    if (other is! AppThemeColor) {
      return this;
    }
    return AppThemeColor(
      white: Color.lerp(white, other.white, t)!,
      white50: Color.lerp(white50, other.white50, t)!,
      black: Color.lerp(black, other.black, t)!,
      darkText: Color.lerp(darkText, other.darkText, t)!,
      red: Color.lerp(red, other.red, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      greyText: Color.lerp(greyText, other.greyText, t)!,
      iron: Color.lerp(iron, other.iron, t)!,
      green: Color.lerp(green, other.green, t)!,
      whiteSmoke: Color.lerp(whiteSmoke, other.whiteSmoke, t)!,
      whiteGrey: Color.lerp(whiteGrey, other.whiteGrey, t)!,
      whiteBlack: Color.lerp(whiteBlack, other.whiteBlack, t)!,
      blackGrey: Color.lerp(blackGrey, other.blackGrey, t)!,
      iconGrey: Color.lerp(iconGrey, other.iconGrey, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      bGrey: Color.lerp(bGrey, other.bGrey, t)!,
      orang: Color.lerp(orang, other.orang, t)!,
      categoryColor: Color.lerp(categoryColor, other.categoryColor, t)!,
      shuttleGrey: Color.lerp(shuttleGrey, other.shuttleGrey, t)!,
      imageB: Color.lerp(imageB, other.imageB, t)!,
      lightBlue: Color.lerp(lightBlue, other.lightBlue, t)!,
      backGroundColor: Color.lerp(backGroundColor, other.backGroundColor, t)!,
      longGrey: Color.lerp(longGrey, other.longGrey, t)!,
      inputBlue: Color.lerp(inputBlue, other.inputBlue, t)!,
      scaffoldBackground:
          Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
      buttonBackgroundColor:
          Color.lerp(buttonBackgroundColor, other.buttonBackgroundColor, t)!,
      contColor: Color.lerp(contColor, other.contColor, t)!,
      contBlue: Color.lerp(contBlue, other.contBlue, t)!,
      contGrey: Color.lerp(contGrey, other.contGrey, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
    );
  }
}
