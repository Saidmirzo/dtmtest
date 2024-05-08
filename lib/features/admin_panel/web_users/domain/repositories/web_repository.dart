import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/model/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/models/plan_model.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';

abstract class WebRepository {
  Future<Either<Failure, List<UserModel>>> getAllUsers();

  Future<Either<Failure, List<ThemeModel>>> getAllThemes();
  Future<Either<Failure, List<AdvertisingModel>>> getAllAdvertising();
  Future<Either<Failure, String>> addNewAdvertising(
      AdvertisingModel advertisingModel);
  Future<Either<Failure, String>> addNewTheme(
      Uint8List filePath, String name, String categoryId);
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  Future<Either<Failure, String>> addCategory(CategoryModel model);
  Future<Either<Failure, String>> deleteCategory(CategoryModel? model);
  Future<Either<Failure, String>> editCategory(CategoryModel? model);
  Future<Either<Failure, String>> editPlan(PlanModel? model);
  Future<Either<Failure, String>> deletePlan(PlanModel? model);
  Future<Either<Failure, String>> addPlan(PlanModel? model);
  Future<Either<Failure, List<PlanModel>>> getPlan();
  Future<Either<Failure, List<AdminModel>>> getAdmins();
  Future<Either<Failure, List<HistoryModel>>> getAllHistory();
  Future<Either<Failure, String>> uploadImage(Uint8List byte, String name);
  Future<Either<Failure, String>> updateImage(
      Uint8List byte, String name, String publicId);
}
