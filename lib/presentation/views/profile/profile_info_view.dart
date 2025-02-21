import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
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
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

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
  late TextEditingController controllerEmail;
  File? images;
  ValueNotifier<bool> isChange = ValueNotifier(false);
  late ValueNotifier<bool> isActive;
  late ValueNotifier<bool> isLegal;

  void imagesFile() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final images2 = File(image.path);
      final compressedFile = await resizeAndCompressImage(images2, 1000000);
      images = compressedFile;
      Log.i('Siqilgan fayl: ${await MyFunction.convertFileToBase64(images)}');
      Log.i('Yangi hajmi: ${compressedFile.lengthSync()} bayt');
      isChange.value = true;
      setState(() {});
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    isActive = ValueNotifier(
      context.read<AuthBloc>().state.userModel.type.isNotEmpty,
    );
    isLegal = ValueNotifier(
      context.read<AuthBloc>().state.userModel.type == 'LEGAL',
    );
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
      text: context.read<AuthBloc>().state.userModel.tgLink.isEmpty
          ? 't.me/'
          : context.read<AuthBloc>().state.userModel.tgLink,
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
    controllerFullName = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.fullName,
    );
    controllerEmail = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.mail,
    );
    // controllerName = TextEditingController(text: context.read<AuthBloc>().state.userModel.lastName);
    super.initState();
  }

  Future<void> _openDocxFromAssets(String fileName) async {
    try {
      // 1. Faylni assetsdan o'qish
      ByteData data = await rootBundle.load('assets/documents/$fileName');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // 2. Faylni vaqtinchalik papkaga saqlash
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = '${tempDir.path}/$fileName';
      File tempFile = File(tempPath);
      await tempFile.writeAsBytes(bytes);

      // 3. Faylni ochish
      await OpenFilex.open(tempPath);
    } catch (e) {
      print('Xatolik: $e');
    }
  }

  bool checkInfo() {
    if (isLegal.value) {
      return controllerCallPhone.text.isNotEmpty &&
          controllerOrgName.text.isNotEmpty &&
          controllerTin.text.isNotEmpty;
    } else {
      return controllerName.text.isNotEmpty &&
          controllerLastName.text.isNotEmpty;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.personalInformation),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: context.color.contColor,
                  content: Text(
                    AppLocalizations.of(context)!.confirm_delete_account,
                  ),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                          child: WButton(
                            onTap: () {
                              Navigator.pop(context);
                              context.read<AuthBloc>().add(LogOutEvent());
                              Navigator.pop(context);
                            },
                            text: AppLocalizations.of(context)!.yes,
                            color: red,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: WButton(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            text: AppLocalizations.of(context)!.no,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
            },
            icon: AppIcons.trash.svg(),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                spacing: 8,
                children: [
                  ValueListenableBuilder(
                    valueListenable: isActive,
                    builder: (context, value, __) {
                      return GestureDetector(
                        onTap: () {
                          if (!value) {
                            isActive.value = !value;
                            if (isActive.value) {
                              _openDocxFromAssets('carting.docx');
                            }
                          }
                        },
                        child: value
                            ? AppIcons.checkboxRadioA.svg()
                            : AppIcons.checkboxRadioD.svg(),
                      );
                    },
                  ),
                  const Text(
                    "Foydalanish shartlariga roziman",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: blue,
                    ),
                  )
                ],
              ),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return ValueListenableBuilder(
                  valueListenable: isChange,
                  builder: (context, _, __) {
                    return WButton(
                      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      onTap: () async {
                        if (checkInfo()) {
                          final text =
                              await MyFunction.convertFileToBase64(images);
                          if (context.mounted) {
                            context.read<AuthBloc>().add(UpdateUserEvent(
                                  name: controllerName.text,
                                  lastName: controllerLastName.text,
                                  phone: MyFunction.convertPhoneNumber(
                                    controllerPhone.text,
                                  ),
                                  callPhone: MyFunction.convertPhoneNumber(
                                    controllerCallPhone.text,
                                  ),
                                  email: controllerEmail.text,
                                  userType:
                                      isLegal.value ? 'LEGAL' : 'PHYSICAL',
                                  images: images == null ? null : text,
                                  tgName: controllerTG.text,
                                  tin: controllerTin.text,
                                  referredBy: controllerReferal.text,
                                  orgName: controllerOrgName.text,
                                  onSucces: () {},
                                  onError: () {
                                    CustomSnackbar.show(
                                      context,
                                      AppLocalizations.of(context)!
                                          .infoNotFound,
                                    );
                                  },
                                ));
                          }
                        } else {
                          CustomSnackbar.show(
                            context,
                            "Malumotlarni to'ldiring",
                          );
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
          ],
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
          ValueListenableBuilder(
            valueListenable: isLegal,
            builder: (context, _, __) {
              return CustomTextField(
                title: AppLocalizations.of(context)!.personal,
                hintText: "",
                controller: TextEditingController(
                  text: !isLegal.value
                      ? AppLocalizations.of(context)!.physical
                      : AppLocalizations.of(context)!.legal,
                ),
                suffixIcon: AppIcons.edit.svg(color: context.color.iron),
                readOnly: true,
                onsuffixIconPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                    builder: (context) => IdentityChooseView(
                      isLegal: isLegal.value,
                    ),
                  ))
                      .then((value) {
                    if (value != null) {
                      isChange.value = true;
                      isLegal.value = value as bool;
                    }
                  });
                },
              );
            },
          ),
          ValueListenableBuilder(
            valueListenable: isLegal,
            builder: (context, value, child) => Column(
              children: [
                if (value) ...[
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: AppLocalizations.of(context)!.stir,
                    hintText: AppLocalizations.of(context)!.stir,
                    controller: controllerTin,
                    keyboardType: TextInputType.number,
                    formatter: [Formatters.innFormat],
                    onChanged: (value) {
                      isChange.value = true;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: AppLocalizations.of(context)!.companyName,
                    hintText: AppLocalizations.of(context)!.companyName,
                    controller: controllerOrgName,
                    isCap: true,
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
                    isCap: true,
                    onChanged: (value) {
                      isChange.value = true;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: AppLocalizations.of(context)!.yourSurname,
                    hintText: AppLocalizations.of(context)!.yourSurname,
                    controller: controllerLastName,
                    isCap: true,
                    onChanged: (value) {
                      isChange.value = true;
                    },
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: AppLocalizations.of(context)!.phoneNumber,
            hintText: "+998 (__) ___-__-__",
            controller: controllerPhone,
            keyboardType: TextInputType.phone,
            formatter: [Formatters.phoneFormatter],
            suffixIcon: AppIcons.edit.svg(color: context.color.iron),
            readOnly: true,
            onsuffixIconPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditPhoneView(),
              ));
            },
          ),
          ValueListenableBuilder(
            valueListenable: isLegal,
            builder: (context, value, child) {
              if (!value) {
                return const SizedBox();
              }
              return Column(
                children: [
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
                ],
              );
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
          CustomTextField(
            title: AppLocalizations.of(context)!.email,
            hintText: AppLocalizations.of(context)!.email,
            readOnly: true,
            controller: controllerEmail,
            suffixIcon: AppIcons.edit.svg(color: context.color.iron),
            onsuffixIconPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditPhoneView(isEmail: true),
              ));
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: AppLocalizations.of(context)!.referalCode,
            hintText: AppLocalizations.of(context)!.enterCode,
            controller: controllerReferal,
            readOnly: controllerReferal.text.isNotEmpty,
            onChanged: (value) {
              isChange.value = true;
            },
          ),
        ],
      ),
    );
  }
}
