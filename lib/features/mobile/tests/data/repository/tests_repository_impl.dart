import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/mobile/tests/data/datasource/tests_remote_datasource.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:dtmtest/features/mobile/tests/domain/repository/tests_repository.dart';

class TestsRepositoryImpl implements TestsRepository {
  final TestsRemoteDataSource testsRemoteDataSource;
  TestsRepositoryImpl({required this.testsRemoteDataSource});
  @override
  Future<Either<Failure, String>> saveToHistory(
    HistoryModel historyModel,
  ) async {
    try {
      await testsRemoteDataSource.saveToHistory(historyModel);
      return const Right("Success");
    } catch (e) {
      return const Left(ServerFailure('Error'));
    }
  }
}
