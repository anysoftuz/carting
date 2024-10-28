import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/orders/order_detail_view.dart';
import 'package:carting/presentation/views/orders/orders_filter_view.dart';
import 'package:flutter/material.dart';

class TransportationOfPassengersView extends StatefulWidget {
  const TransportationOfPassengersView({super.key});

  @override
  State<TransportationOfPassengersView> createState() =>
      _TransportationOfPassengersViewState();
}

class _TransportationOfPassengersViewState
    extends State<TransportationOfPassengersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yo‘lovchilarni tashish")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 112,
        ),
        itemCount: AppData.transportationofPassengers.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => OrdersFilterView(
                title: AppData.transportationofPassengers[index].text,
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (context) => OrderDetailView(
                        title: AppData.transportationofPassengers[index].text),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppData.transportationofPassengers[index].icon,
                const SizedBox(height: 4),
                Text(
                  AppData.transportationofPassengers[index].text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Text(
                  AppData.transportationofPassengers[index].subTitle,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(color: dark.withOpacity(.3)),
                ),
                const SizedBox(height: 12)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
