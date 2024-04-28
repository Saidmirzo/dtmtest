import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';

abstract class TestsRepository {
  Future<Either<Failure, String>> saveToHistory(HistoryModel historyModel);
}
