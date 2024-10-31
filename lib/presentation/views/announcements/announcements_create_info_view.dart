import 'dart:io';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/common/location_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_title.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:flutter/material.dart';

class AnnouncementsCreateInfoView extends StatefulWidget {
  const AnnouncementsCreateInfoView({
    super.key,
    required this.filter,
    required this.images,
  });
  final TypeOfServiceEnum filter;
  final List<File> images;

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
              background: PageView.builder(
                itemCount: widget.images.length,
                itemBuilder: (context, index) => Image.file(
                  widget.images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: white,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Furgon",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
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
                  const Text(
                    "500 000 UZS",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: dark,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Assalomu alaykum! man sizga barcha turdagi yuklarni tashish uchun mo‘ljallangan Furgonimni taklif qilaman, shanba yakshanba ham ishlayman.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: dark.withOpacity(.3),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Builder(builder: (context) {
                    switch (widget.filter) {
                      case TypeOfServiceEnum.shipping:
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: scaffoldSecondaryBackground,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  "Qayerdan",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: dark.withOpacity(.3),
                                  ),
                                ),
                                subtitle: const Text(
                                  "Toshkent, Yakkasaroy tumani",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: dark,
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => LocationView(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: green,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: AppIcons.location.svg(
                                      height: 24,
                                      width: 24,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Divider(height: 1),
                              ),
                              ListTile(
                                title: Text(
                                  "Qayerga",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: dark.withOpacity(.3),
                                  ),
                                ),
                                subtitle: const Text(
                                  "Toshkent, Yakkasaroy tumani",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: dark,
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => LocationView(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: green,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: AppIcons.location.svg(
                                      height: 24,
                                      width: 24,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      case TypeOfServiceEnum.transportationOfPassengers ||
                            TypeOfServiceEnum.transportTransfer ||
                            TypeOfServiceEnum.storageInWarehouse:
                        return Column(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color: scaffoldSecondaryBackground,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: ListTile(
                                title: Text(
                                  "Qayerda",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: dark.withOpacity(.3),
                                  ),
                                ),
                                subtitle: const Text(
                                  "Toshkent, Yakkasaroy tumani",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: dark,
                                  ),
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => LocationView(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: green,
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: AppIcons.location.svg(
                                      height: 24,
                                      width: 24,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
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
                                          color: dark.withOpacity(.3),
                                        ),
                                      ),
                                      subtitle: const Text(
                                        "200",
                                        style: TextStyle(
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
                                          color: dark.withOpacity(.3),
                                        ),
                                      ),
                                      subtitle: const Text(
                                        "8",
                                        style: TextStyle(
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
                        return DecoratedBox(
                          decoration: BoxDecoration(
                            color: scaffoldSecondaryBackground,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: ListTile(
                            title: Text(
                              "Qayerda",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: dark.withOpacity(.3),
                              ),
                            ),
                            subtitle: const Text(
                              "Toshkent, Yakkasaroy tumani",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: dark,
                              ),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LocationView(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: green,
                                ),
                                padding: const EdgeInsets.all(8),
                                child: AppIcons.location.svg(
                                  height: 24,
                                  width: 24,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
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
                      onTap: () {},
                      leading: AppIcons.message.svg(),
                      title: const Row(
                        children: [
                          Expanded(child: Text("Izohlar")),
                          SizedBox(
                            width: 72,
                            height: 24,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage(AppImages.avatar_1),
                                ),
                                Positioned(
                                  left: 16,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage:
                                        AssetImage(AppImages.avatar_2),
                                  ),
                                ),
                                Positioned(
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
                                      "+86",
                                      style: TextStyle(
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
                                      color: dark.withOpacity(.3),
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
                                            color: dark.withOpacity(.3),
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
                                            color: dark.withOpacity(.3),
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
                                            color: dark.withOpacity(.3),
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
                                    color: dark.withOpacity(.3),
                                  ),
                                ),
                                subtitle: const Text(
                                  "Bepul",
                                  style: TextStyle(
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
                      "E’lon vaqti: 16.08.2024, 09:14",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: dark.withOpacity(.3),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  WButton(
                    onTap: () {},
                    text: "Faolsizlantirish",
                    color: red.withOpacity(.1),
                    textColor: red,
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
