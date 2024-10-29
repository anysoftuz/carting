import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/cars/shipping_view.dart';
import 'package:carting/presentation/views/cars/special_technique_view.dart';
import 'package:carting/presentation/views/cars/transportation_of_passengers_view.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:carting/presentation/views/transport_rental/transport_rental_view.dart';
import 'package:carting/presentation/views/transport_transfer/transport_transfer_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CarsView extends StatefulWidget {
  const CarsView({super.key});

  @override
  State<CarsView> createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  List<TypeOfService> list = [
    TypeOfService(
      icon: AppIcons.shipping.svg(
        height: 40,
        width: 40,
      ),
      text: "Yuk \ntashish",
      screen: const ShippingView(),
    ),
    TypeOfService(
      icon: AppIcons.transportationOfPassengers.svg(
        height: 40,
        width: 40,
      ),
      text: "Yo'lovchilarni tashish",
      screen: const TransportationOfPassengersView(),
    ),
    TypeOfService(
      icon: AppIcons.specialTechnique.svg(
        height: 40,
        width: 40,
      ),
      text: "Maxsus texnika xizmatlari",
      screen: const SpecialTechniqueView(),
    ),
    TypeOfService(
      icon: AppIcons.transportRental.svg(
        height: 40,
        width: 40,
      ),
      text: "Transport ijarasi",
      screen: const TransportRentalView(),
    ),
    TypeOfService(
      icon: AppIcons.transportationTransfer.svg(),
      text: "Transport transferi",
      screen: const TransportTransferView(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Transport e'lonlari"),
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
