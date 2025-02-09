import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/presentation/views/common/comments_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

class OrderDetailView extends StatefulWidget {
  const OrderDetailView({super.key, required this.model});
  final AdvertisementModel model;

  @override
  State<OrderDetailView> createState() => _OrderDetailViewState();
}

class _OrderDetailViewState extends State<OrderDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  if (widget.model.images != null &&
                      widget.model.images!.isNotEmpty)
                    PageView.builder(
                      itemCount: widget.model.images!.length,
                      itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl:
                            'https://api.carting.uz/uploads/files/${widget.model.images![index]}',
                        fit: BoxFit.cover,
                      ),
                    )
                  else
                    Positioned.fill(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: AppImages.mask.imgAsset(fit: BoxFit.cover),
                    ),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
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
                  ),
                  // const Positioned(
                  //   bottom: 16,
                  //   right: 16,
                  //   child: Text(
                  //     "1/8",
                  //     style: TextStyle(color: white),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          Container(
            color: white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.model.transportName ?? "Nomalum",
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
                const SizedBox(height: 24),
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
                      widget.model.fromLocation?.name ?? "Nomaulum",
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
                    title: const Text("Izohlar"),
                    trailing: AppIcons.arrowCircle.svg(),
                  ),
                ),
                const SizedBox(height: 32),
                if (widget.model.createdByPhone != null)
                  WButton(
                    onTap: () {},
                    text: MyFunction.formatPhoneNumber(
                      widget.model.createdByPhone ?? "",
                    ),
                  ),
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
                        const Text("Telegram orqali bog‘lanish")
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
              ],
            ),
          )
        ],
      ),
    );
  }
}
