import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:flutter/material.dart';


/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    return getTheme(StorageRepository.getString(StorageKeys.MODE));
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
    final mode = putTheme(theme);
    await StorageRepository.putString(
      StorageKeys.MODE,
      mode,
    );
  }
}

ThemeMode getTheme(String mode) {
  switch (mode) {
    case 'light':
      return ThemeMode.light;
    case 'dark':
      return ThemeMode.dark;
    default:
      return ThemeMode.system;
  }
}

String putTheme(ThemeMode mode) {
  switch (mode) {
    case ThemeMode.dark:
      return 'dark';
    case ThemeMode.light:
      return 'light';
    default:
      return 'system';
  }
}
