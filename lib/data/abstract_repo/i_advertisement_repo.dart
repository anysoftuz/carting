import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/data/models/fuels_info_model.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/data/models/transportation_types_model.dart';
import 'package:carting/infrastructure/core/exceptions/failures.dart';
import 'package:carting/utils/either.dart';

abstract class IAdvertisementRepo {
  Future<Either<Failure, ResponseModel<List<AdvertisementModel>>>>
      getAdvertisements();
  Future<Either<Failure, ResponseModel<List<AdvertisementModel>>>>
      getAdvertisementsMe(
    bool isPROVIDE,
  );
  Future<Either<Failure, ResponseModel<List<TransportationTypesModel>>>>
      getTransportationTypes(
    int servisId, {
    bool isRECEIVE = false,
  });
  Future<Either<Failure, bool>> createAdvertisement(Map<String, dynamic> model);
  Future<Either<Failure, ResponseModel<List<FuelsInfoModel>>>> fuels(
    int fuelsId,
  );
}
