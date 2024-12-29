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
import 'package:flutter/material.dart';

class AnnouncementsTypeView extends StatefulWidget {
  const AnnouncementsTypeView({super.key});

  @override
  State<AnnouncementsTypeView> createState() => _AnnouncementsTypeViewState();
}

class _AnnouncementsTypeViewState extends State<AnnouncementsTypeView> {
  List<TypeOfService> list = [
    TypeOfService(
      icon: AppIcons.shipping.svg(
        height: 40,
        width: 40,
      ),
      text: "Yuk \ntashish",
      screen: const AnnouncementsShippingTypeView(),
      serviceId: 1,
    ),
    TypeOfService(
      icon: AppIcons.transportationOfPassengers.svg(
        height: 40,
        width: 40,
      ),
      text: "Yo'lovchilarni tashish",
      screen: const AnnouncementsTransportationOfPassengersView(),
      serviceId: 2,
    ),
    TypeOfService(
      icon: AppIcons.car_3.svg(),
      text: "Transport ijarasi",
      screen: const AnnouncementsTransportRentalView(),
      serviceId: 3,
    ),
    TypeOfService(
      icon: AppIcons.specialTechnique.svg(
        height: 40,
        width: 40,
      ),
      text: "Maxsus texnika xizmatlari",
      screen: const SpecialTechniqueView(isCreate: true),
      serviceId: 3,
    ),
    TypeOfService(
      icon: AppIcons.autoRepair.svg(),
      text: "Avto ta'mirlash",
      screen: const AutoRepairView(isCreate: true),
      serviceId: 5,
    ),
    TypeOfService(
      icon: AppIcons.transportationTransfer.svg(),
      text: "Transport transferi",
      screen: const TransportTransferView(isCreate: true),
      serviceId: 6,
    ),
    TypeOfService(
      icon: AppIcons.inTheWarehouseStorage.svg(),
      text: "Omborda saqlash",
      screen: const AnnouncementCreateView(
        filter: TypeOfServiceEnum.storageInWarehouse,
      ),
      serviceId: 7,
    ),
    TypeOfService(
      icon: AppIcons.fuelDeliver.svg(),
      text: "Yoqilg‘i yetkazish",
      screen: const AnnouncementCreateView(
        filter: TypeOfServiceEnum.fuelDelivery,
      ),
      serviceId: 8,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Xizmat turi")),
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
              builder: (context) => list[index].screen,
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
    );
  }
}
