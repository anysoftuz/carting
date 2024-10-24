import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/common/location_view.dart';
import 'package:carting/presentation/views/peregon_service/additional_information_view.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class SpecialTechnicalServicesView extends StatefulWidget {
  const SpecialTechnicalServicesView({super.key});

  @override
  State<SpecialTechnicalServicesView> createState() =>
      _SpecialTechnicalServicesViewState();
}

class _SpecialTechnicalServicesViewState
    extends State<SpecialTechnicalServicesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maxsus texnika xizmatlari")),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LocationView(
                isOne: true,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AdditionalInformationView(),
                  ));
                },
              ),
            ));
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
              child: ListTile(
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
                    fontWeight: FontWeight.w500,
                    color: dark,
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LocationView(
                        isOne: true,
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
            ),
            const SizedBox(height: 8),
            MinTextField(
              text: "Qaysi sanadan",
              prefixIcon: AppIcons.calendar.svg(
                height: 24,
                width: 24,
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            MinTextField(
              text: "Qaysi sanagacha",
              prefixIcon: AppIcons.calendar.svg(
                height: 24,
                width: 24,
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: const Text("Qo‘shimcha ma’lumotlar"),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: dark,
                ),
                subtitle: const Text("Izoh, to‘lov turi, narx"),
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
                subtitle: const Text("Бульдозер"),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: dark,
                ),
                trailing: AppImages.bulldozer.imgAsset(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
