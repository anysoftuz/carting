import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class DeliverInfoView extends StatelessWidget {
  const DeliverInfoView({super.key, required this.model, this.isMe = true});
  final AdvertisementModel model;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.cargoTransport)),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 16,
            children: [
              Text(
                'E’lon vaqti: ${model.shipmentDate ?? AppLocalizations.of(context)!.unknown}',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: dark.withValues(alpha: .3),
                ),
              ),
              if (model.status == 'ACTIVE' && isMe)
                BlocBuilder<AdvertisementBloc, AdvertisementState>(
                  builder: (context, state) {
                    return WButton(
                      onTap: () {
                        final bloc = context.read<AdvertisementBloc>();
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          useRootNavigator: true,
                          builder: (context) => Column(
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
                                padding: const EdgeInsets.symmetric(
                                  vertical: 24,
                                  horizontal: 16,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                          .cancelAnnouncement,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: dark.withValues(alpha: .3),
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: WButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            text: AppLocalizations.of(context)!
                                                .no,
                                            textColor: darkText,
                                            color: const Color(0xFFF3F3F3),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: WButton(
                                            onTap: () {
                                              Navigator.pop(context);
                                              bloc.add(
                                                  DeactivetEvent(id: model.id));
                                              Navigator.pop(context);
                                            },
                                            text: AppLocalizations.of(context)!
                                                .yes,
                                            textColor: darkText,
                                            color: const Color(0xFFF3F3F3),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      text: AppLocalizations.of(context)!.deactivate,
                      textColor: red,
                      isLoading: state.statusCreate.isInProgress,
                      color: red.withValues(alpha: .2),
                    );
                  },
                ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            WButton(
              onTap: () {},
              color: model.status == 'ACTIVE'
                  ? green.withValues(alpha: .2)
                  : red.withValues(alpha: .2),
              textColor: model.status == 'ACTIVE' ? green : red,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              text: model.status == 'ACTIVE'
                  ? AppLocalizations.of(context)!.active
                  : AppLocalizations.of(context)!.notActive,
              child: model.status == 'ACTIVE'
                  ? Row(
                      children: [
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.active,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        AppIcons.editCir.svg(),
                      ],
                    )
                  : null,
            ),
            const SizedBox(height: 24),
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  if (model.fromLocation != null)
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
                        model.fromLocation?.name ??
                            AppLocalizations.of(context)!.unknown,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      ),
                      trailing: Container(
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
                  if (model.fromLocation != null && model.toLocation != null)
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Divider(height: 1),
                    ),
                  if (model.toLocation != null)
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
                        model.toLocation?.name ??
                            AppLocalizations.of(context)!.unknown,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      ),
                      trailing: Container(
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
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              spacing: 12,
              children: [
                if (model.details?.loadWeight != null)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.loadWeight,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: dark.withValues(alpha: .3),
                            ),
                          ),
                          Text(
                            "${model.details?.loadWeight?.amount ?? AppLocalizations.of(context)!.unknown} ${model.details?.loadWeight?.name ?? ""}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (model.details?.passengerCount != null)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.passengerCount,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: dark.withValues(alpha: .3),
                            ),
                          ),
                          Text(
                            "${model.details?.passengerCount ?? "0"} kishi",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                if (model.details?.transportCount != null)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.transportCount,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: dark.withValues(alpha: .3),
                            ),
                          ),
                          Text(
                            "${model.details?.transportCount ?? "0"}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: dark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.departureDate,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: dark.withValues(alpha: .3),
                          ),
                        ),
                        Row(
                          children: [
                            AppIcons.calendar.svg(),
                            const SizedBox(width: 4),
                            Text(
                              model.shipmentDate ??
                                  AppLocalizations.of(context)!.unknown,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: dark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: Text(AppLocalizations.of(context)!.additionalInfo),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withValues(alpha: .3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.cargoType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: AppIcons.arrowForward.svg(),
              ),
            ),
            const SizedBox(height: 8),
            DecoratedBox(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ListTile(
                title: Text(AppLocalizations.of(context)!.transportType),
                subtitle: Text(model.transportName ??
                    AppLocalizations.of(context)!.unknown),
                minVerticalPadding: 0,
                titleTextStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withValues(alpha: .3),
                ),
                subtitleTextStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: dark,
                ),
                trailing: model.transportIcon != null
                    ? CachedNetworkImage(imageUrl: model.transportIcon!)
                    : null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
