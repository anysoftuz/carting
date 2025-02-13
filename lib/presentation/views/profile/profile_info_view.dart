import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/presentation/views/auth/identity_choose_view.dart';
import 'package:carting/presentation/views/profile/edit_phone_view.dart';
import 'package:carting/presentation/widgets/custom_snackbar.dart';
import 'package:carting/utils/log_service.dart';
import 'package:carting/utils/resize_image.dart';
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
  late TextEditingController controllerTG;
  late TextEditingController controllerReferal;
  late TextEditingController controllerOrgName;
  late TextEditingController controllerCallPhone;
  late TextEditingController controllerTin;
  File? images;
  ValueNotifier<bool> isChange = ValueNotifier(false);

  void imagesFile() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final images2 = File(image.path);
      final compressedFile = await resizeAndCompressImage(images2, 1000000);
      images = compressedFile;
      Log.i('Siqilgan fayl: ${await MyFunction.convertFileToBase64(images)}');
      Log.i('Yangi hajmi: ${compressedFile.lengthSync()} bayt');
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
      text: context.read<AuthBloc>().state.userModel.phoneNumber.isNotEmpty
          ? MyFunction.formatPhoneNumber(
              context.read<AuthBloc>().state.userModel.phoneNumber,
            )
          : '',
    );
    controllerTG = TextEditingController(
      text: 't.me/${context.read<AuthBloc>().state.userModel.tgLink}',
    );
    controllerReferal = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.referredBy,
    );
    controllerOrgName = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.fullName,
    );
    controllerCallPhone = TextEditingController(
      text: MyFunction.formatPhoneNumber(
        context.read<AuthBloc>().state.userModel.callPhone,
      ),
    );
    controllerTin = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.tin == null
          ? ''
          : context.read<AuthBloc>().state.userModel.tin.toString(),
    );
    // controllerName = TextEditingController(text: context.read<AuthBloc>().state.userModel.lastName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.personalInformation)),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return ValueListenableBuilder(
              valueListenable: isChange,
              builder: (context, _, __) {
                return WButton(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  onTap: () async {
                    final text = await MyFunction.convertFileToBase64(images);
                    if (context.mounted) {
                      context.read<AuthBloc>().add(UpdateUserEvent(
                            name: controllerName.text,
                            lastName: controllerLastName.text,
                            phone: MyFunction.convertPhoneNumber(
                              controllerPhone.text,
                            ),
                            images: text,
                            tgName: controllerTG.text,
                            onSucces: () {},
                            onError: () {
                              CustomSnackbar.show(
                                context,
                                'Malumot yuklanmadi',
                              );
                            },
                          ));
                    }
                  },
                  isDisabled: !isChange.value,
                  isLoading: state.statusSms.isInProgress,
                  text: AppLocalizations.of(context)!.save,
                );
              },
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
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Hero(
                        tag: "avatar",
                        child: CircleAvatar(
                          radius: 56,
                          backgroundImage: images != null
                              ? FileImage(images!)
                              : state.userModel.photo.isEmpty
                                  ? null
                                  : CachedNetworkImageProvider(
                                      'https://api.carting.uz/uploads/files/${state.userModel.photo}',
                                    ),
                        ),
                      );
                    },
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
            title: AppLocalizations.of(context)!.personal,
            hintText: "",
            controller: TextEditingController(
              text: context.read<AuthBloc>().state.userModel.type != 'PHYSICAL'
                  ? AppLocalizations.of(context)!.physical
                  : AppLocalizations.of(context)!.legal,
            ),
            suffixIcon: AppIcons.edit.svg(),
            readOnly: true,
            onsuffixIconPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => IdentityChooseView(
                  isLegal: context.read<AuthBloc>().state.userModel.type ==
                      'PHYSICAL',
                ),
              ));
            },
          ),
          if (context.read<AuthBloc>().state.userModel.type == 'PHYSICAL') ...[
            const SizedBox(height: 16),
            CustomTextField(
              title: AppLocalizations.of(context)!.stir,
              hintText: AppLocalizations.of(context)!.stir,
              controller: controllerTin,
              onChanged: (value) {
                isChange.value = true;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: AppLocalizations.of(context)!.companyName,
              hintText: AppLocalizations.of(context)!.companyName,
              controller: controllerOrgName,
              onChanged: (value) {
                isChange.value = true;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: AppLocalizations.of(context)!.callCenterNumber,
              hintText: "+998 (__) ___-__-__",
              controller: controllerCallPhone,
              keyboardType: TextInputType.phone,
              formatter: [Formatters.phoneFormatter],
              onChanged: (value) {
                isChange.value = true;
              },
            ),
          ] else ...[
            const SizedBox(height: 16),
            CustomTextField(
              title: AppLocalizations.of(context)!.yourName,
              hintText: AppLocalizations.of(context)!.yourName,
              controller: controllerName,
              onChanged: (value) {
                isChange.value = true;
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: AppLocalizations.of(context)!.yourSurname,
              hintText: AppLocalizations.of(context)!.yourSurname,
              controller: controllerLastName,
              onChanged: (value) {
                isChange.value = true;
              },
            ),
          ],
          const SizedBox(height: 16),
          CustomTextField(
            title: AppLocalizations.of(context)!.phoneNumber,
            hintText: "+998 (__) ___-__-__",
            controller: controllerPhone,
            keyboardType: TextInputType.phone,
            formatter: [Formatters.phoneFormatter],
            suffixIcon: AppIcons.edit.svg(),
            readOnly: true,
            onsuffixIconPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditPhoneView(),
              ));
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: AppLocalizations.of(context)!.telegram,
            hintText: "t.me/",
            controller: controllerTG,
            onChanged: (value) {
              isChange.value = true;
            },
          ),
          const SizedBox(height: 16),
          if (context
              .read<AuthBloc>()
              .state
              .userModel
              .username
              .contains('@')) ...[
            CustomTextField(
              title: AppLocalizations.of(context)!.email,
              hintText: AppLocalizations.of(context)!.email,
              readOnly: true,
              controller: TextEditingController(
                text: context
                        .read<AuthBloc>()
                        .state
                        .userModel
                        .username
                        .contains('@')
                    ? context.read<AuthBloc>().state.userModel.username
                    : '',
              ),
            ),
            const SizedBox(height: 16),
          ],
          CustomTextField(
            title: AppLocalizations.of(context)!.referalCode,
            hintText: AppLocalizations.of(context)!.enterCode,
            controller: controllerReferal,
            onChanged: (value) {
              isChange.value = true;
            },
          ),
        ],
      ),
    );
  }
}
