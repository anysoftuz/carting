import 'dart:io';

import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/peregon_model.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/presentation/views/peregon_service/additional_information_view.dart';
import 'package:carting/presentation/widgets/custom_snackbar.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/selection_location_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_claendar.dart';
import 'package:carting/utils/formatters.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PeregonServiceView extends StatefulWidget {
  const PeregonServiceView({super.key});

  @override
  State<PeregonServiceView> createState() => _PeregonServiceViewState();
}

class _PeregonServiceViewState extends State<PeregonServiceView> {
  List<File> images = [];
  late TextEditingController controller;
  late TextEditingController controllerCommet;
  late TextEditingController controllerPrice;
  MapPoint? point1;
  MapPoint? point2;
  ValueNotifier<bool> payDate = ValueNotifier(true);

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
    payDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.peregonService)),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {
            if (point1 != null &&
                point2 != null &&
                controllerPrice.text.isNotEmpty &&
                controller.text.isNotEmpty) {
              final model = PeregonModel(
                toLocation: Location(
                  lat: point2!.latitude,
                  lng: point2!.longitude,
                  name: point2!.name,
                ),
                fromLocation: Location(
                  lat: point1!.latitude,
                  lng: point1!.longitude,
                  name: point1!.name,
                ),
                serviceName: 'Peregon xizmati',
                advType: 'RECEIVE',
                serviceTypeId: 10,
                shipmentDate: controller.text,
                note: controllerCommet.text,
                payType: payDate.value ? 'CASH' : 'CARD',
                price:
                    int.tryParse(controllerPrice.text.replaceAll(' ', '')) ?? 0,
              ).toJson();
              context.read<AdvertisementBloc>().add(CreateDeliveryEvent(
                    model: model,
                    images: images,
                    onSucces: (id) {
                      Navigator.pop(context);
                    },
                  ));
            } else {
              CustomSnackbar.show(
                context,
                "Kerakli ma'lumotlarni kirgazing",
              );
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
              text: AppLocalizations.of(context)!.departureDate,
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
                color: context.color.contColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdditionalInformationView(
                      controllerCommet: controllerCommet,
                      controllerPrice: controllerPrice,
                      payDate: payDate,
                      images: images,
                      onSave: (list) {
                        setState(() {
                          images = list;
                        });
                      },
                    ),
                  ));
                },
                title: Text(AppLocalizations.of(context)!.additionalInfo),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: context.color.darkText,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitle: Text(
                    "${AppLocalizations.of(context)!.description}, to‘lov turi, narx"),
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
