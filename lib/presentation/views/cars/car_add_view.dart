import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/orders/orders_info_deliver_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/formatters.dart';
import 'package:flutter/material.dart';

class CarAddView extends StatefulWidget {
  const CarAddView({super.key});

  @override
  State<CarAddView> createState() => _CarAddViewState();
}

class _CarAddViewState extends State<CarAddView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transport malumotlari")),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16).copyWith(
          bottom: MediaQuery.of(context).viewPadding.bottom,
        ),
        child: WButton(
          onTap: () {},
          text: "Transportni qo’shish",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Transport davlat raqami",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  height: 64,
                  width: 72,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(20),
                    ),
                    border: Border.all(color: grey),
                    color: whiteSmoke,
                  ),
                  alignment: Alignment.center,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [Formatters.carNum2],
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: dark,
                    ),
                    decoration: InputDecoration(
                      hintText: '00',
                      hintStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: dark.withOpacity(.5),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 64,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(20),
                      ),
                      border: Border.all(color: grey),
                      color: whiteSmoke,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.streetAddress,
                            inputFormatters: [Formatters.carNum],
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: dark,
                            ),
                            decoration: InputDecoration(
                              hintText: 'A 000 AA',
                              hintStyle: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: dark.withOpacity(.5),
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppImages.uzbekistan.imgAsset(
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(height: 4),
                            const Text(
                              "UZ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 96,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Seriya",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: "AA",
                          formatter: [Formatters.seriya],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Texpasport raqami",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          hintText: "0000000",
                          keyboardType: TextInputType.number,
                          formatter: [Formatters.texseriya],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: green.withOpacity(.2),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  AppIcons.checkVerified.svg(),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      "Tasdiqlangan transport!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteSmoke,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  OrdersInfoTile(
                    title: 'Transport turi',
                    subtitle: 'Грузовик',
                  ),
                  SizedBox(height: 16),
                  OrdersInfoTile(
                    title: 'Brendi',
                    subtitle: 'UZ OTOYOL',
                  ),
                  SizedBox(height: 16),
                  OrdersInfoTile(
                    title: 'Modeli',
                    subtitle: 'G 265 XP',
                  ),
                  SizedBox(height: 16),
                  OrdersInfoTile(
                    title: 'Davlat raqami',
                    subtitle: '60 X 600 YX',
                  ),
                  SizedBox(height: 16),
                  OrdersInfoTile(
                    title: 'Kuzov turi',
                    subtitle: 'Temir',
                  ),
                  SizedBox(height: 16),
                  OrdersInfoTile(
                    title: 'Ishlab chiqarilgan yili',
                    subtitle: '2018',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
