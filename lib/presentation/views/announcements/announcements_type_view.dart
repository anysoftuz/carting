import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/announcements/announcement_create_view.dart';
import 'package:carting/presentation/views/announcements/announcements_shipping_type_view.dart';
import 'package:carting/presentation/views/announcements/announcements_transport_rental_view.dart';
import 'package:carting/presentation/views/announcements/announcements_transportation_of_passengers_view.dart';
import 'package:carting/presentation/views/auto_repair/auto_repair_view.dart';
import 'package:carting/presentation/views/cars/special_technique_view.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:carting/presentation/views/transport_transfer/transport_transfer_view.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementsTypeView extends StatefulWidget {
  const AnnouncementsTypeView({super.key, required this.bloc});
  final AdvertisementBloc bloc;

  @override
  State<AnnouncementsTypeView> createState() => _AnnouncementsTypeViewState();
}

class _AnnouncementsTypeViewState extends State<AnnouncementsTypeView> {
  late List<TypeOfService> list;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = [
      TypeOfService(
        icon: AppIcons.shipping.svg(
          height: 40,
          width: 40,
        ),
        text: AppLocalizations.of(context)!.shipping,
        screen: const AnnouncementsShippingTypeView(),
        serviceId: 1,
      ),
      TypeOfService(
        icon: AppIcons.transportationOfPassengers.svg(
          height: 40,
          width: 40,
        ),
        text: AppLocalizations.of(context)!.passengerTransport,
        screen: const AnnouncementsTransportationOfPassengersView(),
        serviceId: 2,
      ),
      TypeOfService(
        icon: AppIcons.car_3.svg(),
        text: AppLocalizations.of(context)!.carRental,
        screen: const AnnouncementsTransportRentalView(),
        serviceId: 3,
      ),
      TypeOfService(
        icon: AppIcons.specialTechnique.svg(
          height: 40,
          width: 40,
        ),
        text: AppLocalizations.of(context)!.specialTechServices,
        screen: const SpecialTechniqueView(isCreate: true),
        serviceId: 3,
      ),
      TypeOfService(
        icon: AppIcons.autoRepair.svg(),
        text: AppLocalizations.of(context)!.autoRepair,
        screen: const AutoRepairView(isCreate: true),
        serviceId: 5,
      ),
      TypeOfService(
        icon: AppIcons.transportationTransfer.svg(),
        text: AppLocalizations.of(context)!.transportTransfer,
        screen: const TransportTransferView(isCreate: true),
        serviceId: 6,
      ),
      TypeOfService(
        icon: AppIcons.inTheWarehouseStorage.svg(),
        text: AppLocalizations.of(context)!.warehouseStorage,
        screen: const AnnouncementCreateView(
          filter: TypeOfServiceEnum.storageInWarehouse,
          carId: 0,
        ),
        serviceId: 7,
      ),
      TypeOfService(
        icon: AppIcons.fuelDeliver.svg(),
        text: AppLocalizations.of(context)!.fuelDelivery,
        screen: const AnnouncementCreateView(
          filter: TypeOfServiceEnum.fuelDelivery,
          carId: 0,
        ),
        serviceId: 8,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.serviceType)),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 120,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => BlocProvider.value(
                value: widget.bloc,
                child: list[index].screen,
              ),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: context.color.contColor,
              boxShadow: wboxShadow,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: MediaQuery.sizeOf(context).width / 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                list[index].icon,
                const SizedBox(height: 4),
                Text(
                  list[index].text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
