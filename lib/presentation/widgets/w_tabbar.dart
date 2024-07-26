import 'package:carting/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WTabBar extends StatelessWidget {
  final TabController? tabController;
  final List<Widget> tabs;
  final Function(int)? onTap;
  final EdgeInsetsGeometry? padding;

  const WTabBar({
    this.tabController,
    required this.tabs,
    super.key,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: greyBack.withOpacity(.12),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        padding: padding ?? const EdgeInsets.all(4),
        labelPadding: const EdgeInsets.all(4),
        indicator: ShapeDecoration(
          shadows: [
            BoxShadow(
                blurRadius: 1,
                offset: const Offset(0, 3),
                color: black.withOpacity(0.04)),
            BoxShadow(
                blurRadius: 8,
                offset: const Offset(0, 3),
                color: black.withOpacity(0.12)),
          ],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: black.withOpacity(0.04)),
            borderRadius: BorderRadius.circular(10),
          ),
          color: white,
        ),
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: onTap,
        splashBorderRadius: BorderRadius.circular(8),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .displayLarge!
            .copyWith(fontSize: 13, fontWeight: FontWeight.w600),
        labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
        unselectedLabelColor: shuttleGrey,
        labelColor: black,
        tabs: tabs,
      ),
    );
  }
}
