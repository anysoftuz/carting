import 'dart:io';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/orders/orders_info_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_scale_animation.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class OrdersInfoFinshView extends StatefulWidget {
  const OrdersInfoFinshView({super.key});
  @override
  State<OrdersInfoFinshView> createState() => _OrdersInfoFinshViewState();
}

class _OrdersInfoFinshViewState extends State<OrdersInfoFinshView> {
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
          Container(
            decoration: BoxDecoration(
              color: green.withOpacity(.2),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                AppIcons.truck.svg(),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Yukinggiz yetkazildi!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: green,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            padding: const EdgeInsets.all(20),
            child: const OrdersInfoTile(
              title: 'Haydovchining ism va familiyasi',
              subtitle: 'Rustamjon Abdullaev',
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Fotosuratli hisobot",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            "Yuklaringiz yetib borganini, ularni fotosuratga olib, shu yerga yuklash orqali tasdiqlang.",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
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
          const Text(
            "Haydovchini baholang",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 84,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Izoh",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
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
          WButton(
            onTap: () {},
            text: "Bahoni yuborish",
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrdersInfoTile(
                  title: 'Yuk turi',
                  subtitle: 'Mebel',
                ),
                SizedBox(height: 16),
                OrdersInfoTile(
                  title: 'Yuk hajmi (m²)',
                  subtitle: '2 x 3 x 2',
                ),
                SizedBox(height: 16),
                OrdersInfoTile(
                  title: 'Yukni olib ketish vaqti',
                  subtitle: '18.07.2024 16:00',
                ),
                SizedBox(height: 16),
                OrdersInfoTile(
                  title: 'Yuk yetkazilgan vaqti',
                  subtitle: '19.07.2024 12:00',
                ),
                SizedBox(height: 16),
                OrdersInfoTile(
                  title: 'To’lov turi',
                  subtitle: 'Naqd',
                ),
                SizedBox(height: 16),
                OrdersInfoTile(
                  title: 'Yetkazib berish narxi',
                  subtitle: '500 000',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
