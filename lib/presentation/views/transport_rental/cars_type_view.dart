import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/presentation/views/common/empty_screen.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/transport_rental/cars_rental_info_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CarsTypeView extends StatefulWidget {
  const CarsTypeView({super.key});

  @override
  State<CarsTypeView> createState() => _CarsTypeViewState();
}

class _CarsTypeViewState extends State<CarsTypeView> {
  @override
  void initState() {
    context.read<AdvertisementBloc>().add(GetCarsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text("Yengil avtomobillar"),
        backgroundColor: white,
      ),
      body: BlocBuilder<AdvertisementBloc, AdvertisementState>(
        builder: (context, state) {
          if (state.statusCars.isInProgress) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) => const WShimmer(
                height: 60,
                width: double.infinity,
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 12,
            );
          }
          if (state.carsModel.isEmpty) {
            return const EmptyScreen();
          }
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context.read<AdvertisementBloc>().add(GetCarsEvent());
              Future.delayed(Duration.zero);
            },
            child: ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(state.carsModel[index].name),
                subtitle: Text(state.carsModel[index].fuelType),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {
                  final bloc = context.read<AdvertisementBloc>();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: bloc,
                      child: CarsRentalInfoView(
                        model: state.carsModel[index],
                      ),
                    ),
                  ));
                },
              ),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(height: 1),
              ),
              itemCount: state.carsModel.length,
            ),
          );
        },
      ),
    );
  }
}
