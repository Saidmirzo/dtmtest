import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';
import 'package:dtmtest/features/admin_panel/all_data_sources/web_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';

class WebRepositoryImpl implements WebRepository {
  final WebRemoteDataSource webRemoteDataSource;
  WebRepositoryImpl({required this.webRemoteDataSource});
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
  Future<Either<Failure, String>> deletePlan(PlanModel? model) async {
    try {
      final result = await webRemoteDataSource.deletePlan(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, String>> editPlan(PlanModel? model) async {
    try {
      final result = await webRemoteDataSource.editPlan(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, List<PlanModel>>> getPlan() async {
    try {
      final result = await webRemoteDataSource.getPlan();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, String>> addPlan(PlanModel? model) async {
    try {
      final result = await webRemoteDataSource.addPlan(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, List<AdminModel>>> getAdmins() async {
    try {
      final result = await webRemoteDataSource.getAdmins();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, List<HistoryModel>>> getAllHistory() async {
    try {
      final result = await webRemoteDataSource.getAllHistory();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add history Error'));
    }
  }

}
