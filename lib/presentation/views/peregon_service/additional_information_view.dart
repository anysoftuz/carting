import 'dart:io';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/type_model.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_scale_animation.dart';
import 'package:carting/presentation/widgets/w_title.dart';
import 'package:carting/utils/price_formatters.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AdditionalInformationView extends StatefulWidget {
  const AdditionalInformationView({
    super.key,
    this.isDelivery = false,
    this.controllerCommet,
    this.controllerPrice,
    this.loadTypeId,
    this.loadServiceId,
    this.payDate,
    required this.onSave,
    required this.images,
  });
  final bool isDelivery;
  final List<File> images;
  final TextEditingController? controllerCommet;
  final TextEditingController? controllerPrice;
  final ValueNotifier<int>? loadTypeId;
  final ValueNotifier<int>? loadServiceId;
  final ValueNotifier<bool>? payDate;
  final Function(List<File> images) onSave;

  @override
  State<AdditionalInformationView> createState() =>
      _AdditionalInformationViewState();
}

class _AdditionalInformationViewState extends State<AdditionalInformationView> {
  List<File> images = [];
  ValueNotifier<bool> payDate = ValueNotifier(true);
  ValueNotifier<int> loadTypeId = ValueNotifier(0);
  ValueNotifier<int> loadServiceId = ValueNotifier(0);

  @override
  void initState() {
    if (widget.payDate != null) {
      payDate.value = widget.payDate!.value;
    }
    if (widget.loadTypeId != null) {
      loadTypeId.value = widget.loadTypeId!.value - 1;
    }
    if (widget.loadServiceId != null) {
      loadServiceId.value = widget.loadServiceId!.value - 1;
    }

    super.initState();
  }

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
  void dispose() {
    super.dispose();

    loadTypeId.dispose();
    payDate.dispose();
    loadServiceId.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.color.backGroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.additionalInfo),
        backgroundColor: context.color.backGroundColor,
      ),
      bottomNavigationBar: SafeArea(
        child: WButton(
          onTap: () {
            if (widget.loadTypeId != null) {
              widget.loadTypeId!.value = loadTypeId.value + 1;
            }
            if (widget.loadServiceId != null) {
              widget.loadServiceId!.value = loadServiceId.value + 1;
            }
            if (widget.payDate != null) {
              widget.payDate!.value = payDate.value;
            }
            widget.onSave(images);
            Navigator.pop(context);
          },
          margin: const EdgeInsets.all(16),
          text: AppLocalizations.of(context)!.confirm,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (widget.isDelivery) ...[
              WTitle(title: AppLocalizations.of(context)!.cargoType),
              ValueListenableBuilder(
                valueListenable: loadTypeId,
                builder: (context, value, __) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                      title: Text(list[index].title),
                      subtitle: Text(list[index].subtitle),
                      onTap: () {
                        loadTypeId.value = index;
                      },
                      trailing: value == index
                          ? AppIcons.checkboxRadio.svg()
                          : AppIcons.checkboxRadioDis.svg(),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      minVerticalPadding: 0,
                      titleTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: dark,
                      ),
                      subtitleTextStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: context.color.darkText,
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemCount: list.length,
                    shrinkWrap: true,
                  );
                },
              ),
              WTitle(title: AppLocalizations.of(context)!.cargoLoadingService),
              ValueListenableBuilder(
                valueListenable: loadServiceId,
                builder: (context, value, __) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                      title: Text(list2[index].title),
                      subtitle: Text(list2[index].subtitle),
                      onTap: () {
                        loadServiceId.value = index;
                      },
                      trailing: value == index
                          ? AppIcons.checkboxRadio.svg()
                          : AppIcons.checkboxRadioDis.svg(),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                      minVerticalPadding: 0,
                      titleTextStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: dark,
                      ),
                      subtitleTextStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: context.color.darkText,
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemCount: list2.length,
                    shrinkWrap: true,
                  );
                },
              ),
              WTitle(
                title:
                    "${AppLocalizations.of(context)!.cargoImages} (10 tagacha)",
              ),
              const SizedBox(height: 12),
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
              const SizedBox(height: 24),
            ],
            CustomTextField(
              title: AppLocalizations.of(context)!.description,
              hintText: AppLocalizations.of(context)!.leaveOrderComment,
              minLines: 4,
              maxLines: 5,
              noHeight: true,
              expands: false,
              controller: widget.controllerCommet,
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            WTitle(title: AppLocalizations.of(context)!.payment),
            const SizedBox(height: 12),
            ValueListenableBuilder(
              valueListenable: payDate,
              builder: (context, value, child) => Column(
                children: [
                  ListTile(
                    onTap: () {
                      payDate.value = true;
                    },
                    leading: AppIcons.cash.svg(),
                    title: Text(AppLocalizations.of(context)!.cash),
                    trailing: value
                        ? AppIcons.checkboxRadio.svg()
                        : AppIcons.checkboxRadioDis.svg(),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    onTap: () {
                      payDate.value = false;
                    },
                    leading: AppIcons.card.svg(),
                    title: Text(AppLocalizations.of(context)!.card),
                    trailing: !value
                        ? AppIcons.checkboxRadio.svg()
                        : AppIcons.checkboxRadioDis.svg(),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            const SizedBox(height: 12),
            CustomTextField(
              title: AppLocalizations.of(context)!.price,
              hintText: AppLocalizations.of(context)!.enterPrice,
              keyboardType: TextInputType.number,
              controller: widget.controllerPrice,
              formatter: [PriceFormatter()],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
