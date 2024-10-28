import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/auto_repair/widgets/workshops_iteam.dart';
import 'package:carting/presentation/views/auto_repair/workshops_info_view.dart';
import 'package:carting/presentation/views/common/filter_view.dart';
import 'package:flutter/material.dart';

class WorkshopsView extends StatelessWidget {
  const WorkshopsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ustaxonalar"),
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
              builder: (context) => const WorkshopsInfoView(),
            ));
          },
          child: const WorkshopsIteam(),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 12,
      ),
    );
  }
}
