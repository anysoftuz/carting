import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/transport_rental/cars_type_view.dart';
import 'package:flutter/material.dart';

class TransportRentalView extends StatefulWidget {
  const TransportRentalView({super.key});

  @override
  State<TransportRentalView> createState() => _TransportRentalViewState();
}

class _TransportRentalViewState extends State<TransportRentalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transport ijarasi")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                leading: AppImages.image_10.imgAsset(),
                contentPadding: EdgeInsets.zero,
                title: const Text("Yengil avtomobillar"),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CarsTypeView(),
                  ));
                },
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                leading: AppImages.moto.imgAsset(),
                contentPadding: EdgeInsets.zero,
                title: const Text("Mototexnika"),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
