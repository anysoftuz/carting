import 'dart:io';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileInfoView extends StatefulWidget {
  const ProfileInfoView({super.key});

  @override
  State<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  File? images;

  void imagesFile() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      images = File(image.path);
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
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          CircleAvatar(
            radius: 56,
            backgroundImage: images != null ? FileImage(images!) : null,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  imagesFile();
                },
                child: const Text(
                  "Yuklash",
                  style: TextStyle(color: blue),
                ),
              ),
              TextButton(
                onPressed: () {
                  images = null;
                  setState(() {});
                },
                child: const Text(
                  "O’chirish",
                  style: TextStyle(color: red),
                ),
              ),
            ],
          ),
          const CustomTextField(
            title: "Ism va familiya",
            hintText: "Ism va familiya",
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            title: "Telefon raqam",
            hintText: "Telefon raqam",
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            title: "Elektron pochta manzili",
            hintText: "Elektron pochta manzili",
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: "Manzil",
            hintText: "Manzil",
            suffixIcon: AppIcons.finishLocation.svg(),
          ),
          const SizedBox(height: 16),
          WButton(
            onTap: () {},
            text: "Saqlash",
          )
        ],
      ),
    );
  }
}
