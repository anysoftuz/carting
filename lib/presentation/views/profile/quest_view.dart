
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

class QuestView extends StatefulWidget {
  const QuestView({super.key});

  @override
  State<QuestView> createState() => _QuestViewState();
}

class _QuestViewState extends State<QuestView> {
  late List<FaqInfo> list;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = [
      FaqInfo(
        title: 'Carting xizmati qanday ishlaydi?',
        description:
            'Siz buyurtma berasiz, biz eng yaqin haydovchini aniqlaymiz va yuklaringizni belgilangan manzilga yetkazib beramiz.',
      ),
      FaqInfo(
        title: "Qanday to'lov usullari mavjud?",
        description:
            "Biz naqd pul, bank kartasi va onlayn to'lov tizimlarini qabul qilamiz.",
      ),
      FaqInfo(
        title: "Yuk tashish narxlari qanday hisoblanadi?",
        description:
            "Narxlar masofa, yuk og'irligi va hajmiga qarab hisoblanadi. Aniq narxni buyurtma berishda bilib olishingiz mumkin.",
      ),
      FaqInfo(
        title:
            "Foydalanuvchini jalb qilgani uchun qancha miqdorda mukofot oladi?",
        description:
            "Агар мавжуд Фойдаланувчи эҳтимолий мижозга реферал ҳаволани юборган бўлса ва ушбу янги мижоз мазкур ҳавола орқали Дастурда рўйхатдан ўтган бўлса ҳамда кейинчалик Дастур орқали тўлов амалиёти билан боғлиқ ташиш ёки бошқа хизматни амалга оширган бўлса, келишилган хизмат хаккининг 0,15 фоизини  мукофот эвазида олади.",
      ),
      FaqInfo(
        title: "Ilovaga kirish uchun nimalar kerak buladi?",
        description:
            "Carting ilovasiga kirish juda soda. Telefon raqam yoki elektron pochtasi mavjud bulsa yetadi. Kelgan kodni sms xabar noma yoki elektron pochta orqali topsa buladi.",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.frequentlyAskedQuestions),
      ),
      body: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: context.color.contGrey,
            ),
            child: ExpansionTile(
              title: Text(list[index].title),
              children: [
                const Divider(color: Color(0xFFEAEEF2), height: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    list[index].description,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemCount: list.length,
        ),
      ),
    );
  }
}

class FaqInfo {
  final String title;
  final String description;

  FaqInfo({
    required this.title,
    required this.description,
  });
}
