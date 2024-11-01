import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/announcements/announcements_type_view.dart';
import 'package:carting/presentation/views/common/filter_view.dart';
import 'package:carting/presentation/views/home/deliver_info_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';

class AnnouncementsView extends StatefulWidget {
  const AnnouncementsView({super.key});

  @override
  State<AnnouncementsView> createState() => _AnnouncementsViewState();
}

class _AnnouncementsViewState extends State<AnnouncementsView>
    with SingleTickerProviderStateMixin {
  String selectedUnit = 'Barchasi';
  String selectedUnit2 = 'Barchasi';

  late TabController _tabController;
  ValueNotifier<int> tabIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      tabIndex.value = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => const FilterView(),
            ));
          },
          icon: AppIcons.filter.svg(),
        ),
        title: const Text("E’lonlar"),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 72),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: CustomTextField(
              prefixIcon: AppIcons.searchNormal.svg(),
              hintText: "Kerakli e’lonni qidiring",
            ),
          ),
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: tabIndex,
            builder: (context, value, __) {
              return AnimatedCrossFade(
                firstChild: WButton(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .push(MaterialPageRoute(
                      builder: (context) => const AnnouncementsTypeView(),
                    ));
                  },
                  height: 40,
                  width: 40,
                  borderRadius: 12,
                  child: AppIcons.addCircle.svg(),
                ),
                secondChild: const SizedBox(),
                alignment: Alignment.center,
                crossFadeState: value == 0
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
                reverseDuration: const Duration(milliseconds: 200),
              );
            },
          ),
          const SizedBox(width: 12),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  WTabBar(
                    isScrollable: true,
                    tabController: _tabController,
                    tabs: const [
                      Text("Barchasi"),
                      Text("Buyurtmalarim"),
                      Text("Xizmatlarim"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.separated(
              padding: const EdgeInsets.all(16).copyWith(bottom: 100),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(MaterialPageRoute(
                    builder: (context) => const DeliverInfoView(),
                  ));
                },
                child: const AnnouncementsIteam(isPrice: true),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 16),
              itemCount: 12,
            ),
            ListView.separated(
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
            ListView.separated(
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
          ],
        ),
      ),
    );
  }
}

class AnnouncementsIteam extends StatelessWidget {
  const AnnouncementsIteam({super.key, this.isPrice = false});
  final bool isPrice;

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
                    Builder(builder: (context) {
                      if (isPrice) {
                        return const Text(
                          '500 000 UZS',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: dark,
                          ),
                        );
                      }
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 10,
                        ),
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: green.withOpacity(.2),
                        ),
                        child: const Text(
                          "Faol",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: green,
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 8),
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
