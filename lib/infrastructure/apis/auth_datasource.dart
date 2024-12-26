import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/data/common/error_handle.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/data/models/send_code_body.dart';
import 'package:carting/data/models/send_code_model.dart';
import 'package:carting/data/models/token_model.dart';
import 'package:carting/data/models/user_model.dart';
import 'package:carting/data/models/user_update_model.dart';
import 'package:carting/data/models/verify_body.dart';
import 'package:carting/infrastructure/core/dio_settings.dart';
import 'package:carting/infrastructure/core/service_locator.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:carting/utils/log_service.dart';
import 'package:dio/dio.dart';

abstract class AuthDatasourche {
  Future<ResponseModel<UserModel>> getMe();
  Future<ResponseModel<SendCodeModel>> sendCode(SendCodeBody body);
  Future<ResponseModel<TokenModel>> verifyPost(VerifyBody body);
  Future<bool> userUpdate(UserUpdateModel body);
}

class AuthDataSourcheImpl implements AuthDatasourche {
  final dioAuth = serviceLocator<DioSettings>().dioForAuth;
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponseModel<UserModel>> getMe() {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.get(
          '/user',
          options: Options(
            headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                ? {
                    'Authorization':
                        'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                  }
                : {},
          ),
        );
      },
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) {
          Log.wtf(p0);
          return UserModel.fromJson(p0 as Map<String, dynamic>);
        },
      ),
    );
  }

  @override
  Future<ResponseModel<SendCodeModel>> sendCode(SendCodeBody body) {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.post(
          'phone/register',
          data: body.toJson(),
        );
      },
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => SendCodeModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<TokenModel>> verifyPost(VerifyBody body) {
    return _handle.apiCantrol(
      request: () {
        return dio.post(
          'phone/verify',
          data: body.toJson(),
        );
      },
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => TokenModel.fromJson(p0 as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<bool> userUpdate(UserUpdateModel body) {
    return _handle.apiCantrol(
      request: () {
        return dioAuth.put(
          'user',
          data: body.toJson(),
          options: Options(
            headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                ? {
                    'Authorization':
                        'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                  }
                : {},
          ),
        );
      },
      body: (response) => true,
    );
  }
}
