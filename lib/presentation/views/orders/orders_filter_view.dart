import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/data/models/transportation_types_model.dart';
import 'package:carting/presentation/views/orders/order_detail_view.dart';
import 'package:carting/presentation/views/orders/widgets/orders_iteam.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class OrdersFilterView extends StatefulWidget {
  const OrdersFilterView({
    super.key,
    required this.model,
    required this.onTap,
    required this.type,
  });
  final TransportationTypesModel model;
  final String type;
  final VoidCallback onTap;

  @override
  State<OrdersFilterView> createState() => _OrdersFilterViewState();
}

class _OrdersFilterViewState extends State<OrdersFilterView> {
  @override
  void initState() {
    context.read<AdvertisementBloc>().add(GetAdvertisementsFilterEvent(
          transportId: widget.model.id,
          status: true,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.name),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => const FilterView(),
        //       ));
        //     },
        //     icon: AppIcons.filter.svg(color: context.color.iron),
        //   ),
        // ],
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
          return RefreshIndicator.adaptive(
            onRefresh: () async {
              context
                  .read<AdvertisementBloc>()
                  .add(GetAdvertisementsFilterEvent(
                    transportId: widget.model.id,
                    status: true,
                  ));
              Future.delayed(Duration.zero);
            },
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrderDetailView(
                      model: state.advertisementFilter[index],
                    ),
                  ));
                },
                child: OrdersIteam(
                  model: state.advertisementFilter[index],
                  type: widget.type,
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
