import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/announcements/announcement_create_view.dart';
import 'package:carting/presentation/views/auto_repair/masters_type_view.dart';
import 'package:carting/presentation/views/auto_repair/workshops_view.dart';
import 'package:carting/utils/enum_filtr.dart';

class AutoRepairView extends StatelessWidget {
  const AutoRepairView({
    super.key,
    this.isCreate = false,
  });
  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Avto ta’mirlash")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                leading: AppImages.workshops.imgAsset(),
                contentPadding: EdgeInsets.zero,
                title: const Text("Ustaxonalar"),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {
                  if (isCreate) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AnnouncementCreateView(
                        filter: TypeOfServiceEnum.workshops,
                        carId: 0,
                      ),
                    ));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const WorkshopsView(),
                    ));
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: white,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                leading: AppImages.masters.imgAsset(),
                contentPadding: EdgeInsets.zero,
                title: const Text("Ustalar"),
                trailing: AppIcons.arrowForward.svg(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MastersTypeView(isCreate: true),
                  ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
