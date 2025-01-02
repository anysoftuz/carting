import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/data/common/error_handle.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/data/models/cars_model.dart';
import 'package:carting/data/models/fuels_info_model.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/data/models/transportation_types_model.dart';
import 'package:carting/infrastructure/core/dio_settings.dart';
import 'package:carting/infrastructure/core/service_locator.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:dio/dio.dart';

abstract class AdvertisementDatasource {
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisements();
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisementsMe(
    bool isPROVIDE,
  );
  Future<ResponseModel<List<TransportationTypesModel>>> getTransportationTypes(
    int servisId, {
    bool isRECEIVE = false,
  });
  Future<bool> createAdvertisement(Map<String, dynamic> model);
  Future<ResponseModel<List<FuelsInfoModel>>> fuels(int fuelsId);
  Future<ResponseModel<List<CarsModel>>> cars();
  Future<bool> deactivetAdvertisement(int id);
}

class AdvertisementDatasourceImpl implements AdvertisementDatasource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisements() async {
    return _handle.apiCantrol(
      request: () => dio.get(
        'advertisement',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
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

  @override
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisementsMe(
    bool isPROVIDE,
  ) async {
    return _handle.apiCantrol(
      request: () => dio.get(
        'user/advertisement?adv_type=${isPROVIDE ? 'PROVIDE' : 'RECEIVE'}',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
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

  @override
  Future<ResponseModel<List<TransportationTypesModel>>> getTransportationTypes(
    int servisId, {
    bool isRECEIVE = false,
  }) {
    {
      return _handle.apiCantrol(
        request: () => dio.get(
          'list/transportation_types?service_id=$servisId&adv_type=${isRECEIVE ? 'PROVIDE' : 'RECEIVE'}',
          options: Options(
            headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
                ? {
                    'Authorization':
                        'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                  }
                : {},
          ),
        ),
        body: (response) => ResponseModel.fromJson(
          response,
          (p0) => (p0 as List)
              .map(
                (e) => TransportationTypesModel.fromJson(
                    e as Map<String, dynamic>),
              )
              .toList(),
        ),
      );
    }
  }

  @override
  Future<bool> createAdvertisement(Map<String, dynamic> model) {
    return _handle.apiCantrol(
      request: () => dio.post(
        'advertisement',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
        data: model,
      ),
      body: (response) => true,
    );
  }

  @override
  Future<ResponseModel<List<FuelsInfoModel>>> fuels(int fuelsId) {
    return _handle.apiCantrol(
      request: () => dio.get(
        'list/fuels?fuel_id=$fuelsId',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map(
              (e) => FuelsInfoModel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  @override
  Future<bool> deactivetAdvertisement(int id) {
    return _handle.apiCantrol(
      request: () => dio.put(
        'advertisement',
        data: {"id": id, "status": "IN_ACTIVE"},
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
      ),
      body: (response) => true,
    );
  }
  
  @override
  Future<ResponseModel<List<CarsModel>>> cars()  {
    return _handle.apiCantrol(
      request: () => dio.get(
        'list/cars',
        options: Options(
          headers: StorageRepository.getString(StorageKeys.TOKEN).isNotEmpty
              ? {
                  'Authorization':
                      'Bearer ${StorageRepository.getString(StorageKeys.TOKEN)}'
                }
              : {},
        ),
      ),
      body: (response) => ResponseModel.fromJson(
        response,
        (p0) => (p0 as List)
            .map(
              (e) => CarsModel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }
}
