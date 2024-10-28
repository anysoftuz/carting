import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/common/filter_view.dart';
import 'package:carting/presentation/views/orders/widgets/orders_iteam.dart';

import 'package:flutter/material.dart';

class OrdersFilterView extends StatefulWidget {
  const OrdersFilterView({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final VoidCallback onTap;

  @override
  State<OrdersFilterView> createState() => _OrdersFilterViewState();
}

class _OrdersFilterViewState extends State<OrdersFilterView> {
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
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            widget.onTap();
          },
          child: const OrdersIteam(),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 12,
      ),
    );
  }
}
