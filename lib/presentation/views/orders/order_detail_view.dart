import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({super.key, required this.title});
  final String title;

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  List<String> list = [
    AppImages.mask,
    AppImages.mask,
    AppImages.mask,
    AppImages.mask,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) => Image.asset(
                    list[index],
                    fit: BoxFit.cover,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: CircleAvatar(
                      backgroundColor: white,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  right: 16,
                  child: Text(
                    "1/8",
                    style: TextStyle(color: white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        AppIcons.star.svg(),
                        RichText(
                          text: TextSpan(
                            text: "4.5, ",
                            style: const TextStyle(
                              fontSize: 14,
                              color: dark,
                            ),
                            children: [
                              TextSpan(
                                text: "25 ta izoh",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: dark.withOpacity(.3),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Assalomu alaykum! man sizga barcha turdagi yuklarni tashish uchun mo‘ljallangan Furgonimni taklif qilaman, shanba yakshanba ham ishlayman.",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: dark.withOpacity(.3),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: BoxDecoration(
                    color: scaffoldSecondaryBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: AppIcons.location.svg(
                      height: 24,
                      width: 24,
                    ),
                    title: const Text(
                      "IzoToshkent, Yakkasaroy tumanihlar",
                      maxLines: 1,
                    ),
                    trailing: AppIcons.arrowCircle.svg(),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: scaffoldSecondaryBackground,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    onTap: () {},
                    leading: AppIcons.message.svg(),
                    title: const Text("Izohlar"),
                    trailing: AppIcons.arrowCircle.svg(),
                  ),
                ),
                const SizedBox(height: 32),
                WButton(
                  onTap: () {},
                  text: "+998 99 123 45 67",
                ),
                const SizedBox(height: 8),
                WButton(
                  onTap: () {},
                  color: blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.telegram.svg(),
                      const SizedBox(width: 12),
                      const Text("Telegram orqali bog‘lanish")
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
