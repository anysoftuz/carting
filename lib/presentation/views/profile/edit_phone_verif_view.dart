import 'dart:async';

import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/send_code_model.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_snackbar.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pinput/pinput.dart';

class EditPhoneVerifView extends StatefulWidget {
  const EditPhoneVerifView({
    super.key,
    required this.phone,
    required this.model,
  });
  final String phone;
  final SendCodeModel model;

  @override
  State<EditPhoneVerifView> createState() => _EditPhoneVerifViewState();
}

class _EditPhoneVerifViewState extends State<EditPhoneVerifView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController controller;
  ValueNotifier<int> start = ValueNotifier(60);
  late Timer _timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
        setState(() {});
      },
    );
  }

  void resetAndStartTimer() {
    setState(() {
      start.value = 60; // Boshlang'ich qiymatni qayta o'rnating
    });
    startTimer(); // Taymerni qayta ishga tushiring
  }

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  String get timerText {
    int minutes = start.value ~/ 60;
    int seconds = start.value % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Kodni kiriting!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Tasdiqlash kodini ${MyFunction.maskPhoneNumber(widget.phone)} raqamigayubordik. Quyidagi maydonga mobil kodingizni kiriting.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark.withValues(alpha: .3),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Pinput(
                  controller: controller,
                  separatorBuilder: (index) => const SizedBox(width: 8),
                  defaultPinTheme: PinTheme(
                    height: 56,
                    width: 64,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: white,
                    ),
                    padding: const EdgeInsets.all(8),
                  ),
                  validator: (value) {
                    return value == widget.model.securityCode
                        ? null
                        : 'Kod hato kiritildi';
                  },
                  hapticFeedbackType: HapticFeedbackType.lightImpact,
                  onCompleted: (pin) {
                    debugPrint('onCompleted: $pin');
                  },
                  onChanged: (value) {
                    debugPrint('onChanged: $value');
                    if (value.length > 2) {
                      setState(() {});
                    }
                  },
                  cursor: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        width: 22,
                        height: 1,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return WButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(UpdateUserEvent(
                              phone: widget.phone,
                              onError: () {
                                CustomSnackbar.show(
                                  context,
                                  AppLocalizations.of(context)!.infoNotFound,
                                );
                              },
                              onSucces: () {},
                              sessionToken: widget.model.sessionToken,
                              securityCode: widget.model.securityCode,
                            ));
                      } else {
                        CustomSnackbar.show(context, 'Kod hato kiritildi');
                      }
                    },
                    isLoading: state.statusSms.isInProgress,
                    isDisabled:
                        controller.text.isEmpty || controller.text.length < 4,
                    text: AppLocalizations.of(context)!.confirm,
                  );
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Kod olmadingizmi? ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: start,
                    builder: (context, value, __) {
                      return GestureDetector(
                        onTap: () {
                          resetAndStartTimer();
                        },
                        child: Text(
                          value == 0 ? "Qayta yuborish" : timerText,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: blue,
                          ),
                        ),
                      );
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
