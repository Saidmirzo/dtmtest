import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> loginWithGoogle();
  Future<Either<Failure, UserModel?>> getLocaleUserModel();
  Future<Either<Failure, bool>> logOut();
}
