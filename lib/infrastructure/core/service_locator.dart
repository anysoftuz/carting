import 'package:carting/infrastructure/core/dio_settings.dart';
import 'package:carting/src/settings/settings_controller.dart';
import 'package:carting/src/settings/settings_service.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerSingleton(SettingsController(SettingsService()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
