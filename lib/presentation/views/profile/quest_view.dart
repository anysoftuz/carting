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
        title: AppLocalizations.of(context)!.faq_how_it_works_title,
        description: AppLocalizations.of(context)!.faq_how_it_works_desc,
      ),
      FaqInfo(
        title: AppLocalizations.of(context)!.faq_payment_methods_title,
        description: AppLocalizations.of(context)!.faq_payment_methods_desc,
      ),
      FaqInfo(
        title: AppLocalizations.of(context)!.faq_pricing_title,
        description: AppLocalizations.of(context)!.faq_pricing_desc,
      ),
      FaqInfo(
        title: AppLocalizations.of(context)!.faq_referral_title,
        description: AppLocalizations.of(context)!.faq_referral_desc,
      ),
      FaqInfo(
        title: AppLocalizations.of(context)!.faq_login_title,
        description: AppLocalizations.of(context)!.faq_login_desc,
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
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: Text(
                    list[index].description,
                    textAlign: TextAlign.start,
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
