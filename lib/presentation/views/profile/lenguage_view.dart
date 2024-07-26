import 'package:carting/assets/assets/images.dart';
import 'package:carting/presentation/views/profile/theme_view.dart';
import 'package:flutter/material.dart';

class LenguageView extends StatefulWidget {
  const LenguageView({super.key});

  @override
  State<LenguageView> createState() => _LenguageViewState();
}

class _LenguageViewState extends State<LenguageView> {
  ValueNotifier<int> selectIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Til")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ValueListenableBuilder(
          valueListenable: selectIndex,
          builder: (context, value, __) {
            return Column(
              children: [
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 0,
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: AppImages.uzbekistan.imgAsset(),
                  ),
                  title: 'O’zbekcha',
                ),
                const SizedBox(height: 16),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 1,
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: AppImages.uzbekistan.imgAsset(),
                  ),
                  title: 'Ўзбекча',
                ),
                const SizedBox(height: 16),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 2,
                  trailing: SizedBox(
                    height: 24,
                    width: 24,
                    child: AppImages.russia.imgAsset(),
                  ),
                  title: 'Русский',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
