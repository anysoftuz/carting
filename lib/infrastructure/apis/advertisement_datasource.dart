import 'package:carting/data/common/error_handle.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/infrastructure/core/dio_settings.dart';
import 'package:carting/infrastructure/core/service_locator.dart';

abstract class AdvertisementDatasource {
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisements();
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisementsMe(
    bool isPROVIDE,
  );
}

class AdvertisementDatasourceImpl implements AdvertisementDatasource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisements() async {
    return _handle.apiCantrol(
      request: () => dio.get('advertisement'),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map(
              (e) => AdvertisementModel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisementsMe(
    bool isPROVIDE,
  ) async {
    return _handle.apiCantrol(
      request: () => dio.get(
        'user/advertisement?adv_type=${isPROVIDE ? 'PROVIDE' : 'RECEIVE'}',
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map(
              (e) => AdvertisementModel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }
}
