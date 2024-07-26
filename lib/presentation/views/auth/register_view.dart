import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/views/profile/theme_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  ValueNotifier<int> selectIndex = ValueNotifier(0);
  ValueNotifier<bool> check = ValueNotifier(false);
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
              "Ro'yxatdan o'tish",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Siz kimsiz?",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: selectIndex,
              builder: (context, value, __) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ThemeIteam(
                      selectIndex: selectIndex,
                      value: value,
                      index: 0,
                      title: 'Yuk yuboruvchi',
                    ),
                    const SizedBox(height: 8),
                    ThemeIteam(
                      selectIndex: selectIndex,
                      value: value,
                      index: 1,
                      title: 'Haydovchi',
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 16),
            CustomTextField(
              title: "Ism va familiyangiz",
              hintText: "Ism va familiyangiz",
              onChanged: (value) {},
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          12,
          16,
          MediaQuery.of(context).viewPadding.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteSmoke,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: check,
                    builder: (context, value, __) {
                      return Checkbox(
                        value: value,
                        activeColor: green,
                        onChanged: (value) {
                          check.value = value ?? false;
                        },
                      );
                    },
                  ),
                  const Text(
                    "Foydalanish shartlariga roziman",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder(
              valueListenable: check,
              builder: (context, value, __) {
                return WButton(
                  onTap: () {
                    context.go(
                      selectIndex.value == 0
                          ? AppRouteName.home
                          : AppRouteName.homeDeliver,
                    );
                  },
                  isDisabled: !value,
                  text: "Davom etish",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
