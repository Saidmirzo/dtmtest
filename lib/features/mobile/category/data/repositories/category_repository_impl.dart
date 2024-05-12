import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/datasource/web_category_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/mobile/category/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  WebRemoteCategoryDataSource webRemoteCategoryDataSource;

  CategoryRepositoryImpl({required this.webRemoteCategoryDataSource});

  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategory() async {
    try {
      final result = await webRemoteCategoryDataSource.getAllCategories();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get categories Error'));
    }
  }
}
