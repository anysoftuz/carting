import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/orders/orders_info_finish_view.dart';
import 'package:carting/presentation/views/orders/orders_info_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buyurtmalar")),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const SizedBox(
              height: 44,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: WTabBar(
                  tabs: [
                    Text("Aktiv"),
                    Text("Tugallangan"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SizedBox(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                        decoration: BoxDecoration(
                          color: whiteSmoke,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: OrderIteam(
                          index: index,
                          isFinsh: false,
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: 12,
                    ),
                  ),
                  SizedBox(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                        decoration: BoxDecoration(
                          color: whiteSmoke,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: OrderIteam(
                          index: index,
                          isFinsh: true,
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemCount: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderIteam extends StatelessWidget {
  const OrderIteam({super.key, required this.index, required this.isFinsh});
  final int index;
  final bool isFinsh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          leading: AppIcons.delivery.svg(),
          title: const Text(
            "Mebel",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: const Text(
            "2 х 3 х 2 m²",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const Divider(height: 1),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: AppIcons.check.svg(),
          title: const Text(
            "Buyurtma holati",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: Text(
            isFinsh
                ? "Tugallangan"
                : index != 0
                    ? "Qabul qilindi: 60A522AC (Камаз)"
                    : "Haydovchi kutilmoqda",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isFinsh ? green : null),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: AppIcons.time.svg(),
          title: const Text(
            "Yetkizib berish taxminiy vaqti",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: const Text(
            "18.07.2024 16:00",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: AppIcons.price.svg(),
          title: const Text(
            "Yetkazib berish narxi",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: const Text(
            "500 000",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Divider(height: 1),
        const SizedBox(height: 12),
        WButton(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => isFinsh
                  ? const OrdersInfoFinshView()
                  : OrdersInfoView(isDelivery: index != 0),
            ));
          },
          color: white,
          textColor: green,
          text: "Buyurtma haqida",
        )
      ],
    );
  }
}
