import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';

abstract class WebCategoryRepository {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  Future<Either<Failure, String>> addCategory(CategoryModel model);
  Future<Either<Failure, String>> deleteCategory(String id);
  Future<Either<Failure, String>> editCategory(CategoryModel? model);
  Future<Either<Failure, List<ThemeModel>>> getAllThemes(String categoryId);
  Future<Either<Failure, String>> addTheme(
      Uint8List filePath, String name, String categoryId);
  Future<Either<Failure, String>> editTheme(
    String categoryId,
    ThemeModel model,
  );
  Future<Either<Failure, String>> deleteTheme(String themeId, String categoryId);
}
