import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/selection_location_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/formatters.dart';
import 'package:flutter/material.dart';

class FuelDeliveryView extends StatefulWidget {
  const FuelDeliveryView({super.key});

  @override
  State<FuelDeliveryView> createState() => _FuelDeliveryViewState();
}

class _FuelDeliveryViewState extends State<FuelDeliveryView> {
  String selectedUnit = 'Ai 80';
  MapPoint? point;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yoqilg‘i yetkazish")),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {
            Navigator.of(context).pop();
          },
          margin: const EdgeInsets.all(16),
          text: AppLocalizations.of(context)!.confirm,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SelectionLocationField(
              onTap2: (point) {
                point = point;
              },
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: MinTextField(
                    text: "Hamji (litr)",
                    hintText: "0 litr",
                    keyboardType: TextInputType.number,
                    formatter: [Formatters.numberFormat],
                    onChanged: (value) {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Builder(builder: (context) {
                    return GestureDetector(
                      onTap: () async {
                        final RenderBox button =
                            context.findRenderObject() as RenderBox;
                        final RenderBox overlay = Overlay.of(context)
                            .context
                            .findRenderObject() as RenderBox;

                        final RelativeRect position = RelativeRect.fromRect(
                          Rect.fromPoints(
                            button.localToGlobal(
                              Offset(0, button.size.height),
                              ancestor: overlay,
                            ),
                            button.localToGlobal(
                              button.size.bottomRight(Offset.zero),
                              ancestor: overlay,
                            ),
                          ),
                          Offset.zero & overlay.size,
                        );

                        String? selected = await showMenu<String>(
                          context: context,
                          position: position,
                          color: white,
                          shadowColor: black.withValues(alpha: .3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          items: ['Ai 80', 'Ai 91', 'Ai 92', 'Ai 95']
                              .map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              height: 32,
                              child: SizedBox(
                                width: 140,
                                child: Row(
                                  children: [
                                    Text(
                                      choice,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: dark,
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: choice == selectedUnit
                                          ? AppIcons.checkboxRadio.svg(
                                              height: 16,
                                              width: 16,
                                            )
                                          : AppIcons.checkboxRadioDis.svg(
                                              height: 16,
                                              width: 16,
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        );

                        if (selected != null) {
                          setState(() {
                            selectedUnit = selected;
                          });
                        }
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ListTile(
                          title: Text(
                            "Benzin turi",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: dark.withValues(alpha: .3),
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  selectedUnit,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: dark,
                                  ),
                                ),
                              ),
                              AppIcons.arrowBottom.svg()
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: Text(
                  "Kompaniyalar ro‘yhati",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: dark.withValues(alpha: .3),
                  ),
                ),
                subtitle: const Text(
                  "Kompaniyani tanlang",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: dark,
                  ),
                ),
                trailing: AppIcons.arrowBottom.svg(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
