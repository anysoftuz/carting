import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatefulWidget {
  const MainView({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  void _onTap(BuildContext context, int index) {
    debugPrint("NIma gap $index");
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: white,
        elevation: 1,
        selectedItemColor: green,
        unselectedItemColor: darkIcon,
        currentIndex: widget.navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: AppIcons.home.svg(color: darkIcon),
            activeIcon: AppIcons.home.svg(color: green),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            icon: AppIcons.box.svg(color: darkIcon),
            activeIcon: AppIcons.box.svg(color: green),
            label: "E’lonlar",
          ),
          BottomNavigationBarItem(
            icon: AppIcons.car.svg(color: darkIcon),
            activeIcon: AppIcons.car.svg(color: green),
            label: "Transport",
          ),
          BottomNavigationBarItem(
            icon: AppIcons.profile.svg(color: darkIcon),
            activeIcon: AppIcons.profile.svg(color: green),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
