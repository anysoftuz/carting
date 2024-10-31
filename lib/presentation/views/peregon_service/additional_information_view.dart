import 'dart:io';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_scale_animation.dart';
import 'package:carting/presentation/widgets/w_title.dart';
import 'package:carting/utils/formatters.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AdditionalInformationView extends StatefulWidget {
  const AdditionalInformationView({
    super.key,
    this.isDelivery = false,
  });
  final bool isDelivery;

  @override
  State<AdditionalInformationView> createState() =>
      _AdditionalInformationViewState();
}

class _AdditionalInformationViewState extends State<AdditionalInformationView> {
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
      backgroundColor: white,
      appBar: AppBar(
        title: const Text("Qo‘shimcha ma’lumotlar"),
        backgroundColor: white,
      ),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {},
          margin: const EdgeInsets.all(16),
          text: "Tasdiqlash",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (widget.isDelivery) ...[
              const WTitle(title: "Yuk turi"),
              ListTile(
                title: const Text("Boshqa materiallar"),
                subtitle: const Text("Boshqa materiallar"),
                trailing: AppIcons.checkboxRadioDis.svg(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                minVerticalPadding: 0,
                titleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                title: const Text("Qurilish mollari"),
                subtitle: const Text("Mebel, plintus, gipsokarton"),
                trailing: AppIcons.checkboxRadioDis.svg(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                minVerticalPadding: 0,
                titleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                title: const Text("Oziq ovqat"),
                subtitle: const Text("Ichimliklar, gazli, mineral suvlar"),
                trailing: AppIcons.checkboxRadioDis.svg(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                minVerticalPadding: 0,
                titleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                title: const Text("Uskunalar va ehtiyot qismlar"),
                subtitle: const Text("kuzovlar, yoritgich, generator"),
                trailing: AppIcons.checkboxRadioDis.svg(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                minVerticalPadding: 0,
                titleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
              ),
              const WTitle(title: "Yuklash xizmati"),
              ListTile(
                title: const Text("Yuk tashuvchilarsiz"),
                subtitle: const Text("Yordam kerak emas"),
                trailing: AppIcons.checkboxRadioDis.svg(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                minVerticalPadding: 0,
                titleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
              ),
              const Divider(height: 1),
              ListTile(
                title: const Text("Haydovchi yuklarni tashishi kerak"),
                subtitle:
                    const Text("50 kgdan ortiq bo’lmagan yuklarni tashish"),
                trailing: AppIcons.checkboxRadio.svg(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                minVerticalPadding: 0,
                titleTextStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
              ),
              const WTitle(title: "Yuk rasmlari (10 tagacha)"),
              const SizedBox(height: 12),
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
              const SizedBox(height: 24),
            ],
            CustomTextField(
              title: "Izoh",
              hintText: "Buyurtma haqida izoh qoldiring!",
              minLines: 4,
              maxLines: 5,
              noHeight: true,
              expands: false,
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            const WTitle(title: "To‘lov"),
            const SizedBox(height: 12),
            ListTile(
              onTap: () {},
              leading: AppIcons.cash.svg(),
              title: const Text("Naqd"),
              trailing: AppIcons.checkboxRadio.svg(),
            ),
            const Divider(height: 1),
            ListTile(
              onTap: () {},
              leading: AppIcons.card.svg(),
              title: const Text("Karta"),
              trailing: AppIcons.checkboxRadioDis.svg(),
            ),
            const Divider(height: 1),
            const SizedBox(height: 12),
            CustomTextField(
              title: "Narx",
              hintText: "Narxni kiriting",
              keyboardType: TextInputType.number,
              formatter: [Formatters.numberFormat],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
