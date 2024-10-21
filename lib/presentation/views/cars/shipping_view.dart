import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/orders/order_detail_view.dart';
import 'package:carting/presentation/views/orders/orders_filter_view.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:flutter/material.dart';

class ShippingView extends StatefulWidget {
  const ShippingView({super.key});

  @override
  State<ShippingView> createState() => _ShippingViewState();
}

class _ShippingViewState extends State<ShippingView> {
  List<TyperIteam> list = [
    TyperIteam(
      icon: AppImages.truck.imgAsset(height: 56),
      text: "Furgon",
      subTitle: "4.8x2.05x1.92",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.gazel.imgAsset(height: 56),
      text: "Gazel",
      subTitle: "3.4x1.65x1.9",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.trackMini.imgAsset(height: 56),
      text: "Bortovoy",
      subTitle: "3.4x1.65x1.9",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.truckMiddle.imgAsset(height: 56),
      text: "Fura",
      subTitle: "13.6x2.45x2.7",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.truckHight.imgAsset(height: 56),
      text: "Amerika furasi",
      subTitle: "16.6x2.45x2.7",
      screen: const SizedBox(),
    ),
    TyperIteam(
      icon: AppImages.image_13.imgAsset(height: 56),
      text: "Bitumovoz",
      subTitle: "13.6x2.45x2.7",
      screen: const SizedBox(),
    ),
  ];

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
          mainAxisExtent: 112,
        ),
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => OrdersFilterView(
                title: list[index].text,
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (context) =>
                        OrderDetailView(title: list[index].text),
                  ));
                },
              ),
            ));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: white,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width / 8,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                list[index].icon,
                const SizedBox(height: 4),
                Text(
                  list[index].text,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
                Text(
                  list[index].subTitle,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(color: dark.withOpacity(.3)),
                ),
                const SizedBox(height: 12)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
