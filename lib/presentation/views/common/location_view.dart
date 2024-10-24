import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key, required this.onTap, this.isOne = false});
  final VoidCallback onTap;
  final bool isOne;

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView> {
  late TextEditingController controllerLat;
  late TextEditingController controllerLong;

  @override
  void initState() {
    controllerLat = TextEditingController(text: "Toshkent, Yakkasaroy tumani");
    controllerLong = TextEditingController(text: "Samarqand, Samarqand tumani");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -2),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 5,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color(0xFFB7BFC6),
              ),
            ),
            const SizedBox(height: 16),
            // From Location
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: scaffoldSecondaryBackground,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  TextField(
                    controller: controllerLat,
                    decoration: const InputDecoration(
                      labelText: 'Qayerdan',
                      hintText: 'Toshkent, Yakkasaroy tumani',
                      border: InputBorder.none,
                    ),
                  ),
                  if (!widget.isOne) ...[
                    const Divider(height: 1),
                    // To Location
                    TextField(
                      controller: controllerLong,
                      decoration: const InputDecoration(
                        labelText: 'Qayerga',
                        hintText: 'Manzilni tanlang',
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            // Confirm button
            SafeArea(
              top: false,
              child: WButton(
                onTap: () {
                  widget.onTap();
                },
                text: "Tasdiqlash",
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          // Google Map
          FlutterMap(
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                maxZoom: 19,
              ),
            ],
          ),
          // Location marker in the center
          Center(
            child: CircleAvatar(
              backgroundColor: white,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: AppIcons.mapPin.svg(),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CircleAvatar(
                backgroundColor: white,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: white,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: AppIcons.gps.svg(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
