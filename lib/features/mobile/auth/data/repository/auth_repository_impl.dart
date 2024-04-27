import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_remote_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_register_model.dart';
import 'package:dtmtest/features/mobile/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocaleDataSource authLocaleDataSource;
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocaleDataSource,
  });

  @override
  Future<Either<Failure, String>> loginWithGoogle() async {
    try {
      await authRemoteDataSource.loginWithGoogle();
      return const Right("Succes");
    } catch (e) {
      return const Left(ServerFailure("login error"));
    }
  }

  @override
  Future<Either<Failure, UserModel?>> getLocaleUserModel() async {
    try {
      final reult = await authLocaleDataSource.getLocaleUserDtat();
      return Right(reult);
    } catch (e) {
      return const Left(ServerFailure("login error"));
    }
  }

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      final reult = await authLocaleDataSource.logOut();
      return Right(reult);
    } catch (e) {
      return const Left(ServerFailure("login error"));
    }
  }

  @override
  Future<Either<Failure, String>> registerWithEmail(
    UserRegisterModel userRegisterModel,
  ) async {
    try {
      await authRemoteDataSource.registerWithEmail(userRegisterModel);
      return const Right("Success");
    } catch (e) {
      return const Left(ServerFailure("login error"));
    }
  }

  @override
  Future<Either<Failure, String>> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      await authRemoteDataSource.loginWithEmail(
        email: email,
        password: password,
      );
      return const Right("Success");
    } catch (e) {
      return const Left(ServerFailure("login error"));
    }
  }
}
