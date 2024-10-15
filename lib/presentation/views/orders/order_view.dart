import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/orders/type_of_service_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: AppIcons.filter.svg(),
        ),
        title: SizedBox(
          height: 24,
          width: 128,
          child: AppImages.logoTextDark.imgAsset(),
        ),
        actions: [
          WButton(
            margin: const EdgeInsets.only(right: 16),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const TypeOfServiceView(),
              ));
            },
            height: 40,
            width: 40,
            borderRadius: 12,
            color: green,
            child: AppIcons.addCircle.svg(),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: CustomTextField(
              prefixIcon: AppIcons.searchNormal.svg(),
              hintText: "Kerakli e’lonni qidiring",
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => Container(
          height: 340,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: white,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
                child: AppImages.mask.imgAsset(
                  height: 196,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Furgon",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          AppIcons.shipping.svg(),
                          const SizedBox(width: 4),
                          const Expanded(
                            child: Text(
                              "Yuk tashish",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          AppIcons.location.svg(),
                          const SizedBox(width: 4),
                          const Expanded(
                            child: Text(
                              "Toshkent, Yakkasaroy tumani",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          AppIcons.star.svg(),
                          const SizedBox(width: 4),
                          const Expanded(
                            child: Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 12,
      ),
    );
  }
}
