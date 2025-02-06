import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/presentation/routes/route_name.dart';
import 'package:carting/presentation/views/transport_rental/cars_type_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/cars/shipping_view.dart';
import 'package:carting/presentation/views/cars/special_technique_view.dart';
import 'package:carting/presentation/views/cars/transportation_of_passengers_view.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:carting/presentation/views/transport_transfer/transport_transfer_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
      serviceId: 1,
    ),
    TypeOfService(
      icon: AppIcons.transportationOfPassengers.svg(
        height: 40,
        width: 40,
      ),
      text: "Yo'lovchilarni tashish",
      screen: const TransportationOfPassengersView(),
      serviceId: 2,
    ),
    TypeOfService(
      icon: AppIcons.specialTechnique.svg(
        height: 40,
        width: 40,
      ),
      text: "Maxsus texnika xizmatlari",
      screen: const SpecialTechniqueView(),
      serviceId: 3,
    ),
    TypeOfService(
      icon: AppIcons.transportRental.svg(
        height: 40,
        width: 40,
      ),
      text: "Transport ijarasi",
      screen: const CarsTypeView(),
      serviceId: 4,
    ),
    TypeOfService(
      icon: AppIcons.transportationTransfer.svg(),
      text: "Transport transferi",
      screen: const TransportTransferView(),
      serviceId: 6,
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
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.unauthenticated) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.emptyFile.svg(),
                  const Text("Ro'yxatdan o'ting"),
                  WButton(
                    onTap: () {
                      context.go(AppRouteName.auth);
                    },
                    text: "Kirish",
                  ),
                  const SizedBox(height: 60)
                ],
              ),
            );
          }
          return GridView.builder(
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
                final bloc = context.read<AdvertisementBloc>();
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
          );
        },
      ),
    );
  }
}
