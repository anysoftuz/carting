import 'dart:io';

import 'package:flutter/material.dart';

class WBottomPadding extends StatelessWidget {
  const WBottomPadding({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          8,
          16,
          Platform.isIOS ? 0 : 16,
        ),
        child: child,
      ),
    );
  }
}
