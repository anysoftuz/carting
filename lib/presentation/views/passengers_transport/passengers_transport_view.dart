import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/peregon_service/additional_information_view.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class PassengersTransportView extends StatefulWidget {
  const PassengersTransportView({super.key});

  @override
  State<PassengersTransportView> createState() =>
      _PassengersTransportViewState();
}

class _PassengersTransportViewState extends State<PassengersTransportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yo‘lovchilarni tashish")),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AdditionalInformationView(),
            ));
          },
          margin: const EdgeInsets.all(16),
          text: "Ro‘yxatdan o‘tish",
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
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Qayerdan",
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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Divider(height: 1),
                  ),
                  ListTile(
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
                ],
              ),
            ),
            const SizedBox(height: 8),
            MinTextField(
              text: "Yo‘lovchi soni",
              hintText: "Miqdorni kiriting",
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            MinTextField(
              text: "Jo‘natish sanasi",
              hintText: "0",
              prefixIcon: AppIcons.calendar.svg(
                height: 24,
                width: 24,
              ),
              onChanged: (value) {},
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: ListTile(
                title: const Text("Qo‘shimcha ma’lumotlar"),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: dark,
                ),
                subtitle: const Text(
                  "Yuk turi, rasmi, yuklash xizmati, to‘lov...",
                ),
                trailing: AppIcons.arrowForward.svg(),
              ),
            ),
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: const Text("Transport turi"),
                subtitle: const Text("Furgon 4.8x2.05x1.92"),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withOpacity(.3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: dark,
                ),
                trailing: AppImages.image_7.imgAsset(width: 120),
              ),
            )
          ],
        ),
      ),
    );
  }
}
