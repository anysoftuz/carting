import 'package:carting/assets/constants/storage_keys.dart';
import 'package:carting/data/abstract_repo/i_auth_repo.dart';
import 'package:carting/data/models/response_model.dart';
import 'package:carting/data/models/send_code_body.dart';
import 'package:carting/data/models/send_code_model.dart';
import 'package:carting/data/models/token_model.dart';
import 'package:carting/data/models/user_model.dart';
import 'package:carting/data/models/user_update_model.dart';
import 'package:carting/data/models/verify_body.dart';
import 'package:carting/infrastructure/apis/auth_datasource.dart';
import 'package:carting/infrastructure/core/exceptions/exceptions.dart';
import 'package:carting/infrastructure/core/exceptions/failures.dart';
import 'package:carting/infrastructure/repo/storage_repository.dart';
import 'package:carting/utils/either.dart';
import 'package:dio/dio.dart';

class AuthRepo implements IAuthRepo {
  final AuthDataSourcheImpl dataSourcheImpl;

  AuthRepo({required this.dataSourcheImpl});

  @override
  Future<Either<Failure, ResponseModel<UserModel>>> getMe() async {
    try {
      final result = await dataSourcheImpl.getMe();
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
  Future<Either<Failure, ResponseModel<SendCodeModel>>> sendCode(SendCodeBody body) async {
    try {
      final result = await dataSourcheImpl.sendCode(body);
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
  Future<Either<Failure, ResponseModel<TokenModel>>> verifyPost(VerifyBody body) async {
    try {
      final result = await dataSourcheImpl.verifyPost(body);
      await StorageRepository.putString(
        StorageKeys.TOKEN,
        result.data.token,
      );
      await StorageRepository.putString(
        StorageKeys.REFRESH,
        result.data.refreshToken,
      );
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
  Future<Either<Failure, bool>> userUpdate(UserUpdateModel body) async {
    try {
      final result = await dataSourcheImpl.userUpdate(body);
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
