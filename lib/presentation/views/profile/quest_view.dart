import 'package:carting/assets/colors/colors.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

class QuestView extends StatefulWidget {
  const QuestView({super.key});

  @override
  State<QuestView> createState() => _QuestViewState();
}

class _QuestViewState extends State<QuestView> {
  late List<String> list;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    list = [
      AppLocalizations.of(context)!.canICancelOrder,
      AppLocalizations.of(context)!.howToAcceptOrder,
      AppLocalizations.of(context)!.whatCanIDo,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.faq)),
      body: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteSmoke,
            ),
            child: ExpansionTile(
              title: Text(list[index]),
              children: [
                const Divider(color: Color(0xFFEAEEF2), height: 1),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    AppLocalizations.of(context)!.yesYouCan,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 16,
          ),
          itemCount: list.length,
        ),
      ),
    );
  }
}
