import 'package:carting/assets/assets/images.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:flutter/material.dart';

class AppData {
  static List<TyperIteam> shippinglist = [
    TyperIteam(
      icon: AppImages.truck.imgAsset(height: 56),
      text: "Furgon",
      subTitle: "4.8x2.05x1.92",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.gazel.imgAsset(height: 56),
      text: "Gazel",
      subTitle: "3.4x1.65x1.9",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.trackMini.imgAsset(height: 56),
      text: "Bortovoy",
      subTitle: "3.4x1.65x1.9",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.truckMiddle.imgAsset(height: 56),
      text: "Fura",
      subTitle: "13.6x2.45x2.7",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.truckHight.imgAsset(height: 56),
      text: "Amerika furasi",
      subTitle: "16.6x2.45x2.7",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.image_13.imgAsset(height: 56),
      text: "Bitumovoz",
      subTitle: "13.6x2.45x2.7",
      screen: const SizedBox(),
    ),
  ];

  static List<TyperIteam> transportationofPassengers = [
    TyperIteam(
      icon: AppImages.carSilver.imgAsset(height: 56),
      text: "Avto",
      subTitle: "5 o‘rindiqli",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.image_7.imgAsset(height: 40),
      text: "Miniven",
      subTitle: "8 o‘rindiqli",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.gazel.imgAsset(height: 56),
      text: "Mikroavtobus",
      subTitle: "20 o‘rindiqli",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.ddd.imgAsset(height: 56),
      text: "Avtobus",
      subTitle: "30 o‘rindiqli",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.bus.imgAsset(height: 56),
      text: "Avtobus",
      subTitle: "50 o‘rindiqli",
      screen: const SizedBox(),
    ),
  ];

  static List<TyperIteam> specialTechnique = [
    TyperIteam(
      icon: AppImages.ekskivator.imgAsset(height: 56),
      text: "Ekskavator",
      subTitle: "Qazish ishlari uchun",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.roller.imgAsset(height: 56),
      text: "Asfalt yotqizgich",
      subTitle: "Asfalt tekishlash",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.bulldozer2.imgAsset(height: 56),
      text: "Buldozer",
      subTitle: "tekishlash ishlari",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.avtobus.imgAsset(height: 56),
      text: "Avtobus",
      subTitle: "13.6x2.45x2.7",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.bulldozer.imgAsset(height: 56),
      text: "Buldozer",
      subTitle: "Yerlarni haydash",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.avtokran.imgAsset(height: 56),
      text: "Avtokran",
      subTitle: "Balandlikdagi ishlar",
      screen: const SizedBox(),
    ),
  ];

  static List<TyperIteam> transportTransfer = [
    TyperIteam(
      icon: AppImages.ekskivator.imgAsset(height: 56),
      text: "Avtovozlar",
      subTitle: "Maxsus yuk mashinalari",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.roller.imgAsset(height: 56),
      text: "Evakuator",
      subTitle: "Maxsus yuk mashinalari",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.bulldozer2.imgAsset(height: 56),
      text: "Maxsus texnika transferi",
      subTitle: "Maxsus yuk mashinalari",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.avtobus.imgAsset(height: 56),
      text: "Yaxtalar va qayiqlar",
      subTitle: "Maxsus yuk mashinalari",
      screen: const SizedBox(),
    ),
  ];
}
