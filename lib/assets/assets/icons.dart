import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const calendar = "assets/icons/calendar.svg";
  static const check = "assets/icons/check.svg";
  static const chevronRight = "assets/icons/chevron-right.svg";
  static const contact = "assets/icons/contact.svg";
  static const currentLocation = "assets/icons/current_location.svg";
  static const delivery = "assets/icons/delivery.svg";
  static const finishLocation = "assets/icons/finish_location.svg";
  static const home = "assets/icons/home.svg";
  static const leftIcon = "assets/icons/left-icon.svg";
  static const messagesChat = "assets/icons/messages-chat.svg";
  static const notifications = "assets/icons/notifications.svg";
  static const orderHistory = "assets/icons/order_history.svg";
  static const phone = "assets/icons/phone.svg";
  static const price = "assets/icons/price.svg";
  static const profile = "assets/icons/profile.svg";
  static const rightIcon = "assets/icons/right-icon.svg";
  static const time = "assets/icons/time.svg";
  static const truck = "assets/icons/truck.svg";
  static const upload = "assets/icons/upload.svg";
  static const height = "assets/icons/height.svg";
  static const arrowBottom = "assets/icons/arrow_bottom.svg";
  static const width = "assets/icons/width.svg";
  static const sun = "assets/icons/sun.svg";
  static const mobile = "assets/icons/mobile.svg";
  static const moon = "assets/icons/moon.svg";
  static const checkboxRadio = "assets/icons/checkbox-radio.svg";
  static const checkboxRadioDis = "assets/icons/checkbox_radio_dis.svg";
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
