import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/datasource/web_category_remote_data_source.dart';
import 'package:dtmtest/features/admin_panel/web_home/data/model/home_detail_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/data_sources/web_users_remote_data_source.dart';

abstract class WebHomeRepository {
  Future<Either<Failure, HomeDetailModel>> getAllCounts();
}

class WebHomeRepositoryImpl implements WebHomeRepository {
  WebUsersRemoteDataSource webUsersRemoteDataSource;
  WebRemoteCategoryDataSource webRemoteCategoryDataSource;
  WebHomeRepositoryImpl({
    required this.webRemoteCategoryDataSource,
    required this.webUsersRemoteDataSource,
  });
  @override
  Future<Either<Failure, HomeDetailModel>> getAllCounts() async {
    try {
      final users = await webUsersRemoteDataSource.getAllUsers();
      final categoryies = await webRemoteCategoryDataSource.getAllCategories();
      HomeDetailModel model =
          await webRemoteCategoryDataSource.getAllThemesCount();
      model.users = users.length;
      model.categoyies = categoryies.length;
      return Right(model);
    } catch (e) {
      return const Left(ServerFailure(''));
    }
  }
}
