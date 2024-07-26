import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeDeliverView extends StatefulWidget {
  const HomeDeliverView({super.key});

  @override
  State<HomeDeliverView> createState() => _HomeDeliverViewState();
}

class _HomeDeliverViewState extends State<HomeDeliverView> {
  ValueNotifier<int> value = ValueNotifier(0);
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();

  void swapAddresses() {
    String temp = fromController.text;
    fromController.text = toController.text;
    toController.text = temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assalamu alaykum!"),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRouteName.notification);
            },
            icon: AppIcons.notifications.svg(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            
            Container(
              decoration: BoxDecoration(
                color: whiteSmoke,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 88,
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: fromController,
                      decoration: const InputDecoration(
                        labelText: 'Viloyatlar aro qatnov',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: 'Viloyat tanlanmagan',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: AppIcons.chevronRight.svg(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: whiteSmoke,
                borderRadius: BorderRadius.circular(20),
              ),
              height: 88,
              width: double.infinity,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: fromController,
                      decoration: const InputDecoration(
                        labelText: 'Shahar va tuman ichida qatnov',
                        labelStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: 'Tanlanmagan',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: AppIcons.chevronRight.svg(),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            WButton(
              onTap: () {},
              text: "Davom etish",
            )
          ],
        ),
      ),
    );
  }
}

