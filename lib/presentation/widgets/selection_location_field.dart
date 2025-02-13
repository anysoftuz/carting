import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/location_view.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:flutter/material.dart';

class SelectionLocationField extends StatefulWidget {
  const SelectionLocationField(
      {super.key, this.onTap1, this.onTap2, this.isOne = false});
  final Function(MapPoint? point)? onTap1;
  final Function(MapPoint? point)? onTap2;
  final bool isOne;

  @override
  State<SelectionLocationField> createState() => _SelectionLocationFieldState();
}

class _SelectionLocationFieldState extends State<SelectionLocationField> {
  MapPoint? point1;
  MapPoint? point2;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          if (widget.onTap1 != null)
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.from,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withValues(alpha: .3),
                ),
              ),
              subtitle: Text(
                point1?.name ?? AppLocalizations.of(context)!.unknown,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LocationView(
                      isFirst: true,
                      point1: point1,
                      point2: point2,
                      onTap: (mapPoint) {
                        Navigator.pop(context);
                        if (mapPoint != null) {
                          point1 = mapPoint;
                          widget.onTap1!(point1);
                          setState(() {});
                        }
                      },
                    ),
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: green,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: AppIcons.location.svg(
                    height: 24,
                    width: 24,
                    color: white,
                  ),
                ),
              ),
            ),
          if (widget.onTap1 != null)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1),
            ),
          if (widget.onTap2 != null)
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.to,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withValues(alpha: .3),
                ),
              ),
              subtitle: Text(
                point2?.name ?? AppLocalizations.of(context)!.unknown,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LocationView(
                        isFirst: false,
                        point1: point1,
                        point2: point2,
                        isOne: widget.isOne,
                        onTap: (mapPoint) {
                          Navigator.pop(context);
                          if (mapPoint != null) {
                            point2 = mapPoint;
                            widget.onTap2!(point2);
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: green,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: AppIcons.location.svg(
                    height: 24,
                    width: 24,
                    color: white,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
