import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
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
  @override
  void initState() {
    context
        .read<AdvertisementBloc>()
        .add(GetAdvertisementsFilterEvent(specialistId: widget.id));
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
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 12,
            );
          }
          return ListView.separated(
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
          );
        },
      ),
    );
  }
}
