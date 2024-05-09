import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/data/data_sources/tarifs_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/repositories/tarifs_repository.dart';

class TarifsRepositoryImpl implements TarifsRepository {
  final TarifsRemoteDataSource tarifRemoteDataSource;
  TarifsRepositoryImpl({required this.tarifRemoteDataSource});

  @override
  Future<Either<Failure, String>> deletePlan(PlanModel? model) async {
    try {
      final result = await tarifRemoteDataSource.deletePlan(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, String>> editPlan(PlanModel? model) async {
    try {
      final result = await tarifRemoteDataSource.editPlan(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, List<PlanModel>>> getPlan() async {
    try {
      final result = await tarifRemoteDataSource.getPlan();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, String>> addPlan(PlanModel? model) async {
    try {
      final result = await tarifRemoteDataSource.addPlan(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }
}
