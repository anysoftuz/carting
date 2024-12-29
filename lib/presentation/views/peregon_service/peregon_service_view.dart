import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/presentation/views/peregon_service/additional_information_view.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/selection_location_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_claendar.dart';
import 'package:carting/utils/formatters.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

class PeregonServiceView extends StatefulWidget {
  const PeregonServiceView({super.key});

  @override
  State<PeregonServiceView> createState() => _PeregonServiceViewState();
}

class _PeregonServiceViewState extends State<PeregonServiceView> {
  late TextEditingController controller;
  late TextEditingController controllerCommet;
  late TextEditingController controllerPrice;
  MapPoint? point1;
  MapPoint? point2;

  @override
  void initState() {
    controller = TextEditingController();
    controllerCommet = TextEditingController();
    controllerPrice = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controllerCommet.dispose();
    controllerPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Peregon xizmati")),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {
            if (controllerPrice.text.isEmpty &&
                point1 == null &&
                point2 == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Ma'lumotlarni to'liq kirgazing"),
                ),
              );
            } else {
              Navigator.of(context).pop();
            }
          },
          margin: const EdgeInsets.all(16),
          text: AppLocalizations.of(context)!.register,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SelectionLocationField(
              onTap1: (point) {
                point1 = point;
              },
              onTap2: (point) {
                point2 = point;
              },
            ),
            const SizedBox(height: 8),
            MinTextField(
              text: "Jo‘natish sanasi",
              hintText: "",
              controller: controller,
              keyboardType: TextInputType.datetime,
              formatter: [Formatters.dateFormatter],
              prefixIcon: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
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
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdditionalInformationView(
                      controllerCommet: controllerCommet,
                      controllerPrice: controllerPrice,
                    ),
                  ));
                },
                title: const Text("Qo‘shimcha ma’lumotlar"),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withValues(alpha: .3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitle: const Text("Izoh, to‘lov turi, narx"),
                trailing: AppIcons.arrowForward.svg(),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
