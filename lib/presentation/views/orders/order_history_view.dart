import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';

class OrderHistoryView extends StatefulWidget {
  const OrderHistoryView({super.key});

  @override
  State<OrderHistoryView> createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buyurtmalar tarixi")),
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
                    Text("Tugallangan"),
                    Text("Bekor qilingan"),
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
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
                        decoration: BoxDecoration(
                          color: whiteSmoke,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: OrderHistoryIteam(
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
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 20),
                        decoration: BoxDecoration(
                          color: whiteSmoke,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: OrderHistoryIteam(
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

class OrderHistoryIteam extends StatelessWidget {
  const OrderHistoryIteam({
    super.key,
    required this.index,
    required this.isFinsh,
  });
  final int index;
  final bool isFinsh;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text(
            "Tashkent → Andijan",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: isFinsh ? Colors.transparent : green,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "18.07.2024",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isFinsh ? red : white,
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
              fontWeight: FontWeight.w400,
              color: black,
            ),
          ),
        ),
        const Divider(height: 1),
        const SizedBox(height: 12),
        WButton(
          onTap: () {},
          color: white,
          textColor: isFinsh ? red : green,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          text: "Tugallangan",
        )
      ],
    );
  }
}
