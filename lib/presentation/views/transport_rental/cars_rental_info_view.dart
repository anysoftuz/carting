import 'package:carting/presentation/views/transport_rental/cars_renatl_diteals_view.dart';
import 'package:carting/presentation/views/transport_rental/widgets/cars_rental_iteam.dart';
import 'package:flutter/material.dart';

class CarsRentalInfoView extends StatefulWidget {
  const CarsRentalInfoView({super.key, required this.title});
  final String title;

  @override
  State<CarsRentalInfoView> createState() => _CarsRentalInfoViewState();
}

class _CarsRentalInfoViewState extends State<CarsRentalInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CarsRenatlDitealsView(),
            ));
          },
          child: CarsRentalIteam(title: widget.title),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: 12,
      ),
    );
  }
}
