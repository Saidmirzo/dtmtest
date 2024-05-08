import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/models/plan_model.dart';
import 'package:dtmtest/features/admin_panel/all_data_sources/web_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_users/domain/repositories/web_repository.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

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
  Future<Either<Failure, List<ThemeModel>>> getAllThemes() async {
    try {
      final result = await webRemoteDataSource.getAllThemes();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get themes Error'));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final result = await webRemoteDataSource.getAllCategories();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get categories Error'));
    }
  }

  @override
  Future<Either<Failure, String>> addNewTheme(
    Uint8List filePath,
    String name,
    String categoryId,
  ) async {
    try {
      final List<Quiz> quizs = await _parseFromFile(filePath);
      final ThemeModel themeModel = ThemeModel(
        createdTime: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        quiz: quizs,
        quizCount: quizs.length,
      );
      final result =
          await webRemoteDataSource.addNewTheme(themeModel, categoryId);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Add new theme Error'));
    }
  }

  Future<List<Quiz>> _parseFromFile(Uint8List path) async {
    ByteData data = await rootBundle.load('assets/files/test.xlsx');
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    // if (bytes == path) {
    //   log('equal');
    // }
    var excel = Excel.decodeBytes(bytes);

    List<Map<String, dynamic>> questions = [];

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        if (row[0] != null && row[0]!.value != null) {
          var question = {
            'question': row[0]!.value.toString(),
            'options': row
                .skip(1)
                .where((cell) => cell != null && cell.value != null)
                .map((cell) => cell?.value.toString())
                .toList()
          };
          questions.add(question);
        }
      }
    }
    List<Quiz> quizs = questions.map((e) => Quiz.fromJson(e)).toList();
    return quizs;
  }


  @override
  Future<Either<Failure, String>> addCategory(CategoryModel model) async {
    try {
      final result = await webRemoteDataSource.addCategory(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCategory(CategoryModel? model) async {
    try {
      final result = await webRemoteDataSource.deleteCategory(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, String>> editCategory(CategoryModel? model) async {
    try {
      final result = await webRemoteDataSource.editCategory(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
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
