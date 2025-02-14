import 'package:cached_network_image/cached_network_image.dart';
import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/data/models/transportation_types_model.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/presentation/widgets/w_shimmer.dart';
import 'package:flex_dropdown/flex_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class WSelectionItam extends StatefulWidget {
  const WSelectionItam({
    super.key,
    required this.onTap,
  });
  final Function(int index) onTap;

  @override
  State<WSelectionItam> createState() => _WSelectionItamState();
}

class _WSelectionItamState extends State<WSelectionItam> {
  final OverlayPortalController _controller = OverlayPortalController();
  MenuPosition position = MenuPosition.bottomStart;
  bool dismissOnTapOutside = true;
  bool useButtonSize = true;
  int selIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdvertisementBloc, AdvertisementState>(
      builder: (context, state) {
        if (state.statusTrTypes.isInProgress) {
          return const WShimmer(
            height: 80,
            width: double.infinity,
          );
        }
        if (state.transportationTypes.isNotEmpty) {
          return RawFlexDropDown(
            controller: _controller,
            menuPosition: position,
            dismissOnTapOutside: dismissOnTapOutside,
            buttonBuilder: (context, onTap) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: context.color.contColor,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListTile(
                  onTap: onTap,
                  title: Text(state.transportationTypes[selIndex].name),
                  subtitle: Text(state.transportationTypes[selIndex].volume),
                  minVerticalPadding: 0,
                  titleTextStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: context.color.darkText,
                  ),
                  subtitleTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CachedNetworkImage(
                        imageUrl: state.transportationTypes[selIndex].icon,
                        height: 48,
                        width: 86,
                        errorWidget: (context, url, error) => const SizedBox(),
                      ),
                      AppIcons.arrowBottom.svg(color: context.color.darkText),
                    ],
                  ),
                ),
              );
            },
            menuBuilder: (context, width) {
              return Padding(
                padding: const EdgeInsets.only(top: 4),
                child: MenuWidget(
                  width: useButtonSize ? width : 300,
                  transportationTypes: state.transportationTypes,
                  onItemTap: (index) {
                    selIndex = index;
                    widget.onTap(selIndex);
                    _controller.hide();
                    setState(() {});
                  },
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    this.width,
    required this.onItemTap,
    required this.transportationTypes,
  });

  final double? width;
  final Function(int index) onItemTap;
  final List<TransportationTypesModel> transportationTypes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(12),
      constraints: const BoxConstraints(maxHeight: 250),
      decoration: BoxDecoration(
        color: context.color.contColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8,
          ),
        ],
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            onItemTap(index);
          },
          child: SizedBox(
            height: 72,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: transportationTypes[index].icon,
                  height: 72,
                  width: 82,
                  errorWidget: (context, url, error) => const SizedBox(),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        transportationTypes[index].name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        transportationTypes[index].volume,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                AppIcons.arrowCircle.svg(),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemCount: transportationTypes.length,
      ),
    );
  }
}
