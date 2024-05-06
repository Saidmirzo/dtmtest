import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/profile/data/datasource/profile_remote_datasource.dart';
import 'package:dtmtest/features/mobile/profile/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  final AuthLocaleDataSource authLocaleDataSource;
  ProfileRepositoryImpl({
    required this.profileRemoteDataSource,
    required this.authLocaleDataSource, 
  });

  @override
  Future<Either<Failure, UserModel>> getProfileData() async {
    try {
      final result = await profileRemoteDataSource.getProfileData();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure("login error"));
    }
  }

  @override
  Future<Either<Failure, String>> updateProfileData(UserModel model) async {
    try {
      final result = await profileRemoteDataSource.updateProfileData(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure("login error"));
    }
  }
}
