import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppImages {
  static const logo = 'assets/images/logo.png';
  static const ballOrder = 'assets/images/ball_order.png';
  static const border = 'assets/images/border.png';
  static const callCentr = 'assets/images/call-centr.png';
  static const info = 'assets/images/info.png';
  static const lenguage = 'assets/images/lenguage.png';
  static const logoText = 'assets/images/logo_text.png';
  static const quest = 'assets/images/quest.png';
  static const theme = 'assets/images/theme.png';
  static const main = 'assets/images/main.png';
  static const map = 'assets/images/map.png';
  static const uzbekistan = 'assets/images/uzbekistan.png';
  static const russia = 'assets/images/russia.png';
  static const trucks2 = 'assets/images/trucks-02.png';
  static const trucks3 = 'assets/images/trucks-03.png';
  static const trucks4 = 'assets/images/trucks-04.png';
  static const trucks5 = 'assets/images/trucks-05.png';
  static const trucks6 = 'assets/images/trucks-06.png';
}

extension ImgExt on String {
  Image imgAsset({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.asset(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }

  Image imgNetwork({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.network(
      this,
      width: width,
      height: height,
      fit: fit,
    );
  }

  Image imgFile({
    double? width,
    double? height,
    BoxFit? fit,
  }) {
    return Image.file(
      File(this),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
