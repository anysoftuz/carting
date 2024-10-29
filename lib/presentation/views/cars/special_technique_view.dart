import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/orders/order_detail_view.dart';
import 'package:carting/presentation/views/orders/orders_filter_view.dart';
import 'package:flutter/material.dart';

class SpecialTechniqueView extends StatefulWidget {
  const SpecialTechniqueView({super.key});

  @override
  State<SpecialTechniqueView> createState() => _SpecialTechniqueViewState();
}

class _SpecialTechniqueViewState extends State<SpecialTechniqueView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maxsus texnika")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 120,
        ),
        itemCount: AppData.specialTechnique.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => OrdersFilterView(
                title: AppData.specialTechnique[index].text,
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (context) => OrderDetailView(
                        title: AppData.specialTechnique[index].text),
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
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppData.specialTechnique[index].icon,
                const SizedBox(height: 4),
                Text(
                  AppData.specialTechnique[index].text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Text(
                  AppData.specialTechnique[index].subTitle,
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
