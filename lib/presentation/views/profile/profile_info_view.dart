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
      bottomNavigationBar: SafeArea(
        child: WButton(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          onTap: () {},
          text: "Saqlash",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Hero(
                    tag: "avatar",
                    child: CircleAvatar(
                      radius: 56,
                      backgroundImage:
                          images != null ? FileImage(images!) : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: WButton(
                      onTap: () {
                        imagesFile();
                      },
                      height: 32,
                      width: 32,
                      color: white,
                      child: AppIcons.camera.svg(),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const CustomTextField(
            title: "Kompaniya nomi",
            hintText: "Kompaniya nomi",
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: "Telefon raqam",
            hintText: "Telefon raqam",
            suffixIcon: AppIcons.edit.svg(),
          ),
          const SizedBox(height: 16),
          const CustomTextField(
            title: "Telegram",
            hintText: "t.me/",
          ),
        ],
      ),
    );
  }
}
