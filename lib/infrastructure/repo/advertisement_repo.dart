import 'package:carting/data/abstract_repo/i_advertisement_repo.dart';
import 'package:carting/data/models/advertisement_model.dart';
import 'package:carting/data/models/fuels_info_model.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/data/models/transportation_types_model.dart';
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

  @override
  Future<Either<Failure, ResponseModel<List<TransportationTypesModel>>>>
      getTransportationTypes(
    int servisId, {
    bool isRECEIVE = false,
  }) async {
    try {
      final result = await dataSourcheImpl.getTransportationTypes(servisId,
          isRECEIVE: isRECEIVE);
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
  Future<Either<Failure, bool>> createAdvertisement(
    Map<String, dynamic> model,
  ) async {
    try {
      final result = await dataSourcheImpl.createAdvertisement(model);
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
  Future<Either<Failure, ResponseModel<List<FuelsInfoModel>>>> fuels(
    int fuelsId,
  ) async {
    try {
      final result = await dataSourcheImpl.fuels(fuelsId);
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
  Future<Either<Failure, bool>> deactivetAdvertisement(int id) async {
    try {
      final result = await dataSourcheImpl.deactivetAdvertisement(id);
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
