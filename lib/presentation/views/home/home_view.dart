import 'package:carting/presentation/views/transport_rental/cars_type_view.dart';
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
  List<TypeOfService> list = [
    TypeOfService(
      icon: AppIcons.delivery.svg(
        height: 40,
        width: 40,
      ),
      text: "Yetkazib\nberish",
      screen: const DeliveryView(),
      serviceId: 9,
    ),
    TypeOfService(
      icon: AppIcons.transportRental.svg(
        height: 40,
        width: 40,
      ),
      text: "Peregon xizmati",
      screen: const PeregonServiceView(),
      serviceId: 10,
    ),
    TypeOfService(
      icon: AppIcons.shipping.svg(
        height: 40,
        width: 40,
      ),
      text: "Yuk \ntashish",
      screen: const ShippingCreateView(),
      serviceId: 1,
    ),
    TypeOfService(
      icon: AppIcons.fuelDeliver.svg(),
      text: "Yoqilg‘i yetkazish",
      screen: const FuelDeliveryView(),
      serviceId: 8,
    ),
    TypeOfService(
      icon: AppIcons.transportationOfPassengers.svg(
        height: 40,
        width: 40,
      ),
      text: "Yo'lovchilarni tashish",
      screen: const PassengersTransportView(),
      serviceId: 2,
    ),
    TypeOfService(
      icon: AppIcons.car_3.svg(),
      text: "Transport ijarasi",
      screen: const CarsTypeView(),
      serviceId: 4,
    ),
    TypeOfService(
      icon: AppIcons.specialTechnique.svg(
        height: 40,
        width: 40,
      ),
      text: "Maxsus texnika xizmatlari",
      screen: const SpecialTechnicalServicesView(),
      serviceId: 3,
    ),
    TypeOfService(
      icon: AppIcons.autoRepair.svg(),
      text: "Avto ta'mirlash",
      screen: const AutoRepairView(),
      serviceId: 5,
    ),
    TypeOfService(
      icon: AppIcons.transportationTransfer.svg(),
      text: "Transport transferi",
      screen: const TransportTransferCreateView(),
      serviceId: 6,
    ),
    TypeOfService(
      icon: AppIcons.inTheWarehouseStorage.svg(),
      text: "Omborda saqlash",
      screen: const StorageServiceView(),
      serviceId: 7,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 24,
          width: 128,
          child: AppImages.logoTextDark.imgAsset(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: CustomTextField(
              prefixIcon: AppIcons.searchNormal.svg(),
              hintText: "Kerakli transportni qidiring",
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
            child: const Text(
              "Xizmatlar",
              style: TextStyle(
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
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: white,
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
          ),
        ],
      ),
    );
  }
}
