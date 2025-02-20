import 'package:carting/assets/themes/theme_changer.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/transport_rental/cars_type_view.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/auto_repair/auto_repair_view.dart';
import 'package:carting/presentation/views/cars/transport_transfer_view.dart';
import 'package:carting/presentation/views/delivery/delivery_view.dart';
import 'package:carting/presentation/views/fuel_delivery/fuel_delivery_view.dart';
import 'package:carting/presentation/views/home/shipping_create_view.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:carting/presentation/views/passengers_transport/passengers_transport_view.dart';
import 'package:carting/presentation/views/peregon_service/peregon_service_view.dart';
import 'package:carting/presentation/views/special_technical_services/special_technical_services_view.dart';
import 'package:carting/presentation/views/storage_service/storage_service_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<TypeOfService> list;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = [
      TypeOfService(
        icon: AppIcons.delivery.svg(height: 40, width: 40),
        text: AppLocalizations.of(context)!.delivery,
        screen: const DeliveryView(),
        serviceId: 9,
      ),
      TypeOfService(
        icon: AppIcons.transportRental.svg(height: 40, width: 40),
        text: AppLocalizations.of(context)!.peregonService,
        screen: const PeregonServiceView(),
        serviceId: 10,
      ),
      TypeOfService(
        icon: AppIcons.shipping.svg(height: 40, width: 40),
        text: AppLocalizations.of(context)!.shipping,
        screen: const ShippingCreateView(),
        serviceId: 1,
      ),
      TypeOfService(
        icon: AppIcons.fuelDeliver.svg(),
        text: AppLocalizations.of(context)!.fuelDelivery,
        screen: const FuelDeliveryView(),
        serviceId: 8,
      ),
      TypeOfService(
        icon: AppIcons.transportationOfPassengers.svg(height: 40, width: 40),
        text: AppLocalizations.of(context)!.passengerTransport,
        screen: const PassengersTransportView(),
        serviceId: 2,
      ),
      TypeOfService(
        icon: AppIcons.car_3.svg(),
        text: AppLocalizations.of(context)!.carRental,
        screen: const CarsTypeView(),
        serviceId: 4,
      ),
      TypeOfService(
        icon: AppIcons.specialTechnique.svg(height: 40, width: 40),
        text: AppLocalizations.of(context)!.specialTechServices,
        screen: const SpecialTechnicalServicesView(),
        serviceId: 3,
      ),
      TypeOfService(
        icon: AppIcons.autoRepair.svg(),
        text: AppLocalizations.of(context)!.autoRepair,
        screen: const AutoRepairView(),
        serviceId: 5,
      ),
      TypeOfService(
        icon: AppIcons.transportationTransfer.svg(),
        text: AppLocalizations.of(context)!.transportTransfer,
        screen: const TransportTransferCreateView(),
        serviceId: 6,
      ),
      TypeOfService(
        icon: AppIcons.inTheWarehouseStorage.svg(),
        text: AppLocalizations.of(context)!.warehouseStorage,
        screen: const StorageServiceView(),
        serviceId: 7,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 24,
          width: 128,
          child: AppScope.of(context).themeMode == ThemeMode.dark
              ? AppImages.logoText.imgAsset()
              : AppImages.logoTextDark.imgAsset(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: CustomTextField(
              prefixIcon: AppIcons.searchNormal.svg(color: context.color.iron),
              hintText: AppLocalizations.of(context)!.searchTransport,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
              bottom: 8,
            ),
            child: Text(
              AppLocalizations.of(context)!.services,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 120,
              ),
              itemCount: list.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  MyFunction.authChek(
                    context: context,
                    onTap: () {
                      final bloc = context.read<AdvertisementBloc>();
                      bloc.add(GetTransportationTypesEvent(
                          serviceId: list[index].serviceId));
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: bloc,
                          child: list[index].screen,
                        ),
                      ));
                    },
                    isFull: (index != 5 && index != 7 && index != 9),
                  );
                },
                child: ServisLocIteam(typeOfService: list[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServisLocIteam extends StatelessWidget {
  const ServisLocIteam({
    super.key,
    required this.typeOfService,
  });

  final TypeOfService typeOfService;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          typeOfService.icon,
          const SizedBox(height: 4),
          Text(
            typeOfService.text,
            textAlign: TextAlign.center,
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
