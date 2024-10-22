
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class OrdersIteam extends StatelessWidget {
  const OrdersIteam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      AppIcons.shipping.svg(
                        height: 16,
                        width: 16,
                      ),
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
                      AppIcons.location.svg(
                        height: 16,
                        width: 16,
                      ),
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
    );
  }
}
