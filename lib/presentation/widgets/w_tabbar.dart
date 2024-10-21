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
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xFFF3F3F3),
      ),
      child: TabBar(
        dividerColor: Colors.transparent,
        padding: padding ?? const EdgeInsets.all(4),
        labelPadding: const EdgeInsets.all(12),
        indicator: ShapeDecoration(
          shadows: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 3),
              color: black.withOpacity(0.04),
            ),
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 3),
              color: black.withOpacity(0.12),
            ),
          ],
          shape: RoundedRectangleBorder(
            side: BorderSide(color: black.withOpacity(0.04)),
            borderRadius: BorderRadius.circular(16),
          ),
          color: const Color(0xFF1A1F23),
        ),
        controller: tabController,
        indicatorSize: TabBarIndicatorSize.tab,
        onTap: onTap,
        splashBorderRadius: BorderRadius.circular(8),
        unselectedLabelStyle:
            Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
        labelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
        unselectedLabelColor: shuttleGrey,
        labelColor: white,
        tabs: tabs,
      ),
    );
  }
}
