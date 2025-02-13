import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/announcements/announcement_create_view.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AnnouncementsTransportRentalView extends StatefulWidget {
  const AnnouncementsTransportRentalView({super.key});

  @override
  State<AnnouncementsTransportRentalView> createState() =>
      _AnnouncementsTransportRentalViewState();
}

class _AnnouncementsTransportRentalViewState
    extends State<AnnouncementsTransportRentalView> {
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
        title: Text(AppLocalizations.of(context)!.carRental),
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
                      child: AnnouncementCreateView(
                        filter: TypeOfServiceEnum.transportRental,
                        carId: state.carsModel[index].id,
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
      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(16),
      //   child: Column(
      //     children: [
      //       const WTitle(title: "Sedan"),
      //       ListView.separated(
      //         shrinkWrap: true,
      //         physics: const NeverScrollableScrollPhysics(),
      //         itemBuilder: (context, index) => ListTile(
      //           title: Text(AppData.carsList[index].name),
      //           subtitle: Text(AppData.carsList[index].description),
      //           trailing: AppIcons.arrowForward.svg(),
      //           onTap: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //               builder: (context) => const AnnouncementCreateView(
      //                 filter: TypeOfServiceEnum.transportRental,
      //                 carId: 0,
      //               ),
      //             ));
      //           },
      //         ),
      //         separatorBuilder: (context, index) => const Divider(height: 1),
      //         itemCount: AppData.carsList.length,
      //       ),
      //       const WTitle(title: "Krossover"),
      //       ListView.separated(
      //         shrinkWrap: true,
      //         physics: const NeverScrollableScrollPhysics(),
      //         itemBuilder: (context, index) => ListTile(
      //           title: Text(AppData.carsList2[index].name),
      //           subtitle: Text(AppData.carsList2[index].description),
      //           trailing: AppIcons.arrowForward.svg(),
      //           onTap: () {
      //             Navigator.of(context).push(MaterialPageRoute(
      //               builder: (context) => const AnnouncementCreateView(
      //                 filter: TypeOfServiceEnum.transportRental,
      //                 carId: 0,
      //               ),
      //             ));
      //           },
      //         ),
      //         separatorBuilder: (context, index) => const Divider(height: 1),
      //         itemCount: AppData.carsList2.length,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
