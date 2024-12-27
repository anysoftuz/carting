import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/announcements/announcement_create_view.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter/material.dart';

class AnnouncementsShippingTypeView extends StatefulWidget {
  const AnnouncementsShippingTypeView({super.key});

  @override
  State<AnnouncementsShippingTypeView> createState() =>
      _AnnouncementsShippingTypeViewState();
}

class _AnnouncementsShippingTypeViewState
    extends State<AnnouncementsShippingTypeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yuk tashish")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 120,
        ),
        itemCount: AppData.shippinglist.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AnnouncementCreateView(
                filter: TypeOfServiceEnum.shipping,
              ),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: white,
              boxShadow: wboxShadow,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width / 8,
            ).copyWith(top: 8, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppData.shippinglist[index].icon,
                const SizedBox(height: 4),
                Text(
                  AppData.shippinglist[index].text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Text(
                  AppData.shippinglist[index].subTitle,
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
