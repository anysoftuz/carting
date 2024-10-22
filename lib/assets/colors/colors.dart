import 'package:flutter/rendering.dart';

const green = _green;
const longGrey = _longGrey;
const white = _white;
const black = _black;
const red = _red;
const dark = _dark;
const darkContainer = _darkContainer;
const darkText = _darkText;
const grey = _grey;
const iron = _iron;
const whiteSmoke = _whiteSmoke;
const greyText = _greyText;
const whiteGrey = _whiteGrey;
const blackGrey = _blackGrey;
const blue = _blue;
const lightBlue = _lightBlue;
const shuttleGrey = _shuttleGrey;
const bGrey = _bGrey;
const orang = _orang;
const iconGrey = _iconGrey;
const imageB = _imageB;
const backGroundColor = _backGroundColor;
const inputBlue = _inputBlue;
const scaffoldBackground = _scaffoldBackground;
const scaffoldSecondaryBackground = _scaffoldSecondaryBackground;
const buttonBackgroundColor = _buttonBackgroundColor;
const borderColor = _borderColor;
const secondaryBorderColor = _secondaryBorderColor;
const primary = _primary;
const gray = _gray;
const divider = _divider;
const secondary = _secondary;
const buttonBackgroundGray = _buttonBackgroundGray;
const error = _error;
const mainColor = _main;
const grayLight = _grayLight;
const greyBack = _greyBack;
const darkIcon = _darkIcon;

const _white = Color(0xffFFFFFF);
const _black = Color(0xFF000000);
const _dark = Color(0xff080808);
const _darkIcon = Color(0xff24292f);
const _darkContainer = Color(0xff131217);
const _darkText = Color(0xFF292D32);
const _red = Color(0xffFA4549);
const _grey = Color(0xff6E7781);
const _greyBack = Color(0xFF767680);
const _greyText = Color(0xFF7F92A0);
const _iron = Color(0xffCCCECF);
const _green = Color(0xff66C61C);
const _whiteSmoke = Color(0xffF6F8FA);
const _whiteGrey = Color(0xffF2F2F2);
const _blackGrey = Color(0xff555555);
const _iconGrey = Color(0xff828282);
const _blue = Color(0xff218BFF);
const _bGrey = Color(0xffEFF0F8);
const _orang = Color(0xFFFDA70F);
const _shuttleGrey = Color(0xffC2C2C2);
const _imageB = Color(0xffd9d9d9);
const _lightBlue = Color(0xFF706FD3);
const _backGroundColor = Color(0xFFF7F8FA);
const _longGrey = Color(0xffDFE0EB);
const _inputBlue = Color(0xFFD5E5FB);
const _scaffoldBackground = Color(0xFFFFFFFF);
const _scaffoldSecondaryBackground = Color(0xFFFAFAFA);
const _buttonBackgroundColor = Color(0xFFDDFF8F);
const contColor = Color(0xFF142338);
const contBlue = Color.fromRGBO(26, 121, 255, 0.20);
const contGrey = Color(0xFF2C394C);
const _borderColor = Color(0xFF3A393E);
const _secondaryBorderColor = Color(0xFFE8EAEC);
const _primary = Color(0xFF1A79FF);
const _gray = Color(0xFF7F92A0);
const _divider = Color(0xFFD8DADC);
const _secondary = Color(0xFF00C1C1);
const _buttonBackgroundGray = Color(0xFFF0F0F0);
const _error = Color(0xFFE74C3C);
const _main = Color(0xFF222222);
const _grayLight = Color(0xFFF3F5F9);

List<BoxShadow> wboxShadow = [
  BoxShadow(
    offset: const Offset(0, 4),
    blurRadius: 4,
    spreadRadius: 0,
    color: black.withOpacity(.25),
  ),
];

List<BoxShadow> wboxShadowRed = [
  BoxShadow(
    offset: const Offset(0, 0),
    blurRadius: 8,
    spreadRadius: 3,
    color: const Color(0xFFFA193E).withOpacity(.5),
  ),
];

LinearGradient wgradient = const LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xFFF53183),
    Color(0xFFFDA70F),
  ],
);
LinearGradient wgradientRed = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFFFA193E),
    Color(0xFF940F25),
  ],
);

LinearGradient wgradientBlack = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color(0xFF271C09),
    dark,
    dark,
    dark,
    dark,
  ],
);

RadialGradient radialGradient = RadialGradient(
  transform: const GradientRotation(0.15),
  stops: const [0.1, 5],
  center: Alignment.centerRight,
  radius: 1.5,
  colors: [
    blue.withOpacity(.5),
    backGroundColor.withOpacity(.5),
  ],
);

BoxDecoration wdecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(8),
  color: contColor,
);
