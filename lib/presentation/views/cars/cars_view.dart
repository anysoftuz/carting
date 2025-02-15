import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
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
        screen: const ShippingView(),
        serviceId: 1,
      ),
      TypeOfService(
        icon: AppIcons.transportationOfPassengers.svg(
          height: 40,
          width: 40,
        ),
        text: AppLocalizations.of(context)!.passengerTransport,
        screen: const TransportationOfPassengersView(),
        serviceId: 2,
      ),
      TypeOfService(
        icon: AppIcons.specialTechnique.svg(
          height: 40,
          width: 40,
        ),
        text: AppLocalizations.of(context)!.specialTechServices,
        screen: const SpecialTechniqueView(),
        serviceId: 3,
      ),
      TypeOfService(
        icon: AppIcons.transportRental.svg(
          height: 40,
          width: 40,
        ),
        text: AppLocalizations.of(context)!.peregonService,
        screen: const CarsTypeView(),
        serviceId: 4,
      ),
      TypeOfService(
        icon: AppIcons.transportationTransfer.svg(),
        text: AppLocalizations.of(context)!.transportTransfer,
        screen: const TransportTransferView(),
        serviceId: 6,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.transportAnnouncements),
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
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state.status == AuthenticationStatus.unauthenticated ) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcons.emptyFile.svg(),
                  Text(AppLocalizations.of(context)!.register),
                  WButton(
                    onTap: () {
                      context.go(AppRouteName.auth);
                    },
                    text: AppLocalizations.of(context)!.enter,
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
          );
        },
      ),
    );
  }
}
