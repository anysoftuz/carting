import 'dart:ui';

import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const calendar = "assets/icons/calendar.svg";
  static const checkboxActiv = "assets/icons/checkbox_activ.svg";
  static const checkbox = "assets/icons/checkbox.svg";
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
  static const setting = "assets/icons/setting.svg";
  static const telegram = "assets/icons/telegram.svg";
  static const question = "assets/icons/question.svg";
  static const info = "assets/icons/info.svg";
  static const language = "assets/icons/language.svg";
  static const box = "assets/icons/box.svg";
  static const addCircle = "assets/icons/add_circle.svg";
  static const turnOff = "assets/icons/turn_off.svg";
  static const user = "assets/icons/user.svg";
  static const support = "assets/icons/support.svg";
  static const lovely = "assets/icons/lovely.svg";
  static const camera = "assets/icons/camera.svg";
  static const edit = "assets/icons/edit.svg";
  static const searchNormal = "assets/icons/search-normal.svg";
  static const checkVerified = "assets/icons/check-verified.svg";
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
