import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class OrdersInfoDeliverView extends StatefulWidget {
  const OrdersInfoDeliverView({
    super.key,
    required this.isActiv,
  });
  final bool isActiv;

  @override
  State<OrdersInfoDeliverView> createState() => _OrdersInfoDeliverViewState();
}

class _OrdersInfoDeliverViewState extends State<OrdersInfoDeliverView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.orderDetails)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (widget.isActiv)
            Container(
              decoration: BoxDecoration(
                color: green.withValues(alpha: .2),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  AppIcons.truck.svg(),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.orderReceived,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: green,
                      ),
                    ),
                  )
                ],
              ),
            ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OrdersInfoTile(
                  title: AppLocalizations.of(context)!.cargoType,
                  subtitle: 'Mebel',
                ),
                const SizedBox(height: 16),
                const OrdersInfoTile(
                  title: 'Yuk hajmi (m²)',
                  subtitle: '2 x 3 x 2',
                ),
                const SizedBox(height: 16),
                const OrdersInfoTile(
                  title: 'Qatnov',
                  subtitle: 'Tashkent → Andijan',
                ),
                const SizedBox(height: 16),
                const OrdersInfoTile(
                  title: 'Yukni olib ketish vaqti',
                  subtitle: '18.07.2024 16:00',
                ),
                const SizedBox(height: 16),
                OrdersInfoTile(
                  title: 'To’lov turi',
                  subtitle: AppLocalizations.of(context)!.cash,
                ),
                const SizedBox(height: 16),
                const OrdersInfoTile(
                  title: 'Yetkazib berish narxi',
                  subtitle: '500 000',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (widget.isActiv) ...[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteSmoke,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OrdersInfoTile(
                    title: 'Yuboruvchining ism va familiyasi',
                    subtitle: 'Rustamjon Abdullaev',
                  ),
                  const SizedBox(height: 16),
                  OrdersInfoTile(
                    title: AppLocalizations.of(context)!.phoneNumer,
                    subtitle: '+998 91 008 43 48',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteSmoke,
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OrdersInfoTile(
                    title: 'Qabul qiluvchining ism va familiyasi',
                    subtitle: 'Rustamjon Abdullaev',
                  ),
                  const SizedBox(height: 16),
                  OrdersInfoTile(
                    title: AppLocalizations.of(context)!.phoneNumer,
                    subtitle: '+998 91 008 43 48',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.cargoImages,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: blue,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: white,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.sizeOf(context).height -
                              (MediaQuery.of(context).viewPadding.top +
                                  MediaQuery.of(context).viewInsets.top),
                        ),
                        isScrollControlled: true,
                        builder: (context) => const CancelView(),
                      );
                    },
                    color: red.withValues(alpha: .2),
                    textColor: red,
                    text: AppLocalizations.of(context)!.cancel,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WButton(
                    onTap: () {},
                    text: AppLocalizations.of(context)!.accept,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ] else ...[
            Text(
              AppLocalizations.of(context)!.cargoImages,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            GridView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    color: whiteSmoke,
                    textColor: dark,
                    text: AppLocalizations.of(context)!.alternativeOffer,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    text: AppLocalizations.of(context)!.accept,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
          ]
        ],
      ),
    );
  }
}

class CancelView extends StatefulWidget {
  const CancelView({super.key});

  @override
  State<CancelView> createState() => _CancelViewState();
}

class _CancelViewState extends State<CancelView> {
  ValueNotifier<int> value = ValueNotifier(0);
  late List<String> list;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = [
      AppLocalizations.of(context)!.carBrokeDown,
      AppLocalizations.of(context)!.ranOutOfFuel,
      AppLocalizations.of(context)!.cargoIssue,
      AppLocalizations.of(context)!.trafficAccident,
      AppLocalizations.of(context)!.couldNotFindKitchen,
      AppLocalizations.of(context)!.other,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 56,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: whiteSmoke,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
                ),
              ),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.cancellationReason,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: value,
                  builder: (context, valu, __) {
                    return Column(
                      children: [
                        ...List.generate(
                          list.length,
                          (index) => _SelectionItam(
                            selIndex: value,
                            index: index,
                            title: list[index],
                          ),
                        ),
                      ],
                    );
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: whiteSmoke,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: CustomTextField(
                    hintText:
                        AppLocalizations.of(context)!.writeCancellationReason,
                    minLines: 4,
                    maxLines: 5,
                    expands: false,
                    noHeight: true,
                  ),
                ),
                const SizedBox(height: 24),
                WButton(
                  onTap: () {
                    Navigator.of(context)
                      ..pop()
                      ..pop();
                  },
                  color: red,
                  text: AppLocalizations.of(context)!.cancel,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _SelectionItam extends StatelessWidget {
  const _SelectionItam({
    required this.selIndex,
    required this.index,
    required this.title,
  });

  final ValueNotifier<int> selIndex;
  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: WScaleAnimation(
        onTap: () {
          selIndex.value = index;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            border: selIndex.value == index ? Border.all(color: green) : null,
            color: selIndex.value == index ? white : whiteSmoke,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 12),
              selIndex.value == index
                  ? AppIcons.checkboxRadio.svg()
                  : AppIcons.checkboxRadioDis.svg(),
            ],
          ),
        ),
      ),
    );
  }
}

class OrdersInfoTile extends StatelessWidget {
  const OrdersInfoTile({
    super.key,
    required this.title,
    required this.subtitle,
  });
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
