import 'package:carting/data/abstract_repo/i_advertisement_repo.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/infrastructure/apis/advertisement_datasource.dart';
import 'package:carting/infrastructure/core/exceptions/exceptions.dart';
import 'package:carting/infrastructure/core/exceptions/failures.dart';
import 'package:carting/utils/either.dart';
import 'package:dio/dio.dart';

class AdvertisementRepo implements IAdvertisementRepo {
  final AdvertisementDatasourceImpl dataSourcheImpl;

  AdvertisementRepo({required this.dataSourcheImpl});

  @override
  Future<Either<Failure, ResponseModel<List<AdvertisementModel>>>>
      getAdvertisements() async {
    try {
      final result = await dataSourcheImpl.getAdvertisements();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, ResponseModel<List<AdvertisementModel>>>>
      getAdvertisementsMe(bool isPROVIDE) async {
    try {
      final result = await dataSourcheImpl.getAdvertisementsMe(isPROVIDE);
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    } on ParsingException catch (e) {
      return Left(ParsingFailure(errorMessage: e.errorMessage));
    } on ServerException catch (e) {
      return Left(ServerFailure(
        errorMessage: e.errorMessage,
        statusCode: e.statusCode,
      ));
    }
  }
}
