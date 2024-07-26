import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/cars/car_add_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class CarsView extends StatefulWidget {
  const CarsView({super.key});

  @override
  State<CarsView> createState() => _CarsViewState();
}

class _CarsViewState extends State<CarsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Transport")),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: whiteSmoke,
              radius: 56,
              child: AppIcons.truck.svg(
                color: black,
                height: 64,
                width: 64,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Siz hali transport \nqo’shmagansiz.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            WButton(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                  builder: (context) => const CarAddView(),
                ));
              },
              text: "Transport qo’shish",
              width: MediaQuery.sizeOf(context).width / 2,
              margin: const EdgeInsets.symmetric(vertical: 32),
            ),
          ],
        ),
      ),
    );
  }
}
