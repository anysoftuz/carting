import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/common/comments_view.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/presentation/widgets/info_location_field.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CreateInfoView extends StatefulWidget {
  const CreateInfoView({
    super.key,
    required this.model,
  });
  final AdvertisementModel model;

  @override
  State<CreateInfoView> createState() => _CreateInfoViewState();
}

class _CreateInfoViewState extends State<CreateInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
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
                  : const SizedBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: context.color.contColor,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Furgon",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          AppIcons.star.svg(),
                          RichText(
                            text: TextSpan(
                              text: "4.5, ",
                              style: TextStyle(
                                fontSize: 14,
                                color: context.color.white,
                              ),
                              children: [
                                TextSpan(
                                  text: "25 ta izoh",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: context.color.darkText,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(
                    "${MyFunction.priceFormat(widget.model.price ?? 0)} UZS",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: context.color.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.model.note,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: context.color.darkText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  InfoLocationField(
                    point1: widget.model.fromLocation != null
                        ? MapPoint(
                            name: widget.model.fromLocation!.name,
                            latitude: widget.model.fromLocation!.lat,
                            longitude: widget.model.fromLocation!.lng,
                          )
                        : null,
                    point2: widget.model.toLocation != null
                        ? MapPoint(
                            name: widget.model.toLocation!.name,
                            latitude: widget.model.toLocation!.lat,
                            longitude: widget.model.toLocation!.lng,
                          )
                        : null,
                  ),
                  if (widget.model.details?.area != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.color.scaffoldBackground,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ListTile(
                          title: Text(
                            "Maydon",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: context.color.darkText,
                            ),
                          ),
                          subtitle: Text(
                            "${widget.model.details?.area ?? AppLocalizations.of(context)!.unknown} m2",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: context.color.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  if (widget.model.details?.transportCount != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: context.color.scaffoldBackground,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: ListTile(
                          title: Text(
                            "Maksimal transport soni",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: context.color.darkText,
                            ),
                          ),
                          subtitle: Text(
                            MyFunction.priceFormat(
                              widget.model.details?.transportCount ?? 0,
                            ),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: context.color.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  // Builder(builder: (context) {
                  //   switch (widget.filter) {
                  //     case TypeOfServiceEnum.shipping:
                  //       return DecoratedBox(
                  //         decoration: BoxDecoration(
                  //           color: scaffoldSecondaryBackground,
                  //           borderRadius: BorderRadius.circular(24),
                  //         ),
                  //         child: Column(
                  //           children: [
                  //             ListTile(
                  //               title: Text(
                  //                 "Qayerdan",
                  //                 style: TextStyle(
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: context.color.darkText,
                  //                 ),
                  //               ),
                  //               subtitle: const Text(
                  //                 "Toshkent, Yakkasaroy tumani",
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: dark,
                  //                 ),
                  //               ),
                  //               trailing: GestureDetector(
                  //                 onTap: () {
                  //                   Navigator.of(context)
                  //                       .push(MaterialPageRoute(
                  //                     builder: (context) => LocationView(
                  //                       isFirst: false,
                  //                       onTap: (mapPoint) {
                  //                         Navigator.pop(context);
                  //                       },
                  //                     ),
                  //                   ));
                  //                 },
                  //                 child: Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(12),
                  //                     color: green,
                  //                   ),
                  //                   padding: const EdgeInsets.all(8),
                  //                   child: AppIcons.location.svg(
                  //                     height: 24,
                  //                     width: 24,
                  //                     color: white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             const Padding(
                  //               padding: EdgeInsets.symmetric(horizontal: 16),
                  //               child: Divider(height: 1),
                  //             ),
                  //             ListTile(
                  //               title: Text(
                  //                 "Qayerga",
                  //                 style: TextStyle(
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: context.color.darkText,
                  //                 ),
                  //               ),
                  //               subtitle: const Text(
                  //                 "Toshkent, Yakkasaroy tumani",
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: dark,
                  //                 ),
                  //               ),
                  //               trailing: GestureDetector(
                  //                 onTap: () {
                  //                   Navigator.of(context)
                  //                       .push(MaterialPageRoute(
                  //                     builder: (context) => LocationView(
                  //                       isFirst: false,
                  //                       onTap: (mapPoint) {
                  //                         Navigator.pop(context);
                  //                       },
                  //                     ),
                  //                   ));
                  //                 },
                  //                 child: Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(12),
                  //                     color: green,
                  //                   ),
                  //                   padding: const EdgeInsets.all(8),
                  //                   child: AppIcons.location.svg(
                  //                     height: 24,
                  //                     width: 24,
                  //                     color: white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     case TypeOfServiceEnum.transportationOfPassengers ||
                  //           TypeOfServiceEnum.transportTransfer ||
                  //           TypeOfServiceEnum.storageInWarehouse:
                  //       return Column(
                  //         children: [
                  //           DecoratedBox(
                  //             decoration: BoxDecoration(
                  //               color: scaffoldSecondaryBackground,
                  //               borderRadius: BorderRadius.circular(24),
                  //             ),
                  //             child: ListTile(
                  //               title: Text(
                  //                 "Qayerda",
                  //                 style: TextStyle(
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: context.color.darkText,
                  //                 ),
                  //               ),
                  //               subtitle: const Text(
                  //                 "Toshkent, Yakkasaroy tumani",
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: dark,
                  //                 ),
                  //               ),
                  //               trailing: GestureDetector(
                  //                 onTap: () {
                  //                   Navigator.of(context)
                  //                       .push(MaterialPageRoute(
                  //                     builder: (context) => LocationView(
                  //                       isFirst: false,
                  //                       onTap: (mapPoint) {
                  //                         Navigator.pop(context);
                  //                       },
                  //                     ),
                  //                   ));
                  //                 },
                  //                 child: Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(12),
                  //                     color: green,
                  //                   ),
                  //                   padding: const EdgeInsets.all(8),
                  //                   child: AppIcons.location.svg(
                  //                     height: 24,
                  //                     width: 24,
                  //                     color: white,
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 16),
                  //           Builder(builder: (context) {
                  //             switch (widget.filter) {
                  //               case TypeOfServiceEnum.storageInWarehouse:
                  //                 return DecoratedBox(
                  //                   decoration: BoxDecoration(
                  //                     color: scaffoldSecondaryBackground,
                  //                     borderRadius: BorderRadius.circular(24),
                  //                   ),
                  //                   child: ListTile(
                  //                     title: Text(
                  //                       "Maydon",
                  //                       style: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: context.color.darkText,
                  //                       ),
                  //                     ),
                  //                     subtitle: const Text(
                  //                       "200",
                  //                       style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: dark,
                  //                       ),
                  //                     ),
                  //                     trailing: const Text(
                  //                       "m2",
                  //                       style: TextStyle(
                  //                         fontSize: 16,
                  //                         color: dark,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 );
                  //               default:
                  //                 return DecoratedBox(
                  //                   decoration: BoxDecoration(
                  //                     color: scaffoldSecondaryBackground,
                  //                     borderRadius: BorderRadius.circular(24),
                  //                   ),
                  //                   child: ListTile(
                  //                     title: Text(
                  //                       "Maksimal yo‘lovchi soni",
                  //                       style: TextStyle(
                  //                         fontSize: 12,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: context.color.darkText,
                  //                       ),
                  //                     ),
                  //                     subtitle: const Text(
                  //                       "8",
                  //                       style: TextStyle(
                  //                         fontSize: 16,
                  //                         fontWeight: FontWeight.w400,
                  //                         color: dark,
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 );
                  //             }
                  //           }),
                  //         ],
                  //       );
                  //     case TypeOfServiceEnum.workshops:
                  //       return Column(
                  //         children: [
                  //           const WTitle(title: 'Toifalar'),
                  //           const SizedBox(height: 12),
                  //           SizedBox(
                  //             width: double.infinity,
                  //             child: Wrap(
                  //               spacing: 8,
                  //               runSpacing: 8,
                  //               children: List.generate(
                  //                 AppData.categories.length,
                  //                 (index) => Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(20),
                  //                     color: scaffoldSecondaryBackground,
                  //                   ),
                  //                   padding: const EdgeInsets.symmetric(
                  //                     vertical: 4,
                  //                     horizontal: 14,
                  //                   ),
                  //                   child: Text(
                  //                     AppData.categories[index],
                  //                     style: const TextStyle(
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.w400,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 16),
                  //           const WTitle(title: 'Xizmatlar'),
                  //           const SizedBox(height: 12),
                  //           SizedBox(
                  //             width: double.infinity,
                  //             child: Wrap(
                  //               spacing: 8,
                  //               runSpacing: 8,
                  //               children: List.generate(
                  //                 AppData.services.length,
                  //                 (index) => Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(20),
                  //                     color: scaffoldSecondaryBackground,
                  //                   ),
                  //                   padding: const EdgeInsets.symmetric(
                  //                     vertical: 4,
                  //                     horizontal: 14,
                  //                   ),
                  //                   child: Text(
                  //                     AppData.services[index],
                  //                     style: const TextStyle(
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.w400,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 32),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               color: scaffoldSecondaryBackground,
                  //               borderRadius: BorderRadius.circular(20),
                  //             ),
                  //             child: ListTile(
                  //               onTap: () {},
                  //               leading: AppIcons.location.svg(
                  //                 height: 24,
                  //                 width: 24,
                  //               ),
                  //               title: const Text(
                  //                 "Toshkent, Yakkasaroy tumanihlar",
                  //                 maxLines: 1,
                  //               ),
                  //               trailing: AppIcons.arrowCircle.svg(),
                  //             ),
                  //           ),
                  //         ],
                  //       );
                  //     case TypeOfServiceEnum.masters:
                  //       return Column(
                  //         children: [
                  //           const WTitle(title: 'Xizmatlar'),
                  //           const SizedBox(height: 12),
                  //           SizedBox(
                  //             width: double.infinity,
                  //             child: Wrap(
                  //               spacing: 8,
                  //               runSpacing: 8,
                  //               children: List.generate(
                  //                 AppData.services.length,
                  //                 (index) => Container(
                  //                   decoration: BoxDecoration(
                  //                     borderRadius: BorderRadius.circular(20),
                  //                     color: scaffoldSecondaryBackground,
                  //                   ),
                  //                   padding: const EdgeInsets.symmetric(
                  //                     vertical: 4,
                  //                     horizontal: 14,
                  //                   ),
                  //                   child: Text(
                  //                     AppData.services[index],
                  //                     style: const TextStyle(
                  //                       fontSize: 14,
                  //                       fontWeight: FontWeight.w400,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           const SizedBox(height: 32),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               color: scaffoldSecondaryBackground,
                  //               borderRadius: BorderRadius.circular(20),
                  //             ),
                  //             child: ListTile(
                  //               onTap: () {},
                  //               leading: AppIcons.location.svg(
                  //                 height: 24,
                  //                 width: 24,
                  //               ),
                  //               title: const Text(
                  //                 "Toshkent, Yakkasaroy tumanihlar",
                  //                 maxLines: 1,
                  //               ),
                  //               trailing: AppIcons.arrowCircle.svg(),
                  //             ),
                  //           ),
                  //         ],
                  //       );
                  //     case TypeOfServiceEnum.specialTechnique ||
                  //           TypeOfServiceEnum.fuelDelivery:
                  //       return DecoratedBox(
                  //         decoration: BoxDecoration(
                  //           color: scaffoldSecondaryBackground,
                  //           borderRadius: BorderRadius.circular(24),
                  //         ),
                  //         child: ListTile(
                  //           title: Text(
                  //             "Qayerda",
                  //             style: TextStyle(
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.w400,
                  //               color: context.color.darkText,
                  //             ),
                  //           ),
                  //           subtitle: const Text(
                  //             "Toshkent, Yakkasaroy tumani",
                  //             style: TextStyle(
                  //               fontSize: 16,
                  //               fontWeight: FontWeight.w400,
                  //               color: dark,
                  //             ),
                  //           ),
                  //           trailing: GestureDetector(
                  //             onTap: () {
                  //               Navigator.of(context).push(MaterialPageRoute(
                  //                 builder: (context) => LocationView(
                  //                   isFirst: false,
                  //                   onTap: (mapPoint) {
                  //                     Navigator.pop(context);
                  //                   },
                  //                 ),
                  //               ));
                  //             },
                  //             child: Container(
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.circular(12),
                  //                 color: green,
                  //               ),
                  //               padding: const EdgeInsets.all(8),
                  //               child: AppIcons.location.svg(
                  //                 height: 24,
                  //                 width: 24,
                  //                 color: white,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     default:
                  //       return const SizedBox();
                  //   }
                  // }),

                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: context.color.scaffoldBackground,
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
                      leading: AppIcons.message.svg(color: context.color.iron),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              AppLocalizations.of(context)!.comments,
                            ),
                          ),
                          const SizedBox(
                            width: 72,
                            height: 24,
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 12,
                                  backgroundImage:
                                      AssetImage(AppImages.avatar_1),
                                ),
                                Positioned(
                                  left: 16,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage:
                                        AssetImage(AppImages.avatar_2),
                                  ),
                                ),
                                Positioned(
                                  left: 32,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundImage:
                                        AssetImage(AppImages.avatar_3),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: white,
                                    child: Text(
                                      "+86",
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      trailing: AppIcons.arrowCircle.svg(),
                    ),
                  ),
                  // Builder(builder: (context) {
                  //   switch (widget.filter) {
                  //     case TypeOfServiceEnum.fuelDelivery:
                  //       return Column(
                  //         children: [
                  //           const SizedBox(height: 16),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               color: scaffoldSecondaryBackground,
                  //               borderRadius: BorderRadius.circular(24),
                  //             ),
                  //             padding: const EdgeInsets.symmetric(
                  //               horizontal: 16,
                  //               vertical: 12,
                  //             ),
                  //             width: double.infinity,
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Yoqilg’i turi va narxi',
                  //                   style: TextStyle(
                  //                     fontSize: 12,
                  //                     fontWeight: FontWeight.w400,
                  //                     color: context.color.darkText,
                  //                   ),
                  //                 ),
                  //                 RichText(
                  //                   text: TextSpan(
                  //                     text: 'AI 80',
                  //                     style: const TextStyle(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w400,
                  //                       color: dark,
                  //                     ),
                  //                     children: [
                  //                       TextSpan(
                  //                         text: ' - 8 500 so‘m',
                  //                         style: TextStyle(
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.w400,
                  //                           color: context.color.darkText,
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 const SizedBox(height: 4),
                  //                 RichText(
                  //                   text: TextSpan(
                  //                     text: 'AI 92',
                  //                     style: const TextStyle(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w400,
                  //                       color: dark,
                  //                     ),
                  //                     children: [
                  //                       TextSpan(
                  //                         text: ' - 13 000 so‘m',
                  //                         style: TextStyle(
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.w400,
                  //                           color: context.color.darkText,
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 const SizedBox(height: 4),
                  //                 RichText(
                  //                   text: TextSpan(
                  //                     text: 'AI 95',
                  //                     style: const TextStyle(
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w400,
                  //                       color: dark,
                  //                     ),
                  //                     children: [
                  //                       TextSpan(
                  //                         text: ' - 15 000 so‘m',
                  //                         style: TextStyle(
                  //                           fontSize: 16,
                  //                           fontWeight: FontWeight.w400,
                  //                           color: context.color.darkText,
                  //                         ),
                  //                       )
                  //                     ],
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const SizedBox(height: 16),
                  //           DecoratedBox(
                  //             decoration: BoxDecoration(
                  //               color: scaffoldSecondaryBackground,
                  //               borderRadius: BorderRadius.circular(24),
                  //             ),
                  //             child: ListTile(
                  //               title: Text(
                  //                 "Yetkazib berish narxi",
                  //                 style: TextStyle(
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: context.color.darkText,
                  //                 ),
                  //               ),
                  //               subtitle: const Text(
                  //                 "Bepul",
                  //                 style: TextStyle(
                  //                   fontSize: 16,
                  //                   fontWeight: FontWeight.w400,
                  //                   color: dark,
                  //                 ),
                  //               ),
                  //             ),
                  //           )
                  //         ],
                  //       );
                  //     default:
                  //       return const SizedBox();
                  //   }
                  // }),
                  const SizedBox(height: 32),
                  if (widget.model.shipmentDate != null)
                    Center(
                      child: Text(
                        "E’lon vaqti: ${widget.model.shipmentDate}",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: context.color.darkText,
                        ),
                      ),
                    ),
                  if (widget.model.shipmentDate != null)
                    const SizedBox(height: 16),
                  if (widget.model.status == 'ACTIVE')
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
                                      color: context.color.contColor,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Haqiqatdan ham e’lonni bekor qilmoqchimisiz?",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: context.color.darkText,
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
                                                text: "Yo‘q",
                                                textColor: darkText,
                                                color: const Color(0xFFF3F3F3),
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: WButton(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  bloc.add(DeactivetEvent(
                                                    id: widget.model.id,
                                                  ));
                                                  Navigator.pop(context);
                                                },
                                                text: "Ha",
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
                          text: "Faolsizlantirish",
                          isLoading: state.statusCreate.isInProgress,
                          color: red.withValues(alpha: .1),
                          textColor: red,
                        );
                      },
                    )
                  else
                    WButton(
                      onTap: () {},
                      text: "Faol emas",
                      color: red.withValues(alpha: .1),
                      textColor: red,
                    ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
