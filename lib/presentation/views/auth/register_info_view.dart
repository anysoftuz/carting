import 'package:carting/assets/assets/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/my_function.dart';

class RegisterInfoView extends StatefulWidget {
  const RegisterInfoView(
      {super.key, required this.isLegal, required this.phone});
  final bool isLegal;
  final String phone;

  @override
  State<RegisterInfoView> createState() => _RegisterInfoViewState();
}

class _RegisterInfoViewState extends State<RegisterInfoView> {
  late ValueNotifier<bool> isActive;
  late TextEditingController controllerName;
  late TextEditingController controllerLastName;
  late TextEditingController controllerPhone;
  @override
  void initState() {
    isActive = ValueNotifier(false);
    controllerName = TextEditingController();
    controllerLastName = TextEditingController();
    controllerPhone =
        TextEditingController(text: MyFunction.formatPhoneNumber(widget.phone));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controllerName.dispose();
    controllerLastName.dispose();
    controllerPhone.dispose();
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
                        if (controllerName.text.isNotEmpty &&
                            controllerLastName.text.isNotEmpty) {
                          context.read<AuthBloc>().add(RegisterUserEvent(
                                name: controllerName.text,
                                lastName: controllerLastName.text,
                                phone: MyFunction.convertPhoneNumber(
                                  controllerPhone.text,
                                ),
                                isUser: widget.isLegal,
                                onSucces: () {},
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
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Kompaniya nomi',
                    hintText: "Kompaniya nomi kiriting",
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: 'Telefon',
                    hintText: "+998",
                    onChanged: (value) {},
                  ),
                ]
              : [
                  CustomTextField(
                    title: AppLocalizations.of(context)!.firstName,
                    hintText: "Ismingizni kiriting",
                    controller: controllerName,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: AppLocalizations.of(context)!.lastName,
                    hintText: "Familiyangizni kiriting",
                    controller: controllerLastName,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    title: AppLocalizations.of(context)!.phoneNumer,
                    hintText: "+998",
                    controller: controllerPhone,
                    readOnly: true,
                    onChanged: (value) {},
                  ),
                ],
        ),
      ),
    );
  }
}
