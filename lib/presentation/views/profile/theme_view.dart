import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  State<ThemeView> createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  ValueNotifier<int> selectIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mavzu")),
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
                  trailing: AppIcons.moon.svg(
                    color: value == 0 ? green : dark,
                  ),
                  title: 'Qorong’u',
                ),
                const SizedBox(height: 16),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 1,
                  trailing: AppIcons.sun.svg(
                    color: value == 1 ? green : dark,
                  ),
                  title: 'Yorug’',
                ),
                const SizedBox(height: 16),
                ThemeIteam(
                  selectIndex: selectIndex,
                  value: value,
                  index: 2,
                  trailing: AppIcons.mobile.svg(
                    color: value == 2 ? green : dark,
                  ),
                  title: 'Qurilma mavzusi',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class ThemeIteam extends StatelessWidget {
  const ThemeIteam({
    super.key,
    required this.selectIndex,
    required this.value,
    required this.index,
    this.trailing,
    required this.title,
  });

  final ValueNotifier<int> selectIndex;
  final int value;
  final int index;
  final Widget? trailing;
  final String title;

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        selectIndex.value = index;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          border: value == index ? Border.all(color: green) : null,
          color: value == index ? white : whiteSmoke,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            if (trailing != null) ...[
              trailing!,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: value == index ? green : dark,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 12),
            value == index
                ? AppIcons.checkboxRadio.svg()
                : AppIcons.checkboxRadioDis.svg(),
          ],
        ),
      ),
    );
  }
}
