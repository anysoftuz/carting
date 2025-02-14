import 'package:carting/assets/themes/theme_colors.dart';
import 'package:flutter/material.dart';



extension BuildContextExt on BuildContext {
  AppThemeColor get color => Theme.of(this).extension<AppThemeColor>()!;
}
