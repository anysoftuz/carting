import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/empty_screen.dart';
import 'package:carting/presentation/views/common/filter_view.dart';
import 'package:carting/presentation/views/storage_service/storage_service_info_view.dart';
import 'package:carting/presentation/views/storage_service/widgets/storage_service_iteam.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class StorageServiceView extends StatefulWidget {
  const StorageServiceView({super.key});

  @override
  State<StorageServiceView> createState() => _StorageServiceViewState();
}

class _StorageServiceViewState extends State<StorageServiceView> {
  @override
  void initState() {
    context
        .read<AdvertisementBloc>()
        .add(GetAdvertisementsFilterEvent(serviceId: 7));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.warehouseStorage),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FilterView(),
              ));
            },
            icon: AppIcons.filter.svg(color: context.color.iron),
          )
        ],
      ),
      body: BlocBuilder<AdvertisementBloc, AdvertisementState>(
        builder: (context, state) {
          if (state.statusFilter.isInProgress) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => const WShimmer(
                height: 336,
                width: double.infinity,
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 12,
            );
          }
          if (state.advertisementFilter.isEmpty) {
            return const EmptyScreen();
          }
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context
                  .read<AdvertisementBloc>()
                  .add(GetAdvertisementsFilterEvent(serviceId: 7));
              Future.delayed(Duration.zero);
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StorageServiceInfoView(
                      model: state.advertisementFilter[index],
                    ),
                  ));
                },
                child: StorageServiceIteam(
                  model: state.advertisementFilter[index],
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: state.advertisementFilter.length,
            ),
          );
        },
      ),
    );
  }
}
