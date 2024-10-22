import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/auto_repair/masters_list_view.dart';
import 'package:flutter/material.dart';

class MastersTypeView extends StatelessWidget {
  const MastersTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ustalar")),
      body: Column(
        children: [
          ListTile(
            title: const Text("Kuzov ustasi"),
            subtitle: const Text("Polirovka, bo‘yoq, qirilish, buklanish"),
            trailing: AppIcons.arrowForward.svg(),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MastersListView(
                  title: 'Kuzov ustasi',
                ),
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 1),
          ),
          ListTile(
            title: const Text("Avtoelektrik"),
            subtitle: const Text("Elektrga oid barcha ishlar, fara, tablo"),
            trailing: AppIcons.arrowForward.svg(),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const MastersListView(title: 'Avtoelektrik'),
              ));
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(height: 1),
          ),
          ListTile(
            title: const Text("Mator ustasi"),
            subtitle: const Text("dvigitel motor ishlari"),
            trailing: AppIcons.arrowForward.svg(),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    const MastersListView(title: "Mator ustasi"),
              ));
            },
          ),
        ],
      ),
    );
  }
}
