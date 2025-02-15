import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/presentation/views/common/empty_screen.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/auto_repair/master_info_view.dart';
import 'package:carting/presentation/views/auto_repair/widgets/masters_iteam.dart';
import 'package:carting/presentation/views/common/filter_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class MastersListView extends StatefulWidget {
  const MastersListView({super.key, required this.title, required this.id});
  final String title;
  final int id;

  @override
  State<MastersListView> createState() => _MastersListViewState();
}

class _MastersListViewState extends State<MastersListView> {
  List<bool> active = [true, true, true, true, true];
  @override
  void initState() {
    context.read<AdvertisementBloc>().add(GetAdvertisementsFilterEvent(
          specialistId: widget.id,
          status: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => FilterView(
                  filterType: FilterType.workshopServices,
                  list: active,
                ),
              ));
            },
            icon: AppIcons.filter.svg(color: context.color.iron),
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
                  .add(GetAdvertisementsFilterEvent(
                    specialistId: widget.id,
                    status: true,
                  ));
              await Future.delayed(Duration.zero);
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MasterInfoView(
                      model: state.advertisementFilter[index],
                    ),
                  ));
                },
                child: MastersIteam(model: state.advertisementFilter[index]),
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
