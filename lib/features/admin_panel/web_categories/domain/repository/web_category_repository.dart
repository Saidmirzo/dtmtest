import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';

abstract class WebCategoryRepository {
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  Future<Either<Failure, String>> addCategory(CategoryModel model);
  Future<Either<Failure, String>> deleteCategory(CategoryModel? model);
  Future<Either<Failure, String>> editCategory(CategoryModel? model);
  Future<Either<Failure, List<ThemeModel>>> getAllThemes(String? id);
  Future<Either<Failure, String>> addNewTheme(
      Uint8List filePath, String name, String categoryId);
}
