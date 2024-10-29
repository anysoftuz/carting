import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/home/deliver_info_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';

class AnnouncementsView extends StatefulWidget {
  const AnnouncementsView({super.key});

  @override
  State<AnnouncementsView> createState() => _AnnouncementsViewState();
}

class _AnnouncementsViewState extends State<AnnouncementsView> {
  String selectedUnit = 'Barchasi';
  String selectedUnit2 = 'Barchasi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("E’lonlar"),
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
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const WTabBar(
                      tabs: [
                        Text("Barchasi"),
                        Text("Mening e’lonlarim"),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () async {
                              final RenderBox button =
                                  context.findRenderObject() as RenderBox;
                              final RenderBox overlay = Overlay.of(context)
                                  .context
                                  .findRenderObject() as RenderBox;

                              final RelativeRect position =
                                  RelativeRect.fromRect(
                                Rect.fromPoints(
                                  button.localToGlobal(
                                      Offset(0, button.size.height),
                                      ancestor: overlay),
                                  button.localToGlobal(
                                      button.size.bottomRight(Offset.zero),
                                      ancestor: overlay),
                                ),
                                Offset.zero & overlay.size,
                              );
                              String? selected = await showMenu<String>(
                                context: context,
                                position: position,
                                color: white,
                                shadowColor: black.withOpacity(.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                items: [
                                  'Barchasi',
                                  'Yuk tashish',
                                  'Yo‘lovchi tashish',
                                  'Maxsus texnika',
                                  'transport transferi',
                                  'Omborda saqlash'
                                ].map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    height: 32,
                                    child: Row(
                                      children: [
                                        Text(
                                          choice,
                                          style: TextStyle(
                                            color: dark.withOpacity(.3),
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          height: 16,
                                          width: 16,
                                          child: choice == selectedUnit2
                                              ? AppIcons.checkboxRadio.svg(
                                                  height: 16,
                                                  width: 16,
                                                )
                                              : AppIcons.checkboxRadioDis.svg(
                                                  height: 16,
                                                  width: 16,
                                                ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                              );

                              if (selected != null) {
                                setState(() {
                                  selectedUnit2 = selected;
                                });
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  selectedUnit2 == 'Barchasi'
                                      ? "Xizmatlar"
                                      : selectedUnit2,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                AppIcons.arrowBottom.svg(),
                              ],
                            ),
                          );
                        }),
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () async {
                              final RenderBox button =
                                  context.findRenderObject() as RenderBox;
                              final RenderBox overlay = Overlay.of(context)
                                  .context
                                  .findRenderObject() as RenderBox;

                              final RelativeRect position =
                                  RelativeRect.fromRect(
                                Rect.fromPoints(
                                  button.localToGlobal(
                                      Offset(0, button.size.height),
                                      ancestor: overlay),
                                  button.localToGlobal(
                                      button.size.bottomRight(Offset.zero),
                                      ancestor: overlay),
                                ),
                                Offset.zero & overlay.size,
                              );

                              String? selected = await showMenu<String>(
                                context: context,
                                position: position,
                                color: white,
                                shadowColor: black.withOpacity(.3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                items: ['Barchasi', 'Faol', 'Faol emas']
                                    .map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    height: 32,
                                    child: SizedBox(
                                      width: 140,
                                      child: Row(
                                        children: [
                                          Text(
                                            choice,
                                            style: TextStyle(
                                              color: dark.withOpacity(.3),
                                            ),
                                          ),
                                          const Spacer(),
                                          SizedBox(
                                            height: 16,
                                            width: 16,
                                            child: choice == selectedUnit
                                                ? AppIcons.checkboxRadio.svg(
                                                    height: 16,
                                                    width: 16,
                                                  )
                                                : AppIcons.checkboxRadioDis.svg(
                                                    height: 16,
                                                    width: 16,
                                                  ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );

                              if (selected != null) {
                                setState(() {
                                  selectedUnit = selected;
                                });
                              }
                            },
                            child: Row(
                              children: [
                                Text(
                                  selectedUnit == 'Barchasi'
                                      ? "Status bo’yicha"
                                      : selectedUnit,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: green,
                                  ),
                                ),
                                AppIcons.arrowBottom.svg(color: green),
                              ],
                            ),
                          );
                        }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
          body: ListView.separated(
            padding: const EdgeInsets.all(16).copyWith(bottom: 100),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context, rootNavigator: true)
                    .push(MaterialPageRoute(
                  builder: (context) => const DeliverInfoView(),
                ));
              },
              child: const AnnouncementsIteam(),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 12,
          ),
        ),
      ),
    );
  }
}

class AnnouncementsIteam extends StatelessWidget {
  const AnnouncementsIteam({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: white,
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
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: green.withOpacity(.2),
                      ),
                      child: const Text(
                        "Faol",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: green,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Yuk tashish",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: dark.withOpacity(.3),
                      ),
                    )
                  ],
                ),
              ),
              AppImages.truck.imgAsset(height: 48),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              const Text(
                "Toshkent",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: AppIcons.swap.svg(),
              ),
              const Text(
                "Samarqand",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "16.08.2024",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: dark.withOpacity(.3),
            ),
          )
        ],
      ),
    );
  }
}
