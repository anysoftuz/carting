import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/transport_rental/cars_rental_info_view.dart';
import 'package:carting/presentation/widgets/w_title.dart';

class CarsTypeView extends StatefulWidget {
  const CarsTypeView({super.key});

  @override
  State<CarsTypeView> createState() => _CarsTypeViewState();
}

class _CarsTypeViewState extends State<CarsTypeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text("Yengil avtomobillar"),
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const WTitle(title: "Sedan"),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                title: Text(AppData.carsList[index].name),
                subtitle: Text(AppData.carsList[index].description),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        CarsRentalInfoView(title: AppData.carsList[index].name),
                  ));
                },
              ),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: AppData.carsList.length,
            ),
            const WTitle(title: "Krossover"),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                title: Text(AppData.carsList2[index].name),
                subtitle: Text(AppData.carsList2[index].description),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CarsRentalInfoView(
                      title: AppData.carsList2[index].name,
                    ),
                  ));
                },
              ),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: AppData.carsList2.length,
            ),
          ],
        ),
      ),
    );
  }
}
