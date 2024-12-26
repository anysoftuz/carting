import 'package:carting/app/auth/auth_bloc.dart';
import 'package:carting/infrastructure/apis/auth_datasource.dart';
import 'package:carting/infrastructure/core/dio_settings.dart';
import 'package:carting/infrastructure/repo/auth_repo.dart';
import 'package:carting/src/settings/settings_controller.dart';
import 'package:carting/src/settings/settings_service.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator
    ..registerLazySingleton(DioSettings.new)
    ..registerLazySingleton(
      () => AuthRepo(dataSourcheImpl: AuthDataSourcheImpl()),
    )
    ..registerSingleton(SettingsController(SettingsService()))
    ..registerSingleton(AuthBloc(serviceLocator<AuthRepo>()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
