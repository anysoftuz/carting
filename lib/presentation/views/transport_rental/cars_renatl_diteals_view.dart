import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/utils/my_function.dart';
import 'package:flutter/material.dart';

class CarsRenatlDitealsView extends StatefulWidget {
  const CarsRenatlDitealsView({
    super.key,
    this.myAnnouncement = false,
    required this.model,
  });
  final bool myAnnouncement;
  final AdvertisementModel model;

  @override
  State<CarsRenatlDitealsView> createState() => _CarsRenatlDitealsViewState();
}

class _CarsRenatlDitealsViewState extends State<CarsRenatlDitealsView> {
  List<Color> list3 = [
    Colors.amber,
    Colors.brown,
    Colors.black,
  ];

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
                      itemCount: widget.model.images!.length,
                      itemBuilder: (context, index) => CachedNetworkImage(
                        imageUrl:
                            'https://api.carting.uz/uploads/files/${widget.model.images![index]}',
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox(),
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
                    widget.model.carName ?? "Nomalum",
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
              Text(
                "${MyFunction.priceFormat(widget.model.price ?? 0)} UZS",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
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
              if (widget.model.details?.tariffs != null)
                const SizedBox(height: 16),
              if (widget.model.details?.tariffs != null)
                SizedBox(
                  height: 56,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: scaffoldSecondaryBackground,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.model.details!.tariffs![index].day} kunlik",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: dark.withValues(alpha: .3),
                            ),
                          ),
                          Text(
                            "${MyFunction.priceFormat(widget.model.details!.tariffs![index].price)} so'm",
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 8),
                    itemCount: widget.model.details?.tariffs?.length ?? 0,
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
                    widget.model.fromLocation?.name ?? "Nomalum",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: AppIcons.arrowCircle.svg(),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    "Ranglar:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: SizedBox(
                      height: 24,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => CircleAvatar(
                          radius: 12,
                          backgroundColor: list3[index],
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 8),
                        itemCount: list3.length,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Dvigitel hajmi: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                    children: [
                      TextSpan(
                        text:
                            "${widget.model.details?.characteristics?.engineCapacity ?? 0} MPI",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Konditsioner: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                    children: [
                      TextSpan(
                        text: widget.model.details?.characteristics
                                    ?.hasInsurance ==
                                true
                            ? "Bor"
                            : "Yo'q",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Uzatmalar qutisi: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                    children: const [
                      TextSpan(
                        text: "Mexanika",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Sug‘urta borligi: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                    children: [
                      TextSpan(
                        text: widget.model.details?.characteristics
                                    ?.hasInsurance ==
                                true
                            ? "OSAGO"
                            : "Yo'q",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Bagaj hajmi: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                    children: const [
                      TextSpan(
                        text: "316 litr",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    text: "O‘rindiqlar soni: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                    children: [
                      TextSpan(
                        text:
                            "${widget.model.details?.characteristics?.passengerCount ?? 0} ta",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Sutkalik km limiti: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                    children: [
                      TextSpan(
                        text:
                            "${widget.model.details?.characteristics?.dailyDistanceLimit ?? 0} km",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: RichText(
                  text: TextSpan(
                    text: "Depozit summasi: ",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: dark.withValues(alpha: .3),
                    ),
                    children: [
                      TextSpan(
                        text:
                            "${MyFunction.priceFormat(widget.model.details?.characteristics?.depositAmount ?? 0)} so‘m",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: dark,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: scaffoldSecondaryBackground,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListTile(
                  onTap: () {},
                  leading: AppIcons.message.svg(),
                  title: const Text("Izohlar"),
                  trailing: AppIcons.arrowCircle.svg(),
                ),
              ),
              const SizedBox(height: 32),
              Builder(
                builder: (context) {
                  if (widget.myAnnouncement) {
                    return Column(
                      children: [
                        Center(
                          child: Text(
                            "E’lon vaqti: 16.08.2024, 09:14",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              color: dark.withValues(alpha: .3),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        WButton(
                          onTap: () {},
                          text: "Faolsizlantirish",
                          color: red.withValues(alpha: .1),
                          textColor: red,
                        ),
                        const SizedBox(height: 32),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        if (widget.model.createdByPhone != null)
                          WButton(
                            onTap: () {},
                            text: "Qo‘ng‘iroq qilish",
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
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
