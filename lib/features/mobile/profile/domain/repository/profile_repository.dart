import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserModel>> getProfileData();
  Future<Either<Failure, String>> updateProfileData(UserModel model);
}
