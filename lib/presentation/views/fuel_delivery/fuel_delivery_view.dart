import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/data/models/fuels_model.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/selection_location_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_selection_fuels.dart';
import 'package:carting/utils/formatters.dart';

class FuelDeliveryView extends StatefulWidget {
  const FuelDeliveryView({super.key});

  @override
  State<FuelDeliveryView> createState() => _FuelDeliveryViewState();
}

class _FuelDeliveryViewState extends State<FuelDeliveryView> {
  late TextEditingController controller;
  FuelsModel selectedUnit = AppData.fuels.first;
  MapPoint? point;

  @override
  void initState() {
    controller = TextEditingController();
    context.read<AdvertisementBloc>().add(GetFuelsEvent(id: selectedUnit.id));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.fuelDelivery)),
      bottomNavigationBar: SafeArea(
        child: BlocBuilder<AdvertisementBloc, AdvertisementState>(
          builder: (context, state) {
            return WButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              margin: const EdgeInsets.all(16),
              isLoading: state.statusCreate.isInProgress,
              text: AppLocalizations.of(context)!.confirm,
            );
          },
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
                    controller: controller,
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

                        FuelsModel? selected = await showMenu<FuelsModel>(
                          context: context,
                          position: position,
                          color: white,
                          shadowColor: black.withValues(alpha: .3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          items: AppData.fuels.map((FuelsModel choice) {
                            return PopupMenuItem<FuelsModel>(
                              value: choice,
                              height: 32,
                              child: SizedBox(
                                width: 140,
                                child: Row(
                                  children: [
                                    Text(
                                      choice.type,
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
                          if (context.mounted) {
                            context
                                .read<AdvertisementBloc>()
                                .add(GetFuelsEvent(id: selected.id));
                          }
                        }
                      },
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.color.contColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ListTile(
                          title: Text(
                            "Benzin turi",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: context.color.darkText,
                            ),
                          ),
                          subtitle: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  selectedUnit.type,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
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
            WSelectionFuels(
              onTap: (model) {},
            ),
          ],
        ),
      ),
    );
  }
}
