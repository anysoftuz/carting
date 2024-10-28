import 'package:carting/assets/assets/icons.dart';

import 'package:carting/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class WTheme extends StatefulWidget {
  const WTheme({super.key});

  @override
  State<WTheme> createState() => _WThemeState();
}

class _WThemeState extends State<WTheme> {
  List<InfoRowMod> list = [
    InfoRowMod(
      icon: AppIcons.moon.svg(height: 24),
      title: "Dark",
    ),
    InfoRowMod(
      icon: AppIcons.moon.svg(height: 24),
      title: "Light",
    ),
    InfoRowMod(
      icon: AppIcons.moon.svg(height: 24),
      title: "System",
    ),
  ];

  ValueNotifier<int> selIndex = ValueNotifier(1);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          width: double.infinity,
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: ValueListenableBuilder(
            valueListenable: selIndex,
            builder: (context, value, __) {
              return Column(
                children: [
                  ...List.generate(
                    list.length,
                    (index) => ListTile(
                      onTap: () {
                        selIndex.value = index;
                      },
                      leading: list[index].icon,
                      title: Text(list[index].title),
                      trailing: index == value
                          ? AppIcons.checkboxRadio.svg()
                          : AppIcons.checkboxRadioDis.svg(),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class InfoRowMod {
  final Widget icon;
  final String title;

  InfoRowMod({
    required this.icon,
    required this.title,
  });
}
