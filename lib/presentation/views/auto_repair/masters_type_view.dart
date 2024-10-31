import 'package:carting/assets/assets/icons.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/announcements/announcement_create_view.dart';
import 'package:carting/presentation/views/auto_repair/masters_list_view.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter/material.dart';

class MastersTypeView extends StatelessWidget {
  const MastersTypeView({super.key, this.isCreate = false});
  final bool isCreate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ustalar")),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(AppData.mastersType[index].name),
          subtitle: Text(AppData.mastersType[index].description),
          trailing: AppIcons.arrowForward.svg(),
          onTap: () {
            if (isCreate) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AnnouncementCreateView(
                  filter: TypeOfServiceEnum.masters,
                ),
              ));
            } else {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MastersListView(
                  title: AppData.mastersType[index].name,
                ),
              ));
            }
          },
        ),
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(height: 1),
        ),
        itemCount: AppData.mastersType.length,
      ),
    );
  }
}
