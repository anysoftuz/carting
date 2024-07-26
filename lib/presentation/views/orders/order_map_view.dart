import 'package:carting/assets/assets/images.dart';
import 'package:flutter/material.dart';

class OrderMapView extends StatefulWidget {
  const OrderMapView({super.key});

  @override
  State<OrderMapView> createState() => _OrderMapViewState();
}

class _OrderMapViewState extends State<OrderMapView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Jonli kuzatish")),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: AppImages.map.imgAsset(fit: BoxFit.cover),
      ),
    );
  }
}
