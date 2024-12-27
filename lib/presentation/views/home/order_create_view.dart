import 'dart:io';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/car_model.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_scale_animation.dart';
import 'package:carting/utils/formatters.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class OrderCreateView extends StatefulWidget {
  const OrderCreateView({super.key});

  @override
  State<OrderCreateView> createState() => _OrderCreateViewState();
}

class _OrderCreateViewState extends State<OrderCreateView> {
  List<CarModel> list = [
    CarModel(
      title: "Bir nechta quti sig’imi",
      images: AppImages.trucks2,
      height: 100,
      width: 100,
      kg: 300,
    ),
    CarModel(
      title: "Kir yuvish mashinasi v.b.",
      images: AppImages.trucks3,
      height: 100,
      width: 100,
      kg: 700,
    ),
    CarModel(
      title: "Kir yuvish mashinasi v.b.",
      images: AppImages.trucks4,
      height: 100,
      width: 100,
      kg: 1400,
    ),
    CarModel(
      title: "Uy jihozlari va texnikalari",
      images: AppImages.trucks5,
      height: 100,
      width: 100,
      kg: 3100,
    ),
    CarModel(
      title: "Ko’p miqdordagi mahsulot",
      images: AppImages.trucks6,
      height: 100,
      width: 100,
      kg: 16000,
    ),
  ];

  ValueNotifier<int> selIndex = ValueNotifier(0);
  ValueNotifier<bool> check = ValueNotifier(false);
  List<File> images = [];

  void imagesFile() async {
    try {
      final image = await ImagePicker().pickMultiImage();
      if (image.isNotEmpty) {
        for (var element in image) {
          images.add(File(element.path));
        }
      }
      setState(() {});
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buyurtma haqida")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Yuk haqida",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            title: "Yuk turi",
            hintText: "Tanlang",
            suffixIcon: AppIcons.arrowBottom.svg(),
          ),
          const SizedBox(height: 16),
          Text(
            "Yuk hajmi",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          const SizedBox(
            height: 58,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: "Bo’yi",
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    hintText: "Eni",
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    hintText: "Uzunligi",
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Yuk rasmlari",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          GridView.builder(
            itemCount: images.length + 1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              if (images.length == index) {
                return WScaleAnimation(
                  onTap: () {
                    imagesFile();
                  },
                  child: DottedBorder(
                    color: green,
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    child: Center(
                      child: AppIcons.upload.svg(),
                    ),
                  ),
                );
              }
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: FileImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Text(
            "Yuk mashina turi",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: ValueListenableBuilder(
              valueListenable: selIndex,
              builder: (context, value, __) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      selIndex.value = index;
                    },
                    child: AnimatedContainer(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width * .8,
                      duration: const Duration(microseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: value == index
                            ? green.withValues(alpha: .2)
                            : whiteSmoke,
                        border:
                            value == index ? Border.all(color: green) : null,
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  list[index].title,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "${list[index].kg} KG",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    AppIcons.width.svg(),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${list[index].width}  m²",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    AppIcons.height.svg(),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${list[index].height}  m²",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          list[index].images.imgAsset()
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: list.length,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: "Yuklash xizmati",
            hintText: "Yuklash xizmati",
            suffixIcon: ValueListenableBuilder(
              valueListenable: check,
              builder: (context, valu, __) {
                return CupertinoSwitch(
                  value: valu,
                  activeTrackColor: green,
                  onChanged: (value) {
                    check.value = value;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          const CustomTextField(
            hintText: "Nechta yuklovchi kerak?",
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(
                child: Text(
                  "QABUL QILUVCHI",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              AppIcons.orderHistory.svg(
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 4),
              const Text(
                "Tarix",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const CustomTextField(
            title: "Ism va familiyasi",
            hintText: "Ism va familiyasi",
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: "Telefon raqami",
            hintText: "Telefon raqami",
            suffixIcon: AppIcons.contact.svg(),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          Text(
            "Izoh",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: const CustomTextField(
              hintText: "Yuk bor",
              fillColor: whiteSmoke,
              noHeight: true,
              expands: false,
              maxLines: 5,
              minLines: 5,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "TO'LOV HAQIDA",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            title: "To’lov turi",
            hintText: "Tanlang",
            suffixIcon: AppIcons.arrowBottom.svg(),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: "Narx (so’m)",
            hintText: "450 000 - 630 000",
            keyboardType: TextInputType.number,
            formatter: [Formatters.numberFormat],
          ),
          const SizedBox(height: 16),
          WButton(
            onTap: () {},
            text: "Buyurtmani yaratish",
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
