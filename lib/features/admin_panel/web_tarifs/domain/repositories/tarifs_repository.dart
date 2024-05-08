import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';

abstract class TarifsRepository {
  Future<Either<Failure, String>> editPlan(PlanModel? model);
  Future<Either<Failure, String>> deletePlan(PlanModel? model);
  Future<Either<Failure, String>> addPlan(PlanModel? model);
  Future<Either<Failure, List<PlanModel>>> getPlan();
}
