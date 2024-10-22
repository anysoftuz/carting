import 'package:carting/assets/assets/icons.dart';
import 'package:carting/presentation/views/storage_service/storage_service_info_view.dart';
import 'package:carting/presentation/views/storage_service/widgets/storage_service_iteam.dart';
import 'package:flutter/material.dart';

class StorageServiceView extends StatefulWidget {
  const StorageServiceView({super.key});

  @override
  State<StorageServiceView> createState() => _StorageServiceViewState();
}

class _StorageServiceViewState extends State<StorageServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saqlash xizmati"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: AppIcons.filter.svg(),
          )
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const StorageServiceInfoView(),
            ));
          },
          child: const StorageServiceIteam(),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 12,
      ),
    );
  }
}
