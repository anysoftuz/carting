import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class FuelDeliveryView extends StatefulWidget {
  const FuelDeliveryView({super.key});

  @override
  State<FuelDeliveryView> createState() => _FuelDeliveryViewState();
}

class _FuelDeliveryViewState extends State<FuelDeliveryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yoqilg‘i yetkazish")),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {},
          margin: const EdgeInsets.all(16),
          text: "Tasdiqlash",
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: Text(
                  "Qayerga",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: dark.withOpacity(.3),
                  ),
                ),
                subtitle: const Text(
                  "Toshkent, Yakkasaroy tumani",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: dark,
                  ),
                ),
                trailing: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: green,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: AppIcons.location.svg(
                    height: 24,
                    width: 24,
                    color: white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ListTile(
                      title: Text(
                        "Hamji (litr)",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: dark.withOpacity(.3),
                        ),
                      ),
                      subtitle: const Text(
                        "Miqdorni kiriting",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: dark,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: ListTile(
                      title: Text(
                        "Benzin turi",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: dark.withOpacity(.3),
                        ),
                      ),
                      subtitle: const Text(
                        "Tanlang",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: dark,
                        ),
                      ),
                      trailing: AppIcons.arrowBottom.svg(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: Text(
                  "Kompaniyalar ro‘yhati",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: dark.withOpacity(.3),
                  ),
                ),
                subtitle: const Text(
                  "Kompaniyani tanlang",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: dark,
                  ),
                ),
                trailing: AppIcons.arrowBottom.svg(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
