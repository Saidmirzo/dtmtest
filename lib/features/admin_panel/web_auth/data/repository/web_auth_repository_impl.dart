import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_auth/data/datasource/web_remote_datasorce.dart';
import 'package:dtmtest/features/admin_panel/web_auth/data/model/response_enum.dart';
import 'package:dtmtest/features/admin_panel/web_auth/domain/repository/web_auth_repository.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';

class WebAuthRepositoryImpl implements WebAuthRepository {
  WebAuthRemoteDataSource webAuthRemoteDataSource;
  AuthLocaleDataSource authLocaleDataSource;
  WebAuthRepositoryImpl({
    required this.webAuthRemoteDataSource,
    required this.authLocaleDataSource,
  });

  @override
  Future<Either<Failure, AdminModel>> loginAdmin(AdminModel adminModel) async {
    try {
      final result = await webAuthRemoteDataSource.loginAdmin(adminModel);
      if (result.responseEnum == ResponseEnum.success) {
        return Right(result.adminModel ?? AdminModel());
      } else if (result.responseEnum == ResponseEnum.incorrectPassword) {
        return const Left(PasswordIncorrectFailure(''));
      } else if (result.responseEnum == ResponseEnum.notFound) {
        return const Left(UnautorizedFailure(''));
      } else {
        return const Left(ServerFailure(''));
      }
    } catch (e) {
      return const Left(ServerFailure(''));
    }
  }

  @override
  Future<Either<Failure, AdminModel?>> getFromLocale() async {
    try {
      final AdminModel? adminModel = await authLocaleDataSource.getAdmin();
      return Right(adminModel);
    } catch (e) {
      return const Left(CacheFailure('message'));
    }
  }
}
