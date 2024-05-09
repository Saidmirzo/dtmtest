import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/data_sources/web_users_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_users_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';

class WebUsersRepositoryImpl implements WebUsersRepository {
  final WebUsersRemoteDataSource webRemoteDataSource;
  WebUsersRepositoryImpl({required this.webRemoteDataSource});
  @override
  Future<Either<Failure, List<UserModel>>> getAllUsers() async {
    try {
      final result = await webRemoteDataSource.getAllUsers();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get users Error'));
    }
  }

  @override
  Future<Either<Failure, String>> addAdmin(AdminModel? model) async {
    try {
      final result = await webRemoteDataSource.addAdmin(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get users Error'));
    }
  }

  @override
  Future<Either<Failure, String>> deteleAdmin(String id) async {
    try {
      final result = await webRemoteDataSource.deteleAdmin(id);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get users Error'));
    }
  }

  @override
  Future<Either<Failure, String>> deteleUser(String id) async {
    try {
      final result = await webRemoteDataSource.deteleUser(id);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get users Error'));
    }
  }

  @override
  Future<Either<Failure, String>> editAdmin(AdminModel? model) async {
    try {
      final result = await webRemoteDataSource.editAdmin(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get users Error'));
    }
  }

  @override
  Future<Either<Failure, List<AdminModel>>> getAdmins() async {
    try {
      final result = await webRemoteDataSource.getAdmins();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get users Error'));
    }
  }
}
