import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/datasource/web_category_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/domain/repository/web_category_repository.dart';
import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

class WebCategoryRepositoryImpl implements WebCategoryRepository {
  final WebRemoteCategoryDataSource webRemoteCategoryDataSource;

  WebCategoryRepositoryImpl({required this.webRemoteCategoryDataSource});

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
      final result = await webRemoteCategoryDataSource.addCategory(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCategory(String model) async {
    try {
      final result = await webRemoteCategoryDataSource.deleteCategory(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, String>> editCategory(CategoryModel? model) async {
    try {
      final result = await webRemoteCategoryDataSource.editCategory(model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add category Error'));
    }
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    try {
      final result = await webRemoteCategoryDataSource.getAllCategories();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get categories Error'));
    }
  }

  @override
  Future<Either<Failure, String>> addTheme(
      Uint8List filePath, String name, String categoryId) async {
    try {
      final List<Quiz> quizs = await _parseFromFile(filePath);
      final ThemeModel themeModel = ThemeModel(
        createdTime: DateTime.now().millisecondsSinceEpoch.toString(),
        name: name,
        quiz: quizs,
        quizCount: quizs.length,
      );
      final result =
          await webRemoteCategoryDataSource.addTheme(themeModel, categoryId);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Add new theme Error'));
    }
  }

  @override
  Future<Either<Failure, List<ThemeModel>>> getAllThemes(String categoryId) async {
    try {
      final result = await webRemoteCategoryDataSource.getAllThemes(categoryId);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get themes Error'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteTheme(
      String themeId, String categoryId) async {
    try {
      final result =
          await webRemoteCategoryDataSource.deleteTheme(themeId, categoryId);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get themes Error'));
    }
  }

  @override
  Future<Either<Failure, String>> editTheme( String categoryId, ThemeModel model) async {
    try {
      final result =
          await webRemoteCategoryDataSource.editTheme(categoryId, model);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get themes Error'));
    }
  }
}
