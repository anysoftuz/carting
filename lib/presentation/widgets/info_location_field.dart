import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/location_view.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:flutter/material.dart';

class InfoLocationField extends StatefulWidget {
  const InfoLocationField({
    super.key,
    this.point1,
    this.point2,
  });
  final MapPoint? point1;
  final MapPoint? point2;

  @override
  State<InfoLocationField> createState() => _InfoLocationFieldState();
}

class _InfoLocationFieldState extends State<InfoLocationField> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: scaffoldSecondaryBackground,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          if (widget.point1 != null)
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.from,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: context.color.darkText,
                ),
              ),
              subtitle: Text(
                widget.point1?.name ?? AppLocalizations.of(context)!.unknown,
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
                      point1: widget.point1,
                      point2: widget.point2,
                      onTap: (mapPoint) {
                        Navigator.pop(context);
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
          if (widget.point1 != null)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(height: 1),
            ),
          if (widget.point2 != null)
            ListTile(
              title: Text(
                AppLocalizations.of(context)!.to,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: context.color.darkText,
                ),
              ),
              subtitle: Text(
                widget.point2?.name ?? AppLocalizations.of(context)!.unknown,
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
                        point1: widget.point1,
                        point2: widget.point2,
                        onTap: (mapPoint) {
                          Navigator.pop(context);
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
