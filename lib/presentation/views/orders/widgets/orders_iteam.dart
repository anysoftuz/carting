import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

class OrdersIteam extends StatelessWidget {
  const OrdersIteam({super.key, required this.model, required this.type});
  final AdvertisementModel model;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 340,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: white,
        boxShadow: wboxShadow,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(24),
            ),
            child: (model.images != null && model.images!.isNotEmpty)
                ? CachedNetworkImage(
                    imageUrl:
                        'https://api.carting.uz/uploads/files/${model.images!.first}',
                    height: 196,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const SizedBox(
                      height: 196,
                      width: double.infinity,
                    ),
                  )
                : AppImages.workshop.imgAsset(
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
                  Text(
                    model.transportName ?? "Nomalum",
                    style: const TextStyle(
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
                      Expanded(
                        child: Text(
                          type,
                          style: const TextStyle(
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
                      Expanded(
                        child: Text(
                          model.fromLocation?.name ?? "nomalum",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
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
                      Expanded(
                        child: Text(
                          "${MyFunction.calculateAverageRating(model.comments ?? [])}",
                          style: const TextStyle(
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
