import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/orders/orders_info_deliver_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';

class OrderDeliverView extends StatefulWidget {
  const OrderDeliverView({super.key});

  @override
  State<OrderDeliverView> createState() => _OrderDeliverViewState();
}

class _OrderDeliverViewState extends State<OrderDeliverView> {
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
                    Text("Yangi"),
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
                        decoration: BoxDecoration(
                          color: whiteSmoke,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: OrderDeliverIteam(
                          index: index,
                          isNew: true,
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
                      itemBuilder: (context, index) => InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(MaterialPageRoute(
                            builder: (context) =>
                                const OrdersInfoDeliverView(isActiv: false),
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: whiteSmoke,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: OrderDeliverIteam(
                            index: index,
                            isNew: false,
                          ),
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

class OrderDeliverIteam extends StatelessWidget {
  const OrderDeliverIteam({
    super.key,
    required this.index,
    required this.isNew,
  });
  final int index;
  final bool isNew;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            "Tashkent → Andijan",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "18.07.2024",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: white,
              ),
            ),
          ),
        ),
        const Divider(height: 1),
        const ListTile(
          title: Text(
            "Mebel",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: gray,
            ),
          ),
          subtitle: Text(
            "2 х 3 х 2 m²",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: gray,
            ),
          ),
          trailing: Text(
            "500 000 so’m",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: black,
            ),
          ),
        ),
        if (isNew) ...[
          const Divider(height: 1),
          const SizedBox(height: 12),
          WButton(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
                builder: (context) =>
                    const OrdersInfoDeliverView(isActiv: true),
              ));
            },
            color: white,
            textColor: green,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            text: "Navigatsiya",
          ),
          const SizedBox(height: 12),
        ]
      ],
    );
  }
}
