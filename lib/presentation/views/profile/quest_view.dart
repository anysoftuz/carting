import 'package:carting/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class QuestView extends StatefulWidget {
  const QuestView({super.key});

  @override
  State<QuestView> createState() => _QuestViewState();
}

class _QuestViewState extends State<QuestView> {
  List<String> list = [
    "Buyrtmani bekor qilsam bo’ladimi?",
    "Qanday buyurtma qabul qilaman?",
    "Nima qilsam bo’ladi?",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ko’p so’raladigan savollar")),
      body: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            child: ExpansionTile(
              title: Text(list[index]),
              children: const [
                Divider(color: Color(0xFFEAEEF2), height: 1),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Ha albatta bo’ladi. Qachonki sizga yangi kliyentlar kelsa sizga xabar beradi",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemCount: list.length,
        ),
      ),
    );
  }
}
