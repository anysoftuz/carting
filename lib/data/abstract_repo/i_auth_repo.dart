import 'package:carting/data/models/response_model.dart';
import 'package:carting/data/models/send_code_body.dart';
import 'package:carting/data/models/send_code_model.dart';
import 'package:carting/data/models/token_model.dart';
import 'package:carting/data/models/user_model.dart';
import 'package:carting/data/models/user_update_model.dart';
import 'package:carting/data/models/verify_body.dart';
import 'package:carting/infrastructure/core/exceptions/failures.dart';
import 'package:carting/utils/either.dart';

abstract class IAuthRepo {
  Future<Either<Failure, ResponseModel<UserModel>>> getMe();
  Future<Either<Failure, ResponseModel<SendCodeModel>>> sendCode(
    SendCodeBody body,
  );
  Future<Either<Failure, ResponseModel<TokenModel>>> verifyPost(
    VerifyBody body,
  );
  Future<Either<Failure, ResponseModel<TokenModel>>> refreshToken();
  Future<Either<Failure, bool>> userUpdate(UserUpdateModel body);
}
