import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

class CarsRentalIteam extends StatelessWidget {
  const CarsRentalIteam({
    super.key,
    required this.model,
  });
  final AdvertisementModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 316,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: context.color.contColor,
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
                  )
                : AppImages.kiaSonet.imgAsset(
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          model.carName ??
                              AppLocalizations.of(context)!.unknown,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Text(
                        "${MyFunction.priceFormat(model.price ?? 0)} UZS",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      AppIcons.location.svg(
                        height: 16,
                        width: 16,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          model.fromLocation?.name ??
                              AppLocalizations.of(context)!.unknown,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: context.color.darkText,
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
