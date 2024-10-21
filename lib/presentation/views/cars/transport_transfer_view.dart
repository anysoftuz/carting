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
    );
  }
}
