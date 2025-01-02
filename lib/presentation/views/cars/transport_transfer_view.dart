import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/location_model.dart';
import 'package:carting/data/models/transport_transfer_model.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class TransportTransferCreateView extends StatefulWidget {
  const TransportTransferCreateView({super.key});

  @override
  State<TransportTransferCreateView> createState() =>
      _TransportTransferCreateViewState();
}

class _TransportTransferCreateViewState
    extends State<TransportTransferCreateView> {
  late TextEditingController controller;
  late TextEditingController controllerCount;
  late TextEditingController controllerCommet;
  late TextEditingController controllerPrice;
  MapPoint? point1;
  MapPoint? point2;
  ValueNotifier<bool> payDate = ValueNotifier(true);
  ValueNotifier<int> trTypeId = ValueNotifier(0);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transport transferi")),
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
                  final model = TransportTransferModel(
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
                    serviceName: 'Transport transferi',
                    details: DetailsTransfer(
                      transportationTypeId: 1,
                      transportCount: int.tryParse(controllerCount.text) ?? 0,
                    ),
                    advType: 'RECEIVE',
                    serviceTypeId: 6,
                    shipmentDate: controller.text,
                    note: controllerCommet.text,
                    payType: payDate.value ? 'CASH' : 'CARD',
                    price: int.tryParse(
                            controllerPrice.text.replaceAll(' ', '')) ??
                        0,
                  ).toJson();
                  context.read<AdvertisementBloc>().add(CreateDeliveryEvent(
                        model: model,
                        onSucces: () {
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
              isLoading: state.statusCreate.isInProgress,
              margin: const EdgeInsets.all(16),
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
              text: "Transport soni",
              hintText: "Miqdorni kiriting",
              keyboardType: TextInputType.number,
              controller: controllerCount,
              formatter: [Formatters.numberFormat],
              onChanged: (value) {},
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
                      payDate: payDate,
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
            WSelectionItam(
              onTap: (int index) {
                trTypeId.value = index;
              },
            ),
          ],
        ),
      ),
    );
  }
}
