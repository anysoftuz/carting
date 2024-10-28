import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/orders/order_detail_view.dart';
import 'package:carting/presentation/views/orders/orders_filter_view.dart';
import 'package:flutter/material.dart';

class TransportTransferView extends StatefulWidget {
  const TransportTransferView({super.key});

  @override
  State<TransportTransferView> createState() => _TransportTransferViewState();
}

class _TransportTransferViewState extends State<TransportTransferView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transport transferi")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 112,
        ),
        itemCount: AppData.transportTransfer.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => OrdersFilterView(
                title: AppData.transportTransfer[index].text,
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (context) => OrderDetailView(
                        title: AppData.transportTransfer[index].text),
                  ));
                },
              ),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: white,
              boxShadow: wboxShadow,
            ),
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppData.transportTransfer[index].text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Text(
                  AppData.transportTransfer[index].subTitle,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(color: dark.withOpacity(.3)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
