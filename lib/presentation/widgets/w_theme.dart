import 'package:carting/assets/assets/icons.dart';

import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/assets/themes/theme_changer.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

class WTheme extends StatefulWidget {
  const WTheme({super.key});

  @override
  State<WTheme> createState() => _WThemeState();
}

class _WThemeState extends State<WTheme> {
  late List<InfoRowMod> list;

  ValueNotifier<int> selIndex = ValueNotifier(1);

  @override
  void initState() {
    super.initState();
    final theme = StorageRepository.getString(StorageKeys.MODE);
    if (theme == 'light') {
      selIndex.value = 1;
    } else if (theme == 'dark') {
      selIndex.value = 0;
    } else {
      selIndex.value = 2;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = [
      InfoRowMod(
        icon: AppIcons.moon.svg(height: 24),
        title: AppLocalizations.of(context)!.dark,
      ),
      InfoRowMod(
        icon: AppIcons.moon.svg(height: 24),
        title: AppLocalizations.of(context)!.light,
      ),
      InfoRowMod(
        icon: AppIcons.moon.svg(height: 24),
        title: AppLocalizations.of(context)!.system,
      ),
    ];
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
            color: context.color.contColor,
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
                        if (index == 0) {
                          AppScope.update(
                            context,
                            const AppScope(themeMode: ThemeMode.dark),
                          );
                        } else if (index == 1) {
                          AppScope.update(
                            context,
                            const AppScope(themeMode: ThemeMode.light),
                          );
                        } else {
                          AppScope.update(
                            context,
                            const AppScope(themeMode: ThemeMode.system),
                          );
                        }
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

  InfoRowMod({
    required this.icon,
    required this.title,
  });
}
