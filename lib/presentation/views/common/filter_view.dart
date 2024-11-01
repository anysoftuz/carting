import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  List<String> list = [
    "Polirovka",
    "Keramika",
    "Bo’yoq",
    "Myatina",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.filter),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Tozalash",
              style: TextStyle(color: red),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: white,
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Xizmatlar",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: dark.withOpacity(.3),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(
                      list.length,
                      (index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: green,
                          boxShadow: [
                            BoxShadow(
                              color: green.withOpacity(.32),
                              blurRadius: 16,
                              spreadRadius: -24,
                              offset: const Offset(0, 8),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 16,
                        ),
                        child: Text(
                          list[index],
                          style: const TextStyle(
                            color: white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: white,
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reyting",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: dark.withOpacity(.3),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(
                      5,
                      (index) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: green,
                          boxShadow: [
                            BoxShadow(
                              color: green.withOpacity(.32),
                              blurRadius: 16,
                              spreadRadius: -24,
                              offset: const Offset(0, 8),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 14,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppIcons.star.svg(color: white),
                            const SizedBox(width: 4),
                            Text(
                              (index + 1).toString(),
                              style: const TextStyle(
                                color: white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
