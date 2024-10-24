import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/transport_rental/cars_rental_info_view.dart';
import 'package:carting/presentation/widgets/w_title.dart';
import 'package:flutter/material.dart';

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
            ListTile(
              title: const Text("Chevrolet Cobalt"),
              subtitle: const Text("Sedan, benzin"),
              trailing: AppIcons.arrowForward.svg(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const CarsRentalInfoView(title: "Chevrolet Cobalt"),
                ));
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text("Chevrolet Lacetti"),
              subtitle: const Text("Sedan, benzin"),
              trailing: AppIcons.arrowForward.svg(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const CarsRentalInfoView(title: "Chevrolet Lacetti"),
                ));
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text("BYD Chazor DMI"),
              subtitle: const Text("Sedan, elektr/benzin"),
              trailing: AppIcons.arrowForward.svg(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const CarsRentalInfoView(title: "BYD Chazor DMI"),
                ));
              },
            ),
            const WTitle(title: "Krossover"),
            ListTile(
              title: const Text("Kia Sonet"),
              subtitle: const Text("Krossover, benzin"),
              trailing: AppIcons.arrowForward.svg(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const CarsRentalInfoView(title: "Kia Sonet"),
                ));
              },
            ),
            const Divider(height: 1),
            ListTile(
              title: const Text("Chevrolet Tracker"),
              subtitle: const Text("Krossover, benzin"),
              trailing: AppIcons.arrowForward.svg(),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      const CarsRentalInfoView(title: "Chevrolet Tracker"),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
