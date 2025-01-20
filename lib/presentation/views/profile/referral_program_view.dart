import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_tabbar.dart';
import 'package:flutter/material.dart';

class ReferralProgramView extends StatefulWidget {
  const ReferralProgramView({super.key});

  @override
  State<ReferralProgramView> createState() => _ReferralProgramViewState();
}

class _ReferralProgramViewState extends State<ReferralProgramView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Referal dastur")),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const SizedBox(
              height: 48,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: WTabBar(
                  tabs: [
                    Text("Taklif qilish"),
                    Text("Statistika"),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: white,
                          ),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                spacing: 8,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: const Color(0xFFF3F3F3),
                                      ),
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Row(
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'UHJGVnasbvgdILU',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF292D32),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: AppIcons.copy.svg(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: AppIcons.share.svg(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              const CustomTextField(
                                maxLines: 5,
                                minLines: 5,
                                expands: false,
                                noHeight: true,
                                hintText: 'Buyurtma haqida izoh qoldiring!',
                                title: 'Izoh',
                              ),
                              const SizedBox(height: 24),
                              WButton(
                                onTap: () {},
                                width: 140,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    AppIcons.addCircle.svg(),
                                    const SizedBox(width: 8),
                                    const Text('Qo‘shish')
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Taklif qilinganlar',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF292D32),
                                ),
                              ),
                            ),
                            Text(
                              '3 ta',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF292D32)
                                    .withValues(alpha: .3),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ...List.generate(
                          3,
                          (index) => const ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(radius: 20),
                            title: Text('Iskandar Nematov'),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Jismoniy shaxs'),
                                Text('998 99 645 37 82'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 16,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: white,
                          ),
                          child: const Column(
                            spacing: 16,
                            children: [
                              InfoColum(
                                title: 'Umumiy foyda',
                                subtitle: '\$25.00',
                                colorText: Color(0xFF292D32),
                                fontSize: 24,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: InfoColum(
                                      title: 'Topilgan foyda',
                                      subtitle: '\$25.00',
                                      colorText: green,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Expanded(
                                    child: InfoColum(
                                      title: 'Chiqarib olingan foyda',
                                      subtitle: '\$25.00',
                                      colorText: blue,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: white,
                          ),
                          child: Row(
                            children: [
                              Text(
                                'Taklif qilinganlar',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF292D32)
                                      .withValues(alpha: .3),
                                ),
                              ),
                              Expanded(
                                child: RichText(
                                  textAlign: TextAlign.end,
                                  text: TextSpan(
                                    text: '45',
                                    style: const TextStyle(
                                      color: Color(0xFF292D32),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: ' ta',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xFF292D32)
                                              .withValues(alpha: .3),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoColum extends StatelessWidget {
  const InfoColum({
    super.key,
    required this.title,
    required this.subtitle,
    required this.colorText,
    required this.fontSize,
  });
  final String title;
  final String subtitle;
  final Color colorText;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF292D32).withValues(alpha: .3),
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: colorText,
          ),
        ),
      ],
    );
  }
}
