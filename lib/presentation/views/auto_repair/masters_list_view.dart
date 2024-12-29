import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/auto_repair/master_info_view.dart';
import 'package:carting/presentation/views/auto_repair/widgets/masters_iteam.dart';
import 'package:carting/presentation/views/common/filter_view.dart';

class MastersListView extends StatelessWidget {
  const MastersListView({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FilterView(),
              ));
            },
            icon: AppIcons.filter.svg(),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const MasterInfoView(),
            ));
          },
          child: const MastersIteam(),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 12,
      ),
    );
  }
}
