import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';

abstract class WebRepository {
  Future<Either<Failure, List<UserModel>>> getAllUsers();
  Future<Either<Failure, String>> editPlan(PlanModel? model);
  Future<Either<Failure, String>> deletePlan(PlanModel? model);
  Future<Either<Failure, String>> addPlan(PlanModel? model);
  Future<Either<Failure, List<PlanModel>>> getPlan();
  Future<Either<Failure, List<AdminModel>>> getAdmins();
  Future<Either<Failure, List<HistoryModel>>> getAllHistory();
}
