import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/comments_view.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_title.dart';

class MasterInfoView extends StatefulWidget {
  const MasterInfoView({super.key, required this.model});
  final AdvertisementModel model;

  @override
  State<MasterInfoView> createState() => _MasterInfoViewState();
}

class _MasterInfoViewState extends State<MasterInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: white,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            expandedHeight: 400,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: widget.model.images != null
                  ? PageView.builder(
                      itemCount: widget.model.images?.length ?? 0,
                      itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl:
                            'https://api.carting.uz/uploads/files/${widget.model.images![index]}',
                        fit: BoxFit.cover,
                      ),
                    )
                  : AppImages.exp.imgAsset(
                      fit: BoxFit.cover,
                    ),
            ),
          )
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.model.serviceName ??
                        AppLocalizations.of(context)!.unknown,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      AppIcons.star.svg(),
                      RichText(
                        text: TextSpan(
                          text:
                              "${MyFunction.calculateAverageRating(widget.model.comments ?? [])}, ",
                          style: const TextStyle(
                            fontSize: 14,
                            color: dark,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  "${widget.model.comments?.length ?? 0} ta izoh",
                              style: TextStyle(
                                fontSize: 12,
                                color: dark.withValues(alpha: .3),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.model.note,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: dark.withValues(alpha: .3),
                ),
              ),
              if (widget.model.workshopServices != null)
                Column(
                  children: [
                    const SizedBox(height: 12),
                    WTitle(title: AppLocalizations.of(context)!.services),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: List.generate(
                          widget.model.workshopServices!.length,
                          (index) => Container(
                            decoration: BoxDecoration(
                              color: scaffoldSecondaryBackground,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 16,
                            ),
                            child: Text(
                              widget.model.workshopServices![index],
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: scaffoldSecondaryBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: AppIcons.location.svg(
                    height: 24,
                    width: 24,
                  ),
                  title: Text(
                    widget.model.fromLocation?.name ??
                        AppLocalizations.of(context)!.unknown,
                    maxLines: 1,
                  ),
                  trailing: AppIcons.arrowCircle.svg(),
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: scaffoldSecondaryBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CommentsView(
                        comments: widget.model.comments ?? [],
                      ),
                    ));
                  },
                  leading: AppIcons.message.svg(),
                  title: Text(AppLocalizations.of(context)!.comments),
                  trailing: AppIcons.arrowCircle.svg(),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: WButton(
                      onTap: () {},
                      color: const Color(0xFFD4D5D6),
                      text: AppLocalizations.of(context)!.queueRegistration,
                    ),
                  ),
                  if (widget.model.createdByPhone != null)
                    const SizedBox(width: 12),
                  if (widget.model.createdByPhone != null)
                    Expanded(
                      child: WButton(
                        onTap: () {},
                        text: AppLocalizations.of(context)!.call,
                      ),
                    ),
                ],
              ),
              if (widget.model.createdByTgLink != null)
                const SizedBox(height: 8),
              if (widget.model.createdByTgLink != null)
                WButton(
                  onTap: () {},
                  color: blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcons.telegram.svg(),
                      const SizedBox(width: 12),
                      Text(AppLocalizations.of(context)!.contactViaTelegram)
                    ],
                  ),
                ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
