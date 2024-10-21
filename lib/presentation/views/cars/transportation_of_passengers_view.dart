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
    );
  }
}
