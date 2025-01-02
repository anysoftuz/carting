import 'dart:io';

import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/data/models/advertisement_delivery_model.dart';
import 'package:carting/data/models/location_model.dart';
import 'package:carting/data/models/passenger_transportation_create_model.dart';
import 'package:carting/data/models/special_equipment_create_model.dart';
import 'package:carting/data/models/transport_transfer_model.dart';
import 'package:carting/data/models/warehouse_model.dart';
import 'package:carting/presentation/widgets/custom_snackbar.dart';
import 'package:carting/utils/price_formatters.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data.dart';
import 'package:carting/presentation/views/announcements/announcements_create_info_view.dart';
import 'package:carting/presentation/views/common/map_point.dart';
import 'package:carting/presentation/views/transport_rental/cars_renatl_diteals_view.dart';
import 'package:carting/presentation/widgets/min_text_field.dart';
import 'package:carting/presentation/widgets/selection_location_field.dart';
import 'package:carting/presentation/widgets/w_bottom_padding.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_scale_animation.dart';
import 'package:carting/presentation/widgets/w_text_field.dart';
import 'package:carting/presentation/widgets/w_title.dart';
import 'package:carting/utils/enum_filtr.dart';
import 'package:carting/utils/formatters.dart';

class AnnouncementCreateView extends StatefulWidget {
  const AnnouncementCreateView({
    super.key,
    required this.filter,
    required this.carId,
  });
  final TypeOfServiceEnum filter;
  final int carId;

  @override
  State<AnnouncementCreateView> createState() => _AnnouncementCreateViewState();
}

class _AnnouncementCreateViewState extends State<AnnouncementCreateView> {
  String selectedUnit = 'kg';
  List<File> images = [];
  List<FuelType> fuelList = [
    FuelType(
      controllerName: TextEditingController(),
      controllerPrice: TextEditingController(),
    ),
  ];
  MapPoint? point1;
  MapPoint? point2;
  late TextEditingController controllerCount;
  late TextEditingController controllerCommet;
  late TextEditingController controllerPrice;

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
  void initState() {
    controllerCommet = TextEditingController();
    controllerPrice = TextEditingController();
    controllerCount = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controllerCommet.dispose();
    controllerPrice.dispose();
    controllerCount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ma’lumotlar")),
      bottomNavigationBar: WBottomPadding(
        child: BlocBuilder<AdvertisementBloc, AdvertisementState>(
          builder: (context, state) {
            return WButton(
              onTap: () {
                if (images.isNotEmpty &&
                    controllerCommet.text.isNotEmpty &&
                    controllerPrice.text.isNotEmpty &&
                    controllerCount.text.isNotEmpty) {
                  final model = switch (widget.filter) {
                    TypeOfServiceEnum.storageInWarehouse => WarehouseModel(
                        toLocation: ToLocation(
                          lat: point2!.latitude,
                          lng: point2!.longitude,
                          name: point2!.name,
                        ),
                        details: DetailsWarehouse(area: controllerCount.text),
                        advType: 'PROVIDE',
                        serviceTypeId: 7,
                        note: controllerCommet.text,
                        price: int.tryParse(
                                controllerPrice.text.replaceAll(' ', '')) ??
                            0,
                      ).toJson(),
                    TypeOfServiceEnum.shipping => AdvertisementDeliveryModel(
                        toLocation: LocationModel(
                          lat: point2!.latitude,
                          lng: point2!.longitude,
                          name: point2!.name,
                        ),
                        fromLocation: LocationModel(
                          lat: point1!.latitude,
                          lng: point1!.longitude,
                          name: point1!.name,
                        ),
                        serviceName: 'Yuk tashish',
                        details: Details(
                          transportationTypeId: widget.carId,
                          loadWeight: LoadWeight(
                            amount: int.tryParse(controllerCount.text) ?? 0,
                            name: selectedUnit,
                          ),
                        ),
                        advType: 'PROVIDE',
                        serviceTypeId: 1,
                        note: controllerCommet.text,
                        price: int.tryParse(
                                controllerPrice.text.replaceAll(' ', '')) ??
                            0,
                      ).toJson(),
                    TypeOfServiceEnum.transportationOfPassengers =>
                      PassengerTransportationCreateModel(
                        toLocation: LocationModel(
                          lat: point2!.latitude,
                          lng: point2!.longitude,
                          name: point2!.name,
                        ),
                        fromLocation: LocationModel(
                          lat: point1!.latitude,
                          lng: point1!.longitude,
                          name: point1!.name,
                        ),
                        serviceName: 'Yo‘lovchilarni tashish',
                        details: DetailsModel(
                          transportationTypeId: widget.carId,
                          passengerCount:
                              int.tryParse(controllerCount.text) ?? 0,
                        ),
                        advType: 'PROVIDE',
                        serviceTypeId: 2,
                        shipmentDate: '',
                        note: controllerCommet.text,
                        payType: 'CASH',
                        price: int.tryParse(
                                controllerPrice.text.replaceAll(' ', '')) ??
                            0,
                      ).toJson(),
                    TypeOfServiceEnum.specialTechnique =>
                      SpecialEquipmentCreateModel(
                        toLocation: LocationModel(
                          lat: point2!.latitude,
                          lng: point2!.longitude,
                          name: point2!.name,
                        ),
                        details: DetailsSpecialEquipment(
                          transportationTypeId: widget.carId,
                        ),
                        advType: 'PROVIDE',
                        serviceTypeId: 3,
                        note: controllerCommet.text,
                        price: int.tryParse(
                                controllerPrice.text.replaceAll(' ', '')) ??
                            0,
                      ).toJson(),
                    TypeOfServiceEnum.transportRental =>
                      throw UnimplementedError(),
                    TypeOfServiceEnum.workshops => throw UnimplementedError(),
                    TypeOfServiceEnum.masters => throw UnimplementedError(),
                    TypeOfServiceEnum.transportTransfer =>
                      TransportTransferModel(
                        toLocation: LocationModel(
                          lat: point2!.latitude,
                          lng: point2!.longitude,
                          name: point2!.name,
                        ),
                        fromLocation: LocationModel(
                          lat: point1!.latitude,
                          lng: point1!.longitude,
                          name: point1!.name,
                        ),
                        serviceName: 'Transport transferi',
                        details: DetailsTransfer(
                          transportationTypeId: widget.carId,
                          transportCount:
                              int.tryParse(controllerCount.text) ?? 0,
                        ),
                        advType: 'PROVIDE',
                        serviceTypeId: 6,
                        note: controllerCommet.text,
                        price: int.tryParse(
                                controllerPrice.text.replaceAll(' ', '')) ??
                            0,
                      ).toJson(),
                    TypeOfServiceEnum.fuelDelivery =>
                      throw UnimplementedError(),
                  };
                  context.read<AdvertisementBloc>().add(CreateDeliveryEvent(
                        model: model,
                        onSucces: () {
                          if (widget.filter ==
                              TypeOfServiceEnum.transportRental) {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const CarsRenatlDitealsView(
                                myAnnouncement: true,
                              ),
                            ));
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AnnouncementsCreateInfoView(
                                filter: widget.filter,
                                images: images,
                              ),
                            ));
                          }
                        },
                      ));
                } else {
                  CustomSnackbar.show(
                    context,
                    "Kerakli ma'lumotlarni kirgazing",
                  );
                }
              },
              text: "Joylash",
              isLoading: state.statusCreate.isInProgress,
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Builder(
              builder: (context) {
                switch (widget.filter) {
                  case TypeOfServiceEnum.shipping ||
                        TypeOfServiceEnum.transportationOfPassengers ||
                        TypeOfServiceEnum.transportTransfer:
                    return SelectionLocationField(
                      onTap1: (point) {
                        point1 = point;
                      },
                      onTap2: (point) {
                        point2 = point;
                      },
                    );
                  default:
                    return SelectionLocationField(
                      isOne: true,
                      onTap2: (point) {
                        point2 = point;
                      },
                    );
                }
              },
            ),
            const SizedBox(height: 24),
            const WTitle(title: "Rasmlari (10 tagacha)", color: white),
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
            const SizedBox(height: 12),
            Builder(
              builder: (context) {
                switch (widget.filter) {
                  case TypeOfServiceEnum.transportRental:
                    return Column(
                      children: [
                        const WTitle(
                          title: "Texnik xarakteristikalar",
                          color: white,
                        ),
                        const SizedBox(height: 16),
                        WTextField(
                          title: 'Model',
                          hintText: 'Kia Sonet',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Kuzov turi',
                          hintText: 'Krassover',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Uzatmalar qutisi',
                          hintText: 'Uzatmalar qutisini kiriting!',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Dvigatel hajmi',
                          hintText: '1.5 MPI',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Rangi',
                          hintText: 'Rangni kiriting!',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Bagaj hajmi',
                          hintText: 'Miqdorni kiriting! (litrda)',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'O‘rindiqlar soni',
                          hintText: 'Miqdorni kiriting!',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Konditsioner',
                          hintText: 'Bor yoki yo’qligini kiriting!',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Sug‘urta',
                          hintText: 'Bor yoki yo’qligini kiriting!',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Sutkalik km kimiti',
                          hintText: 'Miqdorni kiriting!',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        WTextField(
                          title: 'Depozit summasi',
                          hintText: 'Miqdorni kiriting!',
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 24),
                        const WTitle(
                          title: "Ta’riflar",
                          color: white,
                        ),
                        const SizedBox(height: 16),
                        WTextField(
                          title: '1 sutkalik narx',
                          hintText: 'Narxni kiriting',
                          keyboardType: TextInputType.number,
                          formatter: [PriceFormatter()],
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: WTextField(
                                title: 'Kun',
                                hintText: 'Miqdorni kiriting!',
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: WTextField(
                                title: 'Narx',
                                hintText: 'Miqdorni kiriting!',
                                keyboardType: TextInputType.number,
                                formatter: [PriceFormatter()],
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: WTextField(
                                title: 'Kun',
                                hintText: 'Miqdorni kiriting!',
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: WTextField(
                                title: 'Narx',
                                hintText: 'Miqdorni kiriting!',
                                keyboardType: TextInputType.number,
                                formatter: [PriceFormatter()],
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: WTextField(
                                title: 'Kun',
                                hintText: 'Miqdorni kiriting!',
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: WTextField(
                                title: 'Narx',
                                hintText: 'Miqdorni kiriting!',
                                keyboardType: TextInputType.number,
                                formatter: [PriceFormatter()],
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        WTextField(
                          title: 'Izoh',
                          controller: controllerCommet,
                          hintText: 'Yuk haqida izoh qoldiring!',
                          expands: false,
                          maxLines: 5,
                          minLines: 5,
                          noHeight: true,
                          onChanged: (value) {},
                        ),
                      ],
                    );
                  default:
                    return Column(
                      children: [
                        Builder(builder: (context) {
                          switch (widget.filter) {
                            case TypeOfServiceEnum.shipping:
                              return MinTextField(
                                text: "Maksimal yuk sig‘imi",
                                hintText: "0",
                                keyboardType: TextInputType.number,
                                controller: controllerCount,
                                formatter: [Formatters.numberFormat],
                                suffixIcon: Builder(
                                  builder: (context) => GestureDetector(
                                    onTap: () async {
                                      final RenderBox button = context
                                          .findRenderObject() as RenderBox;
                                      final RenderBox overlay =
                                          Overlay.of(context)
                                              .context
                                              .findRenderObject() as RenderBox;

                                      final RelativeRect position =
                                          RelativeRect.fromRect(
                                        Rect.fromPoints(
                                          button.localToGlobal(
                                              Offset(0, button.size.height),
                                              ancestor: overlay),
                                          button.localToGlobal(
                                              button.size
                                                  .bottomRight(Offset.zero),
                                              ancestor: overlay),
                                        ),
                                        Offset.zero & overlay.size,
                                      );

                                      String? selected = await showMenu<String>(
                                        context: context,
                                        position: position,
                                        color: white,
                                        shadowColor:
                                            black.withValues(alpha: .3),
                                        menuPadding: const EdgeInsets.symmetric(
                                            vertical: 4),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        items: ['kg', 'm³', 'litr']
                                            .map((String choice) {
                                          return PopupMenuItem<String>(
                                            value: choice,
                                            height: 24,
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                              vertical: 2,
                                            ),
                                            child: SizedBox(
                                              width: 140,
                                              child: Row(
                                                children: [
                                                  Text(choice),
                                                  const Spacer(),
                                                  SizedBox(
                                                    height: 16,
                                                    width: 16,
                                                    child: choice ==
                                                            selectedUnit
                                                        ? AppIcons.checkboxRadio
                                                            .svg(
                                                            height: 16,
                                                            width: 16,
                                                          )
                                                        : AppIcons
                                                            .checkboxRadioDis
                                                            .svg(
                                                            height: 16,
                                                            width: 16,
                                                          ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      );

                                      if (selected != null) {
                                        setState(() {
                                          selectedUnit = selected;
                                        });
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Text(
                                          selectedUnit,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                        AppIcons.arrowBottom.svg(
                                            color: dark.withValues(alpha: .3)),
                                      ],
                                    ),
                                  ),
                                ),
                                onChanged: (value) {},
                              );
                            case TypeOfServiceEnum.transportationOfPassengers:
                              return MinTextField(
                                text: "Maksimal yo‘lovchi soni",
                                hintText: "0",
                                controller: controllerCount,
                                keyboardType: TextInputType.number,
                                formatter: [Formatters.numberFormat],
                                onChanged: (value) {},
                              );
                            case TypeOfServiceEnum.transportTransfer:
                              return MinTextField(
                                text: "Maksimal transport soni",
                                hintText: "0",
                                controller: controllerCount,
                                keyboardType: TextInputType.number,
                                formatter: [Formatters.numberFormat],
                                onChanged: (value) {},
                              );
                            case TypeOfServiceEnum.storageInWarehouse:
                              return MinTextField(
                                text: "Maydon",
                                hintText: "0",
                                keyboardType: TextInputType.number,
                                suffixIcon: const Text(
                                  "m2",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: dark,
                                  ),
                                ),
                                controller: controllerCount,
                                formatter: [Formatters.numberFormat],
                                onChanged: (value) {},
                              );
                            case TypeOfServiceEnum.workshops:
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: white,
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Toifalar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: dark.withValues(alpha: .3),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: List.generate(
                                            AppData.categories.length,
                                            (index) => Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: green,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: green.withValues(
                                                        alpha: .32),
                                                    blurRadius: 16,
                                                    spreadRadius: -24,
                                                    offset: const Offset(0, 8),
                                                  )
                                                ],
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 4,
                                                horizontal: 14,
                                              ),
                                              child: Text(
                                                AppData.categories[index],
                                                style: const TextStyle(
                                                  color: white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: white,
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Xizmatlar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: dark.withValues(alpha: .3),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: List.generate(
                                            AppData.services.length,
                                            (index) => Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: green,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: green.withValues(
                                                        alpha: .32),
                                                    blurRadius: 16,
                                                    spreadRadius: -24,
                                                    offset: const Offset(0, 8),
                                                  )
                                                ],
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 4,
                                                horizontal: 14,
                                              ),
                                              child: Text(
                                                AppData.services[index],
                                                style: const TextStyle(
                                                  color: white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  WTextField(
                                    title: 'Kompaniya nomi',
                                    hintText: 'Kompaniya nomini kiriting!',
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              );
                            case TypeOfServiceEnum.masters:
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      color: white,
                                    ),
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Xizmatlar",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: dark.withValues(alpha: .3),
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: List.generate(
                                            AppData.services.length,
                                            (index) => Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: green,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: green.withValues(
                                                        alpha: .32),
                                                    blurRadius: 16,
                                                    spreadRadius: -24,
                                                    offset: const Offset(0, 8),
                                                  )
                                                ],
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 4,
                                                horizontal: 14,
                                              ),
                                              child: Text(
                                                AppData.services[index],
                                                style: const TextStyle(
                                                  color: white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  WTextField(
                                    title: 'Ism',
                                    hintText: 'Sherzod',
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(height: 12),
                                  WTextField(
                                    title: 'Familiya',
                                    hintText: 'Shermatov',
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(height: 12),
                                ],
                              );
                            case TypeOfServiceEnum.fuelDelivery:
                              return Column(
                                children: [
                                  WTextField(
                                    title: 'Kompaniya nomi',
                                    hintText: 'LukOil',
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(height: 24),
                                  const WTitle(
                                    title: 'Yoqilg‘i turi va narxlari',
                                    color: white,
                                  ),
                                  const SizedBox(height: 16),
                                  ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Row(
                                      children: [
                                        Expanded(
                                          child: WTextField(
                                            title: 'Yoqilg‘i',
                                            hintText: 'Yoqilg‘i',
                                            controller:
                                                fuelList[index].controllerName,
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: WTextField(
                                            title: 'Narx',
                                            hintText: 'Miqdorni kiriting!',
                                            keyboardType: TextInputType.number,
                                            controller:
                                                fuelList[index].controllerPrice,
                                            formatter: [PriceFormatter()],
                                            onChanged: (value) {},
                                          ),
                                        ),
                                      ],
                                    ),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 12),
                                    itemCount: fuelList.length,
                                  ),
                                  const SizedBox(height: 16),
                                  WButton(
                                    onTap: () {
                                      fuelList.add(FuelType(
                                        controllerName: TextEditingController(),
                                        controllerPrice:
                                            TextEditingController(),
                                      ));
                                      setState(() {});
                                    },
                                    textColor: green,
                                    color: Colors.transparent,
                                    height: 48,
                                    border: Border.all(color: green),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        AppIcons.add.svg(),
                                        const SizedBox(width: 8),
                                        const Text("Qo’shish")
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                ],
                              );
                            default:
                              return const SizedBox();
                          }
                        }),
                        const SizedBox(height: 8),
                        WTextField(
                          title: 'Izoh',
                          hintText: 'Yuk haqida izoh qoldiring!',
                          noHeight: true,
                          minLines: 5,
                          maxLines: 5,
                          expands: false,
                          controller: controllerCommet,
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 8),
                        WTextField(
                          title: 'Narx',
                          hintText: 'Narxni kiriting',
                          controller: controllerPrice,
                          keyboardType: TextInputType.number,
                          formatter: [PriceFormatter()],
                          onChanged: (value) {},
                        ),
                      ],
                    );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
