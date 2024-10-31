import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/announcements/announcement_create_view.dart';
import 'package:carting/presentation/widgets/w_title.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter/material.dart';

class AnnouncementsTransportRentalView extends StatefulWidget {
  const AnnouncementsTransportRentalView({super.key});

  @override
  State<AnnouncementsTransportRentalView> createState() =>
      _AnnouncementsTransportRentalViewState();
}

class _AnnouncementsTransportRentalViewState
    extends State<AnnouncementsTransportRentalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text("Transport ijarasi"),
        backgroundColor: white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const WTitle(title: "Sedan"),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                title: Text(AppData.carsList[index].name),
                subtitle: Text(AppData.carsList[index].description),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AnnouncementCreateView(
                      filter: TypeOfServiceEnum.transportRental,
                    ),
                  ));
                },
              ),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: AppData.carsList.length,
            ),
            const WTitle(title: "Krossover"),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                title: Text(AppData.carsList2[index].name),
                subtitle: Text(AppData.carsList2[index].description),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AnnouncementCreateView(
                      filter: TypeOfServiceEnum.transportRental,
                    ),
                  ));
                },
              ),
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: AppData.carsList2.length,
            ),
          ],
        ),
      ),
    );
  }
}
