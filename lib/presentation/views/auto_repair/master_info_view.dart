import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/assets/images.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:carting/presentation/widgets/w_title.dart';
import 'package:flutter/material.dart';

class MasterInfoView extends StatefulWidget {
  const MasterInfoView({super.key});

  @override
  State<MasterInfoView> createState() => _MasterInfoViewState();
}

class _MasterInfoViewState extends State<MasterInfoView> {
  List<String> list = [
    AppImages.exp,
    AppImages.exp,
    AppImages.exp,
    AppImages.exp,
  ];

  List<String> list2 = [
    "Motorist",
    "Avtoelektrika",
    "Kuzovchi",
    "Hodovik",
    "Avtotuning",
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
              background: PageView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) => Image.asset(
                  list[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "AVTOritet",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      AppIcons.star.svg(),
                      RichText(
                        text: TextSpan(
                          text: "4.5, ",
                          style: const TextStyle(
                            fontSize: 14,
                            color: dark,
                          ),
                          children: [
                            TextSpan(
                              text: "25 ta izoh",
                              style: TextStyle(
                                fontSize: 12,
                                color: dark.withOpacity(.3),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                "Assalomu alaykum! man sizga barcha turdagi yuklarni tashish uchun mo‘ljallangan Furgonimni taklif qilaman, shanba yakshanba ham ishlayman.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: dark.withOpacity(.3),
                ),
              ),
              const SizedBox(height: 12),
              const WTitle(title: "Xizmatlar"),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: List.generate(
                    list2.length,
                    (index) => Container(
                      decoration: BoxDecoration(
                        color: scaffoldSecondaryBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 16,
                      ),
                      child: Text(
                        list2[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
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
                  title: const Text(
                    "IzoToshkent, Yakkasaroy tumanihlar",
                    maxLines: 1,
                  ),
                  trailing: AppIcons.arrowCircle.svg(),
                ),
              ),
              const SizedBox(height: 8),
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
              Row(
                children: [
                  Expanded(
                    child: WButton(
                      onTap: () {},
                      color: const Color(0xFFD4D5D6),
                      text: "Navbatga yozilish",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: WButton(
                      onTap: () {},
                      text: "Qo‘ng‘iroq qilish",
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
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
          ),
        ),
      ),
    );
  }
}