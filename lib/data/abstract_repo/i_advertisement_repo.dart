import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/infrastructure/core/exceptions/failures.dart';
import 'package:carting/utils/either.dart';

abstract class IAdvertisementRepo {
  Future<Either<Failure, ResponseModel<List<AdvertisementModel>>>>
      getAdvertisements();
  Future<Either<Failure, ResponseModel<List<AdvertisementModel>>>>
      getAdvertisementsMe(
    bool isPROVIDE,
  );
}
