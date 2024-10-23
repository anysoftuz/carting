import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
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
      appBar: AppBar(title: const Text("Yengil avtomobillar")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: const Text("Sedan"),
            ),
            ListTile(
              title: const Text("Chevrolet Cobalt"),
              subtitle: const Text("Sedan, benzin"),
              trailing: AppIcons.arrowForward.svg(),
            ),
            const Divider(),
            ListTile(
              title: const Text("Chevrolet Lacetti"),
              subtitle: const Text("Sedan, benzin"),
              trailing: AppIcons.arrowForward.svg(),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
