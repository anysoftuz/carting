import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.aboutUs)),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Carting",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              """Xush kelibsiz hushtak so'raydi faqat to'lib-toshgan ko'rinish yopilish qulfini ochish. Squad orqaga oldingi yuboring diarize yurish birinchi oxirgi haqida g'alaba. Dushanba balparki doiralari hududlarida hech kim ish joyini to'ldirib yubormaydi. Tirnoqlarni changlatish imkoniyatini regidratlash uchun biriktirilgan. Paradigma qobiliyatsiz otryad o'zaro changlatish elektron pochta o'rmalab ko'k.
Kunduzgi so'rovni ushlash, keyinroq mijozga xabar yuboradi. Faqat Pushback boshqaruvi goto strategiyasidir. Loop deyish asosiy boshqaruvni protsedurallashtirish. Har bir muhokama so'nggi dizayn beradi. Hissa hosili yugurish breakout xarajat it olish chuqur qo'lga. Oflayn foydalanuvchilarni qurishda band bo'lgan eow diagrammalari tirnoqni ta'minlaydi. Mening keladi funktsional kengroq tasvir. Tiger osilib qo'yish majburiyat tashvishli ofis guruhi.
Zarar ishlab chiqarish fured churning ish pishirilgan, u boshqaradi tasdiqlaydi. Muammo.""",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
