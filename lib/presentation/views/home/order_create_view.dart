import 'dart:io';

import 'package:carting/l10n/localizations.dart';
import 'package:carting/utils/price_formatters.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/car_model.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_scale_animation.dart';

class OrderCreateView extends StatefulWidget {
  const OrderCreateView({super.key});

  @override
  State<OrderCreateView> createState() => _OrderCreateViewState();
}

class _OrderCreateViewState extends State<OrderCreateView> {
  late List<CarModel> list;

  ValueNotifier<int> selIndex = ValueNotifier(0);
  ValueNotifier<bool> check = ValueNotifier(false);
  List<File> images = [];

  void imagesFile() async {
    try {
      final image = await ImagePicker().pickMultiImage();
      if (image.isNotEmpty) {
        for (var element in image) {
          images.add(File(element.path));
        }
      }
      setState(() {});
    } on PlatformException catch (e) {
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = [
      CarModel(
        title: AppLocalizations.of(context)!.multipleBoxCapacity,
        images: AppImages.trucks2,
        height: 100,
        width: 100,
        kg: 300,
      ),
      CarModel(
        title: AppLocalizations.of(context)!.washingMachineEtc,
        images: AppImages.trucks3,
        height: 100,
        width: 100,
        kg: 700,
      ),
      CarModel(
        title: AppLocalizations.of(context)!.washingMachineEtc,
        images: AppImages.trucks4,
        height: 100,
        width: 100,
        kg: 1400,
      ),
      CarModel(
        title: AppLocalizations.of(context)!.homeAppliances,
        images: AppImages.trucks5,
        height: 100,
        width: 100,
        kg: 3100,
      ),
      CarModel(
        title: AppLocalizations.of(context)!.largeQuantityGoods,
        images: AppImages.trucks6,
        height: 100,
        width: 100,
        kg: 16000,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.aboutOrder)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            AppLocalizations.of(context)!.aboutCargo,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            title: AppLocalizations.of(context)!.cargoType,
            hintText: AppLocalizations.of(context)!.select,
            suffixIcon: AppIcons.arrowBottom.svg(),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.cargoVolume,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 58,
            child: Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    hintText: AppLocalizations.of(context)!.height,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    hintText: AppLocalizations.of(context)!.width,
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomTextField(
                    hintText: AppLocalizations.of(context)!.length,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.cargoImages,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          GridView.builder(
            itemCount: images.length + 1,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              if (images.length == index) {
                return WScaleAnimation(
                  onTap: () {
                    imagesFile();
                  },
                  child: DottedBorder(
                    color: green,
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(20),
                    child: Center(
                      child: AppIcons.upload.svg(),
                    ),
                  ),
                );
              }
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: FileImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          Text(
            AppLocalizations.of(context)!.truckType,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 80,
            width: double.infinity,
            child: ValueListenableBuilder(
              valueListenable: selIndex,
              builder: (context, value, __) {
                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      selIndex.value = index;
                    },
                    child: AnimatedContainer(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width * .8,
                      duration: const Duration(microseconds: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: value == index
                            ? green.withValues(alpha: .2)
                            : whiteSmoke,
                        border:
                            value == index ? Border.all(color: green) : null,
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 12, 0, 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  list[index].title,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Text(
                                  "${list[index].kg} KG",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    AppIcons.width.svg(),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${list[index].width}  m²",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    AppIcons.height.svg(),
                                    const SizedBox(width: 8),
                                    Text(
                                      "${list[index].height}  m²",
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          list[index].images.imgAsset()
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: list.length,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: AppLocalizations.of(context)!.loadingService,
            hintText: AppLocalizations.of(context)!.loadingService,
            suffixIcon: ValueListenableBuilder(
              valueListenable: check,
              builder: (context, valu, __) {
                return CupertinoSwitch(
                  value: valu,
                  activeTrackColor: green,
                  onChanged: (value) {
                    check.value = value;
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 8),
          CustomTextField(
            hintText: AppLocalizations.of(context)!.howManyLoaders,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.recipient,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ),
              AppIcons.orderHistory.svg(
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 4),
              Text(
                AppLocalizations.of(context)!.date,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 12),
          CustomTextField(
            title: AppLocalizations.of(context)!.nameAndSurname,
            hintText: AppLocalizations.of(context)!.nameAndSurname,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: AppLocalizations.of(context)!.phoneNumber,
            hintText: AppLocalizations.of(context)!.phoneNumber,
            suffixIcon: AppIcons.contact.svg(),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.note,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomTextField(
              hintText: AppLocalizations.of(context)!.cargo,
              fillColor: whiteSmoke,
              noHeight: true,
              expands: false,
              maxLines: 5,
              minLines: 5,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.paymentInfo,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            title: AppLocalizations.of(context)!.paymentType,
            hintText: AppLocalizations.of(context)!.select,
            suffixIcon: AppIcons.arrowBottom.svg(),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            title: AppLocalizations.of(context)!.price,
            hintText: AppLocalizations.of(context)!.priceRange,
            keyboardType: TextInputType.number,
            formatter: [PriceFormatter()],
          ),
          const SizedBox(height: 16),
          WButton(
            onTap: () {},
            text: AppLocalizations.of(context)!.createOrder,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
