import 'dart:io';

import 'package:carting/utils/log_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/formatters.dart';
import 'package:carting/utils/my_function.dart';

class ProfileInfoView extends StatefulWidget {
  const ProfileInfoView({super.key});

  @override
  State<ProfileInfoView> createState() => _ProfileInfoViewState();
}

class _ProfileInfoViewState extends State<ProfileInfoView> {
  late TextEditingController controllerName;
  late TextEditingController controllerLastName;
  late TextEditingController controllerFullName;
  late TextEditingController controllerPhone;
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
  void initState() {
    controllerName = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.firstName,
    );
    controllerLastName = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.lastName,
    );
    controllerPhone = TextEditingController(
      text: MyFunction.formatPhoneNumber(
        context.read<AuthBloc>().state.userModel.phoneNumber,
      ),
    );

    // controllerName = TextEditingController(text: context.read<AuthBloc>().state.userModel.lastName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.personalInformation),
      ),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return WButton(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              onTap: () {
                context.read<AuthBloc>().add(UpdateUserEvent(
                      name: controllerName.text,
                      lastName: controllerLastName.text,
                      phone: MyFunction.convertPhoneNumber(
                        controllerPhone.text,
                      ),
                      onSucces: () {},
                    ));
              },
              isLoading: state.statusSms.isInProgress,
              text: AppLocalizations.of(context)!.save,
            );
          },
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
          CustomTextField(
            title: "Ismingiz",
            hintText: "Ismingiz",
            controller: controllerName,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: "Familyangiz",
            hintText: "Familyangiz",
            controller: controllerLastName,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: "Telefon raqam",
            hintText: "Telefon raqam",
            controller: controllerPhone,
            keyboardType: TextInputType.phone,
            formatter: [Formatters.phoneFormatter],
            suffixIcon: AppIcons.edit.svg(),
            readOnly: true,
            onsuffixIconPressed: () {
              Log.i('message');
            },
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
