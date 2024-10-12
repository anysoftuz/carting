import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/views/home/deliver_info_view.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ValueNotifier<int> value = ValueNotifier(0);
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  TextEditingController datetime = TextEditingController();

  void swapAddresses() {
    String temp = fromController.text;
    fromController.text = toController.text;
    toController.text = temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 24,
          width: 128,
          child: AppImages.logoTextDark.imgAsset(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 64),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: CustomTextField(
              prefixIcon: AppIcons.searchNormal.svg(),
              hintText: "Kerakli transportni qidiring",
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
              builder: (context) => const DeliverInfoView(),
            ));
          },
          child: Container(
            height: 132,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: white,
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 16,
        ),
        itemCount: 12,
      ),

      // body: SingleChildScrollView(
      //   padding: const EdgeInsets.all(16),
      //   child: Column(
      //     children: [
      //       Container(
      //         decoration: BoxDecoration(
      //           color: whiteSmoke,
      //           borderRadius: BorderRadius.circular(20),
      //         ),
      //         height: 180,
      //         width: double.infinity,
      //         child: Stack(
      //           children: [
      //             Column(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(
      //                     horizontal: 20,
      //                     vertical: 16,
      //                   ),
      //                   child: TextField(
      //                     controller: fromController,
      //                     decoration: const InputDecoration(
      //                       labelText: 'Qayerdan',
      //                       labelStyle: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.w400,
      //                       ),
      //                       hintText: 'Manzilni kiriting',
      //                       floatingLabelBehavior: FloatingLabelBehavior.always,
      //                       border: InputBorder.none,
      //                     ),
      //                   ),
      //                 ),
      //                 const Divider(height: 1),
      //                 Padding(
      //                   padding: const EdgeInsets.symmetric(
      //                     horizontal: 20,
      //                     vertical: 16,
      //                   ),
      //                   child: TextField(
      //                     controller: toController,
      //                     decoration: const InputDecoration(
      //                       labelText: 'Qayerga',
      //                       labelStyle: TextStyle(
      //                         fontSize: 14,
      //                         fontWeight: FontWeight.w400,
      //                       ),
      //                       hintText: 'Manzilni kiriting',
      //                       floatingLabelBehavior: FloatingLabelBehavior.always,
      //                       alignLabelWithHint: true,
      //                       border: InputBorder.none,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             Align(
      //               alignment: Alignment.centerRight,
      //               child: Container(
      //                 margin: const EdgeInsets.only(right: 20),
      //                 decoration: BoxDecoration(
      //                   color: white,
      //                   border: Border.all(color: const Color(0xFFEAEEF2)),
      //                   borderRadius: BorderRadius.circular(12),
      //                 ),
      //                 child: IconButton(
      //                   icon: const Icon(Icons.swap_vert),
      //                   onPressed: swapAddresses,
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       const SizedBox(height: 20),
      //       ValueListenableBuilder(
      //         valueListenable: value,
      //         builder: (context, valu, __) {
      //           return SizedBox(
      //             height: 64,
      //             child: Row(
      //               children: [
      //                 Expanded(
      //                   child: WScaleAnimation(
      //                     onTap: () {
      //                       value.value = 0;
      //                     },
      //                     child: AnimatedContainer(
      //                       duration: const Duration(milliseconds: 300),
      //                       decoration: BoxDecoration(
      //                         border:
      //                             valu == 0 ? Border.all(color: green) : null,
      //                         color: valu == 0 ? white : whiteSmoke,
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                       padding: const EdgeInsets.all(20),
      //                       child: Row(
      //                         children: [
      //                           const Expanded(
      //                             child: Text(
      //                               "Yo'l-yo'lakay",
      //                               style: TextStyle(
      //                                 fontSize: 16,
      //                                 fontWeight: FontWeight.w400,
      //                               ),
      //                               maxLines: 1,
      //                               overflow: TextOverflow.ellipsis,
      //                             ),
      //                           ),
      //                           const SizedBox(width: 12),
      //                           valu == 0
      //                               ? AppIcons.checkboxRadio.svg()
      //                               : AppIcons.checkboxRadioDis.svg(),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 const SizedBox(width: 16),
      //                 Expanded(
      //                   child: WScaleAnimation(
      //                     onTap: () {
      //                       value.value = 1;
      //                     },
      //                     child: AnimatedContainer(
      //                       duration: const Duration(milliseconds: 300),
      //                       decoration: BoxDecoration(
      //                         border:
      //                             valu == 1 ? Border.all(color: green) : null,
      //                         color: valu == 1 ? white : whiteSmoke,
      //                         borderRadius: BorderRadius.circular(20),
      //                       ),
      //                       padding: const EdgeInsets.all(20),
      //                       child: Row(
      //                         children: [
      //                           const Expanded(
      //                             child: Text(
      //                               "Hozir",
      //                               style: TextStyle(
      //                                 fontSize: 16,
      //                                 fontWeight: FontWeight.w400,
      //                               ),
      //                               maxLines: 1,
      //                               overflow: TextOverflow.ellipsis,
      //                             ),
      //                           ),
      //                           const SizedBox(width: 12),
      //                           valu != 0
      //                               ? AppIcons.checkboxRadio.svg()
      //                               : AppIcons.checkboxRadioDis.svg(),
      //                         ],
      //                       ),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           );
      //         },
      //       ),
      //       const SizedBox(height: 8),
      //       CustomTextField(
      //         title: "Yuborish vaqti",
      //         hintText: "Kun va soatni tanlang",
      //         fillColor: whiteSmoke,
      //         controller: datetime,
      //         formatter: [Formatters.dateFormatter],
      //         keyboardType: TextInputType.datetime,
      //         suffixIcon: AppIcons.calendar.svg(),
      //         onsuffixIconPressed: () {
      //           showDatePicker(
      //             context: context,
      //             firstDate: DateTime(2024),
      //             lastDate: DateTime(2025),
      //           ).then(
      //             (value) {
      //               if (value != null) {
      //                 datetime.text =
      //                     DateFormat('dd/MM/yyyy').format(value.toLocal());
      //               }
      //             },
      //           );
      //         },
      //       ),
      //       const SizedBox(height: 16),
      //       WButton(
      //         onTap: () {
      //           Navigator.of(context, rootNavigator: true)
      //               .push(MaterialPageRoute(
      //             builder: (context) => const OrderCreateView(),
      //           ));
      //         },
      //         text: "Davom etish",
      //       )
      //     ],
      //   ),
      // ),
    );
  }
}
