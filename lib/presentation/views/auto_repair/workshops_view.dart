import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/presentation/views/common/empty_screen.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/auto_repair/widgets/workshops_iteam.dart';
import 'package:carting/presentation/views/auto_repair/workshops_info_view.dart';
import 'package:carting/presentation/views/common/filter_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class WorkshopsView extends StatefulWidget {
  const WorkshopsView({super.key});

  @override
  State<WorkshopsView> createState() => _WorkshopsViewState();
}

class _WorkshopsViewState extends State<WorkshopsView> {
  @override
  void initState() {
    context
        .read<AdvertisementBloc>()
        .add(GetAdvertisementsFilterEvent(repairTypeId: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ustaxonalar"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FilterView(),
              ));
            },
            icon: AppIcons.filter.svg(),
          ),
        ],
      ),
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
          if (state.advertisementFilter.isEmpty) {
            return const EmptyScreen();
          }
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context
                  .read<AdvertisementBloc>()
                  .add(GetAdvertisementsFilterEvent(repairTypeId: 1));
              Future.delayed(Duration.zero);
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WorkshopsInfoView(
                      model: state.advertisementFilter[index],
                    ),
                  ));
                },
                child: WorkshopsIteam(model: state.advertisementFilter[index]),
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
