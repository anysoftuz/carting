import 'package:carting/assets/assets/images.dart';
import 'package:carting/data/models/fuels_model.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:flutter/material.dart';

class AppData {
  static List<FuelsModel> fuels = [
    FuelsModel(
      id: 1,
      type: 'AI 80',
      price: '',
    ),
    FuelsModel(
      id: 2,
      type: 'AI 92',
      price: '',
    ),
    FuelsModel(
      id: 3,
      type: 'AI 95',
      price: '',
    ),
    FuelsModel(
      id: 4,
      type: 'AI 98',
      price: '',
    ),
    FuelsModel(
      id: 5,
      type: 'AI 100',
      price: '',
    ),
    FuelsModel(
      id: 6,
      type: 'Disel',
      price: '',
    ),
  ];
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

  static List<CarType> carsList = [
    CarType(
      name: "Chevrolet Cobalt",
      description: "Sedan, benzin",
    ),
    CarType(
      name: "Chevrolet Lacetti",
      description: "Sedan, benzin",
    ),
    CarType(
      name: "BYD Chazor DMI",
      description: "Sedan, elektr/benzin",
    ),
  ];
  static List<CarType> carsList2 = [
    CarType(
      name: "Kia Sonet",
      description: "Krossover, benzin",
    ),
    CarType(
      name: "Chevrolet Tracker",
      description: "Krossover, benzin",
    ),
  ];

  static List<CarType> mastersType = [
    CarType(
      name: "Kuzov ustasi",
      description: "Polirovka, bo‘yoq, qirilish, buklanish",
    ),
    CarType(
      name: "Avtoelektrik",
      description: "Elektrga oid barcha ishlar, fara, tablo",
    ),
    CarType(
      name: "Mator ustasi",
      description: "dvigitel motor ishlari",
    ),
  ];

  static List<String> categories = [
    "Motorist",
    "Avtoelektrika",
    "Kuzovchi",
    "Avtotuning",
    'Hodovik'
  ];
  static List<String> services = [
    "Polirovka",
    "Keramika",
    "Bo’yoq",
    "Myatina",
  ];
}

class CarType {
  final String name;
  final String description;

  CarType({
    required this.name,
    required this.description,
  });
}

class FuelType {
  final TextEditingController controllerName;
  final TextEditingController controllerPrice;

  FuelType({
    required this.controllerName,
    required this.controllerPrice,
  });
}
