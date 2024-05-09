import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';

abstract class WebUsersRepository {
  Future<Either<Failure, List<UserModel>>> getAllUsers();

  Future<Either<Failure, List<AdminModel>>> getAdmins();

  Future<Either<Failure, String>> addAdmin(AdminModel? model);

  Future<Either<Failure, String>> editAdmin(AdminModel? model);

  Future<Either<Failure, String>> deteleAdmin(String id);

  Future<Either<Failure, String>> deteleUser(String id);
}
