import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/orders/auto_repair_view.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeDeliverView extends StatefulWidget {
  const HomeDeliverView({super.key});

  @override
  State<HomeDeliverView> createState() => _HomeDeliverViewState();
}

class _HomeDeliverViewState extends State<HomeDeliverView> {
  List<TypeOfService> list = [
    TypeOfService(
      icon: AppIcons.shipping.svg(
        height: 40,
        width: 40,
      ),
      text: "Yuk \ntashish",
      screen: const SizedBox(),
    ),
    TypeOfService(
      icon: AppIcons.transportationOfPassengers.svg(
        height: 40,
        width: 40,
      ),
      text: "Yo'lovchilarni tashish",
      screen: const SizedBox(),
    ),
    TypeOfService(
      icon: AppIcons.specialTechnique.svg(
        height: 40,
        width: 40,
      ),
      text: "Maxsus texnika xizmatlari",
      screen: const SizedBox(),
    ),
    TypeOfService(
      icon: AppIcons.transportRental.svg(
        height: 40,
        width: 40,
      ),
      text: "Transport ijarasi",
      screen: const SizedBox(),
    ),
    TypeOfService(
      icon: AppIcons.autoRepair.svg(),
      text: "Avto ta'mirlash",
      screen: const AutoRepairView(),
    ),
    TypeOfService(
      icon: AppIcons.transportationTransfer.svg(),
      text: "Transport transferi",
      screen: const SizedBox(),
    ),
    TypeOfService(
      icon: AppIcons.inTheWarehouseStorage.svg(),
      text: "Omborda saqlash",
      screen: const SizedBox(),
    ),
    TypeOfService(
      icon: AppIcons.fuelDeliver.svg(),
      text: "Yoqilg‘i yetkazish",
      screen: const SizedBox(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 24,
          width: 128,
          child: AppImages.logoTextDark.imgAsset(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: CustomTextField(
              prefixIcon: AppIcons.searchNormal.svg(),
              hintText: "Kerakli transportni qidiring",
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 112,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => list[index].screen,
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: white,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 12,
              horizontal: MediaQuery.sizeOf(context).width / 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                list[index].icon,
                const SizedBox(height: 4),
                Text(
                  list[index].text,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
