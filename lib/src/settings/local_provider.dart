import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:carting/l10n/localizations.dart';
import 'package:flutter/material.dart';

class LocaleProvider with ChangeNotifier {
  Locale _locale = Locale(
    StorageRepository.getString(
      StorageKeys.LANGUAGE,
      defValue: 'uz',
    ),
  );
  Locale get locale => _locale;
  void setLocale(Locale locale) async {
    if (!AppLocalizations.supportedLocales.contains(locale)) return;
    _locale = locale;
    await StorageRepository.putString(
      StorageKeys.LANGUAGE,
      locale.languageCode,
    );
    notifyListeners();
  }
}
