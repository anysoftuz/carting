import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/data/common/error_handle.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/data/models/advertisment_filter.dart';
import 'package:carting/data/models/cars_model.dart';
import 'package:carting/data/models/fuels_info_model.dart';
import 'package:carting/data/models/image_create_model.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/data/models/servis_model.dart';
import 'package:carting/data/models/transport_specialists_model.dart';
import 'package:carting/data/models/transportation_types_model.dart';
import 'package:carting/infrastructure/core/dio_settings.dart';
import 'package:carting/infrastructure/core/service_locator.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:dio/dio.dart';

abstract class AdvertisementDatasource {
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisements(
      FilterModel? model);
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisementsMe(
    bool isPROVIDE,
  );
  Future<ResponseModel<List<TransportationTypesModel>>> getTransportationTypes(
    int servisId, {
    bool isRECEIVE = false,
  });
  Future<int> createAdvertisement(Map<String, dynamic> model);
  Future<ResponseModel<List<FuelsInfoModel>>> fuels(int fuelsId);
  Future<ResponseModel<List<CarsModel>>> cars();
  Future<bool> deactivetAdvertisement(int id);
  Future<ResponseModel<List<TransportSpecialistsModel>>>
      getTransportSpecialists();
  Future<ResponseModel<AdvertisementModel>> getAdvertisementsId(
    FilterModel? model,
  );
  Future<ResponseModel<Map<String, dynamic>>> createImage(
    ImageCreateModel model,
  );
  Future<ResponseModel<List<ServisModel>>> getCategories();
  Future<ResponseModel<List<ServisModel>>> getServices();
  Future<bool> postReferrealCde(String note);
  Future<bool> putReferrealCde(String note, String code);
  Future<bool> deleteReferrealCde(String code);
}

class AdvertisementDatasourceImpl implements AdvertisementDatasource {
  final dio = serviceLocator<DioSettings>().dio;
  final ErrorHandle _handle = ErrorHandle();

  @override
  Future<ResponseModel<List<AdvertisementModel>>> getAdvertisements(
    FilterModel? model,
  ) async {
    Map<String, dynamic> queryParameters = {};
    if (model?.serviceId != null) {
      queryParameters['service_id'] = model?.serviceId;
    }
    if (model?.advType != null) {
      queryParameters['adv_type'] = model?.advType;
    }
    if (model?.specialistId != null) {
      queryParameters['specialist_id'] = model?.specialistId;
    }
    if (model?.status != null) {
      queryParameters['status'] =
          model!.status == true ? "ACTIVE" : "IN_ACTIVE";
    }
    if (model?.carId != null) {
      queryParameters['car_id'] = model?.carId;
    }
    if (model?.repairTypeId != null) {
      queryParameters['repair_type_id'] = model?.repairTypeId;
    }

    if (model?.transportId != null) {
      queryParameters['transport_id'] = model?.transportId;
    }
    return _handle.apiCantrol(
      request: () => dio.get(
        'advertisement',
        queryParameters: queryParameters,
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
  Future<int> createAdvertisement(Map<String, dynamic> model) {
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
      body: (response) => (response as Map<String, dynamic>)['data']['id'],
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
  Future<ResponseModel<List<CarsModel>>> cars() {
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
            .map((e) => CarsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponseModel<List<TransportSpecialistsModel>>>
      getTransportSpecialists() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'list/transport_specialists',
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
            .map((e) =>
                TransportSpecialistsModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponseModel<Map<String, dynamic>>> createImage(
      ImageCreateModel model) {
    final models = {
      'advertisement_id': model.advertisementId,
      'images': List.generate(
        model.images.length,
        (index) =>
            {"fileName": "test.jpeg", "base64": model.images[index].base64},
      )
    };
    return _handle.apiCantrol(
      request: () => dio.post(
        'advertisement/images',
        data: models,
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
        (p0) => response,
      ),
    );
  }

  @override
  Future<ResponseModel<AdvertisementModel>> getAdvertisementsId(
      FilterModel? model) {
    return _handle.apiCantrol(
      request: () => dio.get(
        'advertisement',
        queryParameters: {'id': model?.advId ?? 0},
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
        (e) => AdvertisementModel.fromJson(e as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<ResponseModel<List<ServisModel>>> getCategories() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'list/workshop_categories',
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
            .map((e) => ServisModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<ResponseModel<List<ServisModel>>> getServices() {
    return _handle.apiCantrol(
      request: () => dio.get(
        'list/workshop_services',
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
            .map((e) => ServisModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  @override
  Future<bool> deleteReferrealCde(String code) {
    return _handle.apiCantrol(
      request: () => dio.delete(
        'referreal_code',
        queryParameters: {'referreal_code': code},
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
  Future<bool> postReferrealCde(String note) {
    return _handle.apiCantrol(
      request: () => dio.post(
        'referreal_code',
        data: {'note': note},
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
  Future<bool> putReferrealCde(String note, String code) {
    return _handle.apiCantrol(
      request: () => dio.put(
        'referreal_code',
        data: {"note": note, "referral_code": code},
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
}
