import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.notifications)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.color.contGrey,
            ),
            child: Text(AppLocalizations.of(context)!.yourCargoIsOnTheWay),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.color.contGrey,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(AppLocalizations.of(context)!.driverDeliveredCargo),
                const SizedBox(height: 12),
                WButton(
                  onTap: () {},
                  textColor: red,
                  height: 40,
                  borderRadius: 12,
                  color: red.withValues(alpha: .2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.phone.svg(color: red),
                      const SizedBox(width: 8),
                      Text(AppLocalizations.of(context)!.contactUs)
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
        child: WButton(
          onTap: () {},
          textColor: green,
          color: green.withValues(alpha: .2),
          text: AppLocalizations.of(context)!.markAsRead,
        ),
      ),
    );
  }
}
