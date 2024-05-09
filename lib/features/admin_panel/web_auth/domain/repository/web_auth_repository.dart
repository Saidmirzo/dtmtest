import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';

abstract class WebAuthRepository {
  Future<Either<Failure, AdminModel>> loginAdmin(AdminModel adminModel);
  Future<Either<Failure, AdminModel?>> getFromLocale();
}
