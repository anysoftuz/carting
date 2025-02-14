import 'dart:io';

import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/delivery_create_model.dart';
import 'package:carting/data/models/location_model.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/presentation/views/peregon_service/additional_information_view.dart';
import 'package:carting/presentation/widgets/custom_snackbar.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/selection_location_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_claendar.dart';
import 'package:carting/presentation/widgets/w_selection_iteam.dart';
import 'package:carting/utils/formatters.dart';
import 'package:carting/utils/my_function.dart';

class DeliveryView extends StatefulWidget {
  const DeliveryView({super.key});

  @override
  State<DeliveryView> createState() => _DeliveryViewState();
}

class _DeliveryViewState extends State<DeliveryView> {
  List<File> images = [];
  late TextEditingController controller;
  late TextEditingController controllerCount;
  late TextEditingController controllerCommet;
  late TextEditingController controllerPrice;
  String selectedUnit = 'kg';
  MapPoint? point1;
  MapPoint? point2;
  ValueNotifier<bool> payDate = ValueNotifier(true);
  ValueNotifier<int> trTypeId = ValueNotifier(0);
  ValueNotifier<int> loadTypeId = ValueNotifier(1);
  ValueNotifier<int> loadServiceId = ValueNotifier(1);
  @override
  void initState() {
    controller = TextEditingController();
    controllerCommet = TextEditingController();
    controllerPrice = TextEditingController();
    controllerCount = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    controllerCommet.dispose();
    controllerPrice.dispose();
    controllerCount.dispose();
    payDate.dispose();
    trTypeId.dispose();
    loadTypeId.dispose();
    loadServiceId.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.delivery)),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<AdvertisementBloc, AdvertisementState>(
          builder: (context, state) {
            return WButton(
              onTap: () {
                if (point1 != null &&
                    point2 != null &&
                    controllerCount.text.isNotEmpty &&
                    controllerPrice.text.isNotEmpty &&
                    controller.text.isNotEmpty) {
                  final model = DeliveryCreateModel(
                    toLocation: LocationModel(
                      lat: point2!.latitude,
                      lng: point2!.longitude,
                      name: point2!.name,
                    ),
                    fromLocation: LocationModel(
                      lat: point1!.latitude,
                      lng: point1!.longitude,
                      name: point1!.name,
                    ),
                    serviceName: 'Yetkazib berish',
                    details: Details(
                      transportationTypeId:
                          state.transportationTypes[trTypeId.value].id,
                      loadTypeId: '${loadTypeId.value}',
                      loadServiceId: '${loadServiceId.value}',
                      loadWeight: LoadWeight(
                        amount: int.tryParse(controllerCount.text) ?? 0,
                        name: selectedUnit,
                      ),
                    ),
                    advType: 'RECEIVE',
                    serviceTypeId: 9,
                    shipmentDate: controller.text,
                    note: controllerCommet.text,
                    payType: payDate.value ? 'CASH' : 'CARD',
                    price: int.tryParse(
                            controllerPrice.text.replaceAll(' ', '')) ??
                        0,
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
              isLoading: state.statusCreate.isInProgress,
              text: AppLocalizations.of(context)!.register,
            );
          },
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
              text: AppLocalizations.of(context)!.loadWeight,
              hintText: "0",
              controller: controllerCount,
              keyboardType: TextInputType.number,
              formatter: [Formatters.numberFormat],
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
                      shadowColor: black.withValues(alpha: .3),
                      // menuPadding: const EdgeInsets.symmetric(vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      items: ['kg', 'm³', 'litr'].map(
                        (String choice) {
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
                        },
                      ).toList(),
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
                      AppIcons.arrowBottom.svg(
                        color: context.color.darkText,
                      ),
                    ],
                  ),
                ),
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            MinTextField(
              text: AppLocalizations.of(context)!.departureDate,
              hintText: "",
              keyboardType: TextInputType.datetime,
              controller: controller,
              readOnly: true,
              formatter: [Formatters.dateFormatter],
              prefixIcon: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
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
                color: context.color.contColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: Text(AppLocalizations.of(context)!.additionalInfo),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AdditionalInformationView(
                      isDelivery: true,
                      controllerCommet: controllerCommet,
                      controllerPrice: controllerPrice,
                      loadServiceId: loadServiceId,
                      loadTypeId: loadTypeId,
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
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: context.color.darkText,
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                subtitle: Text(
                  "${AppLocalizations.of(context)!.cargoType}, rasmi, ${AppLocalizations.of(context)!.cargoLoadingService}, to‘lov",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: AppIcons.arrowForward.svg(),
              ),
            ),
            const SizedBox(height: 8),
            WSelectionItam(
              onTap: (index) {
                trTypeId.value = index;
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
