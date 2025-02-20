import 'dart:io';

import 'package:carting/presentation/widgets/custom_snackbar.dart';
import 'package:carting/utils/formatters.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/my_function.dart';

class RegisterInfoView extends StatefulWidget {
  const RegisterInfoView({
    super.key,
    required this.isLegal,
  });
  final bool isLegal;

  @override
  State<RegisterInfoView> createState() => _RegisterInfoViewState();
}

class _RegisterInfoViewState extends State<RegisterInfoView> {
  late ValueNotifier<bool> isActive;
  late TextEditingController controllerName;
  late TextEditingController controllerLastName;
  late TextEditingController controllerPhone;
  late TextEditingController controllerTin;
  late TextEditingController controllerOrgName;
  late TextEditingController controllerCallPhone;

  late TextEditingController controllerEmail;
  late TextEditingController controllerReferal;
  @override
  void initState() {
    isActive = ValueNotifier(false);
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
    controllerCallPhone = TextEditingController(
      text: MyFunction.formatPhoneNumber(
        context.read<AuthBloc>().state.userModel.callPhone,
      ),
    );
    controllerOrgName = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.fullName,
    );
    controllerTin = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.tin == null
          ? ''
          : context.read<AuthBloc>().state.userModel.tin.toString(),
    );
    controllerReferal = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.referredBy,
    );
    controllerEmail = TextEditingController(
      text: context.read<AuthBloc>().state.userModel.mail,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controllerName.dispose();
    controllerLastName.dispose();
    controllerPhone.dispose();
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
    if (widget.isLegal) {
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
        title: Text(
          widget.isLegal
              ? "Yuridik shaxs ma’lumotlari"
              : "Jismoniy shaxs ma’lumotlari",
        ),
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
                          isActive.value = !value;
                          if (isActive.value) {
                            _openDocxFromAssets('carting.docx');
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
                  valueListenable: isActive,
                  builder: (context, value, __) {
                    return WButton(
                      onTap: () {
                        if (checkInfo()) {
                          context.read<AuthBloc>().add(UpdateUserEvent(
                                name: controllerName.text,
                                lastName: controllerLastName.text,
                                phone: controllerPhone.text,
                                orgName: controllerOrgName.text,
                                tin: controllerTin.text,
                                referredBy: controllerReferal.text,
                                callPhone: MyFunction.convertPhoneNumber(
                                  controllerCallPhone.text,
                                ),
                                userType: widget.isLegal ? 'LEGAL' : 'PHYSICAL',
                                onSucces: () {},
                                onError: () {
                                  CustomSnackbar.show(
                                    context,
                                    AppLocalizations.of(context)!.infoNotFound,
                                  );
                                },
                              ));
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text("Malumotlarni to'ldiring"),
                          ));
                        }
                      },
                      isDisabled: !value,
                      isLoading: state.statusSms.isInProgress,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      text: AppLocalizations.of(context)!.register,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: widget.isLegal
              ? [
                  CustomTextField(
                    title: 'STIR',
                    hintText: "STIR kiriting",
                    controller: controllerTin,
                    isRequired: true,
                    keyboardType: TextInputType.number,
                    formatter: [Formatters.innFormat],
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Kompaniya nomi',
                    hintText: "Kompaniya nomi kiriting",
                    controller: controllerOrgName,
                    isRequired: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  if (controllerPhone.text.isNotEmpty) ...[
                    CustomTextField(
                      title: AppLocalizations.of(context)!.phoneNumer,
                      hintText: "+998",
                      readOnly: true,
                      controller: controllerPhone,
                      isRequired: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                  ],
                  CustomTextField(
                    title: 'Номер колл-центра',
                    hintText: "+998",
                    formatter: [Formatters.phoneFormatter],
                    keyboardType: TextInputType.phone,
                    controller: controllerCallPhone,
                    isRequired: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  if (controllerEmail.text.isNotEmpty) ...[
                    CustomTextField(
                      title: AppLocalizations.of(context)!.email,
                      hintText: "",
                      readOnly: true,
                      controller: controllerEmail,
                      isRequired: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                  ],
                  CustomTextField(
                    title: AppLocalizations.of(context)!.referalCode,
                    hintText: AppLocalizations.of(context)!.enterCode,
                    controller: controllerReferal,
                    readOnly: controllerReferal.text.isNotEmpty,
                    onChanged: (value) {},
                  ),
                ]
              : [
                  CustomTextField(
                    title: AppLocalizations.of(context)!.firstName,
                    hintText: "Ismingizni kiriting",
                    controller: controllerName,
                    isRequired: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: AppLocalizations.of(context)!.lastName,
                    hintText: "Familiyangizni kiriting",
                    controller: controllerLastName,
                    isRequired: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: AppLocalizations.of(context)!.phoneNumer,
                    hintText: "+998",
                    controller: controllerPhone,
                    readOnly: true,
                    isRequired: true,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  if (controllerEmail.text.isNotEmpty) ...[
                    CustomTextField(
                      title: AppLocalizations.of(context)!.email,
                      hintText: "",
                      readOnly: true,
                      controller: controllerEmail,
                      isRequired: true,
                      onChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                  ],
                  CustomTextField(
                    title: AppLocalizations.of(context)!.referalCode,
                    hintText: AppLocalizations.of(context)!.enterCode,
                    controller: controllerReferal,
                    readOnly: controllerReferal.text.isNotEmpty,
                    onChanged: (value) {},
                  ),
                ],
        ),
      ),
    );
  }
}
