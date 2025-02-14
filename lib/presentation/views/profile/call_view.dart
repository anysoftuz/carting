import 'package:carting/infrastructure/core/context_extension.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:carting/presentation/widgets/custom_text_field.dart';
import 'package:carting/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class CallView extends StatefulWidget {
  const CallView({super.key});

  @override
  State<CallView> createState() => _CallViewState();
}

class _CallViewState extends State<CallView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.supportCenter)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          decoration: BoxDecoration(
            color: context.color.contColor,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: CustomTextField(
            hintText: AppLocalizations.of(context)!.describeProblem,
            expands: false,
            minLines: 4,
            noHeight: true,
            maxLines: 8,
            maxLength: 500,
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: WButton(
          margin: const EdgeInsets.all(16),
          onTap: () {},
          text: AppLocalizations.of(context)!.send,
        ),
      ),
    );
  }
}
