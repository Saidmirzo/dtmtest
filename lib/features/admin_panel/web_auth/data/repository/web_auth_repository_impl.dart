import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_auth/data/datasource/web_remote_datasorce.dart';
import 'package:dtmtest/features/admin_panel/web_auth/data/model/response_enum.dart';
import 'package:dtmtest/features/admin_panel/web_auth/domain/repository/web_auth_repository.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';

class WebAuthRepositoryImpl implements WebAuthRepository {
  WebAuthRemoteDataSource webAuthRemoteDataSource;
  WebAuthRepositoryImpl({required this.webAuthRemoteDataSource});

  @override
  Future<Either<Failure, String>> loginAdmin(AdminModel adminModel) async {
    try {
      final result = await webAuthRemoteDataSource.loginAdmin(adminModel);
      if (result == ResponseEnum.success) {
        return const Right("Success");
      } else if (result == ResponseEnum.incorrectPassword) {
        return const Left(PasswordIncorrectFailure(''));
      } else if (result == ResponseEnum.notFound) {
        return const Left(UnautorizedFailure(''));
      } else {
        return const Left(ServerFailure(''));
      }
    } catch (e) {
      return const Left(ServerFailure(''));
    }
  }
}
