import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/comments_view.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/presentation/widgets/info_location_field.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_title.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AnnouncementsCreateInfoView extends StatefulWidget {
  const AnnouncementsCreateInfoView({
    super.key,
    required this.filter,
    required this.model,
  });
  final TypeOfServiceEnum filter;
  final AdvertisementModel model;

  @override
  State<AnnouncementsCreateInfoView> createState() =>
      _AnnouncementsCreateInfoViewState();
}

class _AnnouncementsCreateInfoViewState
    extends State<AnnouncementsCreateInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
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
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: (widget.model.images != null &&
                      widget.model.images!.isNotEmpty)
                  ? PageView.builder(
                      itemCount: widget.model.images!.length,
                      itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl:
                            'https://api.carting.uz/uploads/files/${widget.model.images![index]}',
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: context.color.contColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.model.transportName ??
                            AppLocalizations.of(context)!.unknown,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          AppIcons.star.svg(),
                          RichText(
                            text: TextSpan(
                              text:
                                  "${MyFunction.calculateAverageRating(widget.model.comments ?? [])}, ",
                              style: const TextStyle(
                                fontSize: 14,
                                color: dark,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      "${widget.model.comments?.length ?? 0} ta izoh",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: context.color.darkText,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "${MyFunction.priceFormat(widget.model.price ?? 0)} UZS",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: dark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.model.note,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: context.color.darkText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Builder(builder: (context) {
                    switch (widget.filter) {
                      case TypeOfServiceEnum.shipping:
                        return InfoLocationField(
                          point1: widget.model.fromLocation != null
                              ? MapPoint(
                                  name: widget.model.fromLocation!.name,
                                  latitude: widget.model.fromLocation!.lat,
                                  longitude: widget.model.fromLocation!.lng,
                                )
                              : null,
                          point2: widget.model.toLocation != null
                              ? MapPoint(
                                  name: widget.model.toLocation!.name,
                                  latitude: widget.model.toLocation!.lat,
                                  longitude: widget.model.toLocation!.lng,
                                )
                              : null,
                        );
                      case TypeOfServiceEnum.transportationOfPassengers ||
                            TypeOfServiceEnum.transportTransfer ||
                            TypeOfServiceEnum.storageInWarehouse:
                        return Column(
                          children: [
                            InfoLocationField(
                              point1: widget.model.fromLocation != null
                                  ? MapPoint(
                                      name: widget.model.fromLocation!.name,
                                      latitude: widget.model.fromLocation!.lat,
                                      longitude: widget.model.fromLocation!.lng,
                                    )
                                  : null,
                              point2: widget.model.toLocation != null
                                  ? MapPoint(
                                      name: widget.model.toLocation!.name,
                                      latitude: widget.model.toLocation!.lat,
                                      longitude: widget.model.toLocation!.lng,
                                    )
                                  : null,
                            ),
                            const SizedBox(height: 16),
                            Builder(builder: (context) {
                              switch (widget.filter) {
                                case TypeOfServiceEnum.storageInWarehouse:
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: scaffoldSecondaryBackground,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "Maydon",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: context.color.darkText,
                                        ),
                                      ),
                                      subtitle: Text(
                                        widget.model.details?.area ??
                                            AppLocalizations.of(context)!
                                                .unknown,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: dark,
                                        ),
                                      ),
                                      trailing: const Text(
                                        "m2",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: dark,
                                        ),
                                      ),
                                    ),
                                  );
                                case TypeOfServiceEnum.transportTransfer:
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: scaffoldSecondaryBackground,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "Maksimal transport soni",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: context.color.darkText,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${widget.model.details?.transportCount ?? AppLocalizations.of(context)!.unknown}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: dark,
                                        ),
                                      ),
                                    ),
                                  );

                                default:
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: scaffoldSecondaryBackground,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        "Maksimal yo‘lovchi soni",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: context.color.darkText,
                                        ),
                                      ),
                                      subtitle: Text(
                                        "${widget.model.details?.passengerCount ?? AppLocalizations.of(context)!.unknown}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: dark,
                                        ),
                                      ),
                                    ),
                                  );
                              }
                            }),
                          ],
                        );
                      case TypeOfServiceEnum.workshops:
                        return Column(
                          children: [
                            const WTitle(title: 'Toifalar'),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                  AppData.categories.length,
                                  (index) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: scaffoldSecondaryBackground,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 14,
                                    ),
                                    child: Text(
                                      AppData.categories[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const WTitle(title: 'Xizmatlar'),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                  AppData.services.length,
                                  (index) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: scaffoldSecondaryBackground,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 14,
                                    ),
                                    child: Text(
                                      AppData.services[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
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
                                  "Toshkent, Yakkasaroy tumanihlar",
                                  maxLines: 1,
                                ),
                                trailing: AppIcons.arrowCircle.svg(),
                              ),
                            ),
                          ],
                        );

                      case TypeOfServiceEnum.masters:
                        return Column(
                          children: [
                            const WTitle(title: 'Xizmatlar'),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                  AppData.services.length,
                                  (index) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: scaffoldSecondaryBackground,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 14,
                                    ),
                                    child: Text(
                                      AppData.services[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),
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
                                  "Toshkent, Yakkasaroy tumanihlar",
                                  maxLines: 1,
                                ),
                                trailing: AppIcons.arrowCircle.svg(),
                              ),
                            ),
                          ],
                        );
                      case TypeOfServiceEnum.specialTechnique ||
                            TypeOfServiceEnum.fuelDelivery:
                        return InfoLocationField(
                          point1: widget.model.fromLocation != null
                              ? MapPoint(
                                  name: widget.model.fromLocation!.name,
                                  latitude: widget.model.fromLocation!.lat,
                                  longitude: widget.model.fromLocation!.lng,
                                )
                              : null,
                          point2: widget.model.toLocation != null
                              ? MapPoint(
                                  name: widget.model.toLocation!.name,
                                  latitude: widget.model.toLocation!.lat,
                                  longitude: widget.model.toLocation!.lng,
                                )
                              : null,
                        );
                      default:
                        return const SizedBox();
                    }
                  }),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: scaffoldSecondaryBackground,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CommentsView(
                            comments: widget.model.comments ?? [],
                          ),
                        ));
                      },
                      leading: AppIcons.message.svg(),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.comments,
                            ),
                          ),
                          if (widget.model.comments != null)
                            SizedBox(
                              width: 72,
                              height: 24,
                              child: Stack(
                                children: [
                                  const CircleAvatar(
                                    radius: 12,
                                    backgroundImage:
                                        AssetImage(AppImages.avatar_1),
                                  ),
                                  const Positioned(
                                    left: 16,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage:
                                          AssetImage(AppImages.avatar_2),
                                    ),
                                  ),
                                  const Positioned(
                                    left: 32,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundImage:
                                          AssetImage(AppImages.avatar_3),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: white,
                                      child: Text(
                                        "+${widget.model.comments?.length ?? 0}",
                                        style: const TextStyle(
                                          fontSize: 8,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                      trailing: AppIcons.arrowCircle.svg(),
                    ),
                  ),
                  Builder(builder: (context) {
                    switch (widget.filter) {
                      case TypeOfServiceEnum.fuelDelivery:
                        return Column(
                          children: [
                            const SizedBox(height: 16),
                            Container(
                              decoration: BoxDecoration(
                                color: scaffoldSecondaryBackground,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Yoqilg’i turi va narxi',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color: context.color.darkText,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      text: 'AI 80',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: dark,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' - 8 500 so‘m',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: context.color.darkText,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: TextSpan(
                                      text: 'AI 92',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: dark,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' - 13 000 so‘m',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: context.color.darkText,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  RichText(
                                    text: TextSpan(
                                      text: 'AI 95',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: dark,
                                      ),
                                      children: [
                                        TextSpan(
                                          text: ' - 15 000 so‘m',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: context.color.darkText,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: scaffoldSecondaryBackground,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: ListTile(
                                title: Text(
                                  "Yetkazib berish narxi",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: context.color.darkText,
                                  ),
                                ),
                                subtitle: Text(
                                  (widget.model.price != null ||
                                          widget.model.price != 0)
                                      ? "${MyFunction.priceFormat(widget.model.price ?? 0)} so'm"
                                      : "Bepul",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: dark,
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      default:
                        return const SizedBox();
                    }
                  }),
                  const SizedBox(height: 32),
                  Center(
                    child: Text(
                      "E’lon vaqti: ${widget.model.shipmentDate ?? AppLocalizations.of(context)!.unknown}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: context.color.darkText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  if (widget.model.status == 'ACTIVE')
                    BlocBuilder<AdvertisementBloc, AdvertisementState>(
                      builder: (context, state) {
                        return WButton(
                          onTap: () {
                            final bloc = context.read<AdvertisementBloc>();
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              useRootNavigator: true,
                              builder: (context) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    height: 4,
                                    width: 64,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color(0xFFB7BFC6),
                                    ),
                                    margin: const EdgeInsets.all(12),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 24,
                                      horizontal: 16,
                                    ),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: context.color.contColor,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Haqiqatdan ham e’lonni bekor qilmoqchimisiz?",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: context.color.darkText,
                                          ),
                                        ),
                                        const SizedBox(height: 24),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: WButton(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                text: "Yo‘q",
                                                textColor: darkText,
                                                color: const Color(0xFFF3F3F3),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: WButton(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  bloc.add(DeactivetEvent(
                                                    id: widget.model.id,
                                                  ));
                                                  Navigator.pop(context);
                                                },
                                                text: "Ha",
                                                textColor: darkText,
                                                color: const Color(0xFFF3F3F3),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 24),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          text: "Faolsizlantirish",
                          textColor: red,
                          isLoading: state.statusCreate.isInProgress,
                          color: red.withValues(alpha: .2),
                        );
                      },
                    ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
