import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/announcements/announcement_create_view.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter/material.dart';

class AnnouncementsTransportationOfPassengersView extends StatefulWidget {
  const AnnouncementsTransportationOfPassengersView({super.key});

  @override
  State<AnnouncementsTransportationOfPassengersView> createState() =>
      _AnnouncementsTransportationOfPassengersViewState();
}

class _AnnouncementsTransportationOfPassengersViewState
    extends State<AnnouncementsTransportationOfPassengersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yo‘lovchilarni tashish")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 120,
        ),
        itemCount: AppData.transportationofPassengers.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AnnouncementCreateView(
                filter: TypeOfServiceEnum.transportationOfPassengers,
              ),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: white,
              boxShadow: wboxShadow,
            ),
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppData.transportationofPassengers[index].icon,
                const SizedBox(height: 4),
                Text(
                  AppData.transportationofPassengers[index].text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Text(
                  AppData.transportationofPassengers[index].subTitle,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(color: dark.withValues(alpha: .3)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
