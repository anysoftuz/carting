import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class AdditionalInformationView extends StatefulWidget {
  const AdditionalInformationView({super.key});

  @override
  State<AdditionalInformationView> createState() =>
      _AdditionalInformationViewState();
}

class _AdditionalInformationViewState extends State<AdditionalInformationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Qo‘shimcha ma’lumotlar")),
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
            CustomTextField(
              title: "Izoh",
              hintText: "Buyurtma haqida izoh qoldiring!",
              minLines: 4,
              maxLines: 5,
              noHeight: true,
              expands: false,
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white,
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
              child: const Text("To‘lov"),
            ),
            const SizedBox(height: 12),
            ListTile(
              onTap: () {},
              leading: AppIcons.cash.svg(),
              title: const Text("Naqd"),
              trailing: AppIcons.checkboxRadio.svg(),
            ),
            const Divider(height: 1),
            ListTile(
              onTap: () {},
              leading: AppIcons.card.svg(),
              title: const Text("Karta"),
              trailing: AppIcons.checkboxRadioDis.svg(),
            ),
            const Divider(height: 1),
            const SizedBox(height: 12),
            CustomTextField(
              title: "Narx",
              hintText: "Narxni kiriting",
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
