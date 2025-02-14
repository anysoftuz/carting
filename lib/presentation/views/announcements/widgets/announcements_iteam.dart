import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/utils/my_function.dart';

class AnnouncementsIteam extends StatelessWidget {
  const AnnouncementsIteam({
    super.key,
    this.isPrice = false,
    required this.model,
  });
  final bool isPrice;
  final AdvertisementModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.color.contColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Builder(builder: (context) {
                      if (isPrice) {
                        return Text(
                          '${MyFunction.priceFormat(model.price ?? 0)} UZS',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                      if (model.status == 'ACTIVE') {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: green.withValues(alpha: .2),
                          ),
                          child: const Text(
                            "Faol",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: green,
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 10,
                          ),
                          margin: const EdgeInsets.only(bottom: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: red.withValues(alpha: .2),
                          ),
                          child: const Text(
                            "Faol emas",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: red,
                            ),
                          ),
                        );
                      }
                    }),
                    const SizedBox(height: 8),
                    Text(
                      model.serviceName ??
                          AppLocalizations.of(context)!.unknown,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: context.color.darkText,
                      ),
                    )
                  ],
                ),
              ),
              if (model.transportIcon != null)
                CachedNetworkImage(
                  imageUrl: model.transportIcon!,
                  height: 48,
                )
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              if (model.fromLocation != null)
                Text(
                  (model.fromLocation?.name ??
                                  AppLocalizations.of(context)!.unknown)
                              .split(' ')
                              .first ==
                          "Oʻzbekiston,"
                      ? (model.fromLocation?.name ??
                              AppLocalizations.of(context)!.unknown)
                          .split(' ')[1]
                      : (model.fromLocation?.name ??
                              AppLocalizations.of(context)!.unknown)
                          .split(' ')
                          .first,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              if (model.fromLocation != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: AppIcons.swap.svg(),
                ),
              Text(
                (model.toLocation?.name ??
                                AppLocalizations.of(context)!.unknown)
                            .split(' ')
                            .first ==
                        "Oʻzbekiston,"
                    ? (model.toLocation?.name ??
                            AppLocalizations.of(context)!.unknown)
                        .split(' ')[1]
                    : (model.toLocation?.name ??
                            AppLocalizations.of(context)!.unknown)
                        .split(' ')
                        .first,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            model.shipmentDate ?? AppLocalizations.of(context)!.unknown,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: context.color.darkText,
            ),
          )
        ],
      ),
    );
  }
}
