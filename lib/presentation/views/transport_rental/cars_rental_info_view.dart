import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/data/models/cars_model.dart';
import 'package:carting/presentation/views/transport_rental/cars_renatl_diteals_view.dart';
import 'package:carting/presentation/views/transport_rental/widgets/cars_rental_iteam.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CarsRentalInfoView extends StatefulWidget {
  const CarsRentalInfoView({super.key, required this.model});
  final CarsModel model;

  @override
  State<CarsRentalInfoView> createState() => _CarsRentalInfoViewState();
}

class _CarsRentalInfoViewState extends State<CarsRentalInfoView> {
  @override
  void initState() {
    context.read<AdvertisementBloc>().add(GetAdvertisementsFilterEvent(
          carId: widget.model.id,
          status: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.model.name)),
      body: BlocBuilder<AdvertisementBloc, AdvertisementState>(
        builder: (context, state) {
          if (state.statusFilter.isInProgress) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => const WShimmer(
                height: 316,
                width: double.infinity,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: 12,
            );
          }
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context
                  .read<AdvertisementBloc>()
                  .add(GetAdvertisementsFilterEvent(
                    carId: widget.model.id,
                    status: true,
                  ));
              await Future.delayed(Duration.zero);
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CarsRenatlDitealsView(
                      model: state.advertisementFilter[index],
                    ),
                  ));
                },
                child: CarsRentalIteam(model: state.advertisementFilter[index]),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: state.advertisementFilter.length,
            ),
          );
        },
      ),
    );
  }
}
