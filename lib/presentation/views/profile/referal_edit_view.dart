import 'package:carting/app/advertisement/advertisement_bloc.dart';
import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/assets/assets/icons.dart';
import 'package:carting/assets/colors/colors.dart';
import 'package:carting/data/models/user_model.dart';
import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReferalEditView extends StatefulWidget {
  final List<ReferralCode> referralCodes;
  const ReferalEditView({super.key, required this.referralCodes});

  @override
  State<ReferalEditView> createState() => _ReferalEditViewState();
}

class _ReferalEditViewState extends State<ReferalEditView> {
  late List<TextEditingController> list;

  @override
  void initState() {
    list = List.generate(
      widget.referralCodes.length,
      (index) => TextEditingController(
        text: widget.referralCodes[index].note,
      ),
    );
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tahrirlash')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: context.color.contColor,
          ),
          width: double.infinity,
          child: Column(
            spacing: 16,
            children: [
              Row(
                spacing: 16,
                children: [
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFF3F3F3),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF292D32),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF3F3F3),
                      ),
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        widget.referralCodes[index].code,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF292D32),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                maxLines: 5,
                minLines: 5,
                expands: false,
                noHeight: true,
                controller: list[index],
                hintText: AppLocalizations.of(context)!.leaveOrderComment,
                title: AppLocalizations.of(context)!.description,
              ),
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: WButton(
                      onTap: () {
                        context.read<AdvertisementBloc>().add(DelRefCodeEvent(
                              code: widget.referralCodes[index].code,
                              onSucces: () {
                                context.read<AuthBloc>().add(UpdateCode(
                                      code: widget.referralCodes[index].code,
                                    ));
                                Navigator.pop(context);
                              },
                            ));
                      },
                      textColor: red,
                      color: red.withValues(alpha: .1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        spacing: 8,
                        children: [
                          AppIcons.trash.svg(),
                          const Text('O’chirish'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: WButton(
                      onTap: () {
                        if (list[index].text !=
                            widget.referralCodes[index].note) {
                          context.read<AdvertisementBloc>().add(PutRefCodeEvent(
                                code: widget.referralCodes[index].code,
                                note: list[index].text,
                                onSucces: () {
                                  context.read<AuthBloc>().add(UpdateCode(
                                        code: widget.referralCodes[index].code,
                                        note: widget.referralCodes[index].note,
                                      ));
                                  Navigator.pop(context);
                                },
                              ));
                        }
                      },
                      text: 'Saqlash',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: widget.referralCodes.length,
      ),
    );
  }
}
