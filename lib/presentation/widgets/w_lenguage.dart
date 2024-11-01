import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/src/settings/local_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WLenguage extends StatefulWidget {
  const WLenguage({super.key});

  @override
  State<WLenguage> createState() => _WLenguageState();
}

class _WLenguageState extends State<WLenguage> {
  List<InfoRowMod> list = [
    InfoRowMod(
      icon: AppImages.uzbekistan.imgAsset(height: 24),
      title: "Ўзбек",
      type: 'kk',
    ),
    InfoRowMod(
      icon: AppImages.uzbekistan.imgAsset(height: 24),
      title: "O‘zbek",
      type: 'uz',
    ),
    InfoRowMod(
      icon: AppImages.russia.imgAsset(height: 24),
      title: "Русский",
      type: 'ru',
    ),
    InfoRowMod(
      icon: AppImages.eng.imgAsset(height: 24),
      title: "English",
      type: 'en',
    ),
  ];

  ValueNotifier<int> selectIndex = ValueNotifier(0);
  @override
  void initState() {
    if (Provider.of<LocaleProvider>(context, listen: false).locale ==
        const Locale('ru')) {
      selectIndex.value = 2;
    } else if (Provider.of<LocaleProvider>(context, listen: false).locale ==
        const Locale('en')) {
      selectIndex.value = 3;
    } else if (Provider.of<LocaleProvider>(context, listen: false).locale ==
        const Locale('kk')) {
      selectIndex.value = 0;
    } else {
      selectIndex.value = 1;
    }
    super.initState();
  }

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
            valueListenable: selectIndex,
            builder: (context, value, __) {
              return Column(
                children: [
                  ...List.generate(
                    list.length,
                    (index) => ListTile(
                      onTap: () {
                        selectIndex.value = index;
                        Provider.of<LocaleProvider>(context, listen: false)
                            .setLocale(Locale(list[index].type));
                        Navigator.pop(context);
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
  final String type;

  InfoRowMod({
    required this.icon,
    required this.title,
    this.type = 'uz',
  });
}
