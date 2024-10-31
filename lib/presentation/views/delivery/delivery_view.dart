import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/common/location_view.dart';
import 'package:carting/presentation/views/peregon_service/additional_information_view.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_claendar.dart';
import 'package:carting/utils/formatters.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

class DeliveryView extends StatefulWidget {
  const DeliveryView({super.key});

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  late TextEditingController controller;
  String selectedUnit = 'kg';
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yetkazib berish")),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {
            Navigator.of(context).pop();
          },
          margin: const EdgeInsets.all(16),
          text: "Ro‘yxatdan o‘tish",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Qayerdan",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: dark.withOpacity(.3),
                      ),
                    ),
                    subtitle: const Text(
                      "Toshkent, Yakkasaroy tumani",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: dark,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocationView(
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: green,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: AppIcons.location.svg(
                          height: 24,
                          width: 24,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(height: 1),
                  ),
                  ListTile(
                    title: Text(
                      "Qayerga",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: dark.withOpacity(.3),
                      ),
                    ),
                    subtitle: const Text(
                      "Toshkent, Yakkasaroy tumani",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: dark,
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LocationView(
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: green,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: AppIcons.location.svg(
                          height: 24,
                          width: 24,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            MinTextField(
              text: "Yuk vazni",
              hintText: "0",
              keyboardType: TextInputType.number,
              formatter: [Formatters.numberFormat],
              // suffixIcon: const Text(
              //   "kg",
              //   style: TextStyle(
              //     fontSize: 16,
              //     fontWeight: FontWeight.w400,
              //     color: dark,
              //   ),
              // ),
              suffixIcon: Builder(
                builder: (context) => GestureDetector(
                  onTap: () async {
                    final RenderBox button =
                        context.findRenderObject() as RenderBox;
                    final RenderBox overlay = Overlay.of(context)
                        .context
                        .findRenderObject() as RenderBox;

                    final RelativeRect position = RelativeRect.fromRect(
                      Rect.fromPoints(
                        button.localToGlobal(Offset(0, button.size.height),
                            ancestor: overlay),
                        button.localToGlobal(
                            button.size.bottomRight(Offset.zero),
                            ancestor: overlay),
                      ),
                      Offset.zero & overlay.size,
                    );

                    String? selected = await showMenu<String>(
                      context: context,
                      position: position,
                      color: white,
                      shadowColor: black.withOpacity(.3),
                      // menuPadding: const EdgeInsets.symmetric(vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      items: ['kg', 'm³', 'litr'].map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          height: 40,
                          child: SizedBox(
                            width: 140,
                            child: Row(
                              children: [
                                Text(choice),
                                const Spacer(),
                                SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: choice == selectedUnit
                                      ? AppIcons.checkboxRadio.svg(
                                          height: 20,
                                          width: 20,
                                        )
                                      : AppIcons.checkboxRadioDis.svg(
                                          height: 20,
                                          width: 20,
                                        ),
                                )
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );

                    if (selected != null) {
                      setState(() {
                        selectedUnit = selected;
                      });
                    }
                  },
                  child: Row(
                    children: [
                      Text(
                        selectedUnit,
                        style: const TextStyle(color: Colors.black),
                      ),
                      AppIcons.arrowBottom.svg(color: dark.withOpacity(.3)),
                    ],
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            MinTextField(
              text: "Jo‘natish sanasi",
              hintText: "",
              keyboardType: TextInputType.datetime,
              controller: controller,
              formatter: [Formatters.dateFormatter],
              prefixIcon: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => const WClaendar(),
                  ).then(
                    (value) {
                      if (value != null) {
                        controller.text = MyFunction.dateFormat(value);
                      }
                    },
                  );
                },
                child: AppIcons.calendar.svg(
                  height: 24,
                  width: 24,
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: const Text("Qo‘shimcha ma’lumotlar"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AdditionalInformationView(),
                  ));
                },
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitle: const Text(
                  "Yuk turi, rasmi, yuklash xizmati, to‘lov",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: AppIcons.arrowForward.svg(),
              ),
            ),
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: const Text("Transport turi"),
                subtitle: const Text("Furgon 4.8x2.05x1.92"),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                trailing: AppImages.truck.imgAsset(),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
