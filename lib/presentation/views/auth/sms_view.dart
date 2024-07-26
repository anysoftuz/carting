import 'dart:async';

import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/auth/register_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class SmsView extends StatefulWidget {
  const SmsView({super.key});

  @override
  State<SmsView> createState() => _SmsViewState();
}

class _SmsViewState extends State<SmsView> {
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
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String get timerText {
    int minutes = start.value ~/ 60;
    int seconds = start.value % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Kodni tasdiqlash",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return value == '2222' ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
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
            const SizedBox(height: 20),
            ValueListenableBuilder(
                valueListenable: start,
                builder: (context, value, __) {
                  return RichText(
                    text: TextSpan(
                      text: "SMS ko’dni olmadingizmi? Qaytadan yuborish  ",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: timerText,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: green,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: WButton(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const RegisterView(),
          ));
        },
        margin: EdgeInsets.fromLTRB(
          16,
          12,
          16,
          MediaQuery.of(context).viewPadding.bottom + 16,
        ),
        text: "Davom etish",
      ),
    );
  }
}
