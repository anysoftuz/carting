import 'dart:async';
import 'dart:io';

import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/send_code_model.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/auth/identity_choose_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pinput/pinput.dart';

class SmsView extends StatefulWidget {
  const SmsView({
    super.key,
    required this.isRegister,
    required this.model,
    required this.phone,
  });
  final bool isRegister;
  final SendCodeModel model;
  final String phone;

  @override
  State<SmsView> createState() => _SmsViewState();
}

class _SmsViewState extends State<SmsView> {
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

  @override
  void initState() {
    controller = TextEditingController(text: widget.model.securityCode);
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    controller.delete();
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: Platform.isIOS ? 0 : 16),
          child: AppImages.logoTextDark.imgAsset(height: 24),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Kirish",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Text(
                "Tasdiqlash kodini +998******9763 raqamigayubordik. Quyidagi maydonga mobil kodingizni kiriting.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark.withValues(alpha: .3),
                ),
                textAlign: TextAlign.center,
              ),
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
                      : 'Pin is incorrect';
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
                    context.read<AuthBloc>().add(VerifyEvent(
                          phone: widget.phone,
                          onError: () {},
                          onSucces: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const IdentityChooseView(),
                            ));
                          },
                          sessionToken: widget.model.sessionToken,
                          securityCode: widget.model.securityCode,
                          isLogin: !widget.isRegister,
                        ));
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
                    return Text(
                      value == 0 ? "Qayta yuborish" : timerText,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: blue,
                      ),
                    );
                  },
                )
              ],
            )
            // ValueListenableBuilder(
            //   valueListenable: start,
            //   builder: (context, value, __) {
            //     return RichText(
            //       text: TextSpan(
            //         text: "SMS ko’dni olmadingizmi? Qaytadan yuborish  ",
            //         style: const TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w400,
            //           color: black,
            //         ),
            //         children: <TextSpan>[
            //           TextSpan(
            //             text: timerText,
            //             style: const TextStyle(
            //               fontSize: 16,
            //               fontWeight: FontWeight.w400,
            //               color: green,
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      // bottomNavigationBar: WButton(
      //   onTap: () {
      //     Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => const RegisterView(),
      //     ));
      //   },
      //   margin: EdgeInsets.fromLTRB(
      //     16,
      //     12,
      //     16,
      //     MediaQuery.of(context).viewPadding.bottom + 16,
      //   ),
      //   text: "Davom etish",
      // ),
    );
  }
}
