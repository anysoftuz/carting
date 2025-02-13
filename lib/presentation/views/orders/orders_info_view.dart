import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/views/orders/order_chat_view.dart';
import 'package:carting/presentation/views/orders/order_map_view.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class OrdersInfoView extends StatefulWidget {
  const OrdersInfoView({
    super.key,
    required this.isDelivery,
  });
  final bool isDelivery;

  @override
  State<OrdersInfoView> createState() => _OrdersInfoViewState();
}

class _OrdersInfoViewState extends State<OrdersInfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.orderDetails)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (widget.isDelivery)
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
                      AppLocalizations.of(context)!.yourCargoIsOnTheWay,
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
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrdersInfoTile(
                  title: 'Yuk turi',
                  subtitle: 'Mebel',
                ),
                const SizedBox(height: 16),
                const OrdersInfoTile(
                  title: 'Yuk hajmi (m²)',
                  subtitle: '2 x 3 x 2',
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            padding: const EdgeInsets.all(20),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const OrdersInfoTile(
                  title: 'Qabul qiluvchining ism va familiyasi',
                  subtitle: 'Rustamjon Abdullaev',
                ),
                const SizedBox(height: 16),
                OrdersInfoTile(
                  title:AppLocalizations.of(context)!.phoneNumer,
                  subtitle: '+998 91 008 43 48',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          if (widget.isDelivery) ...[
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(AppImages.map),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            WButton(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrderMapView(),
                ));
              },
              color: whiteSmoke,
              textColor: dark,
              text: AppLocalizations.of(context)!.liveTracking,
            ),
            const SizedBox(height: 16),
            WButton(
              onTap: () {},
              color: red.withValues(alpha: .2),
              textColor: red,
              text: AppLocalizations.of(context)!.cancelOrder,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: WButton(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OrderChatView(),
                      ));
                    },
                    color: whiteSmoke,
                    textColor: dark,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcons.messagesChat.svg(),
                        const SizedBox(width: 4),
                        Text(AppLocalizations.of(context)!.message)
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WButton(
                    onTap: () {},
                    color: green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppIcons.phone.svg(),
                        const SizedBox(width: 4),
                        Text(AppLocalizations.of(context)!.call)
                      ],
                    ),
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
                    onTap: () {},
                    color: red.withValues(alpha: .2),
                    textColor: red,
                    text: AppLocalizations.of(context)!.cancel,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: WButton(
                    onTap: () {},
                    color: whiteSmoke,
                    textColor: dark,
                    text: AppLocalizations.of(context)!.edit,
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
