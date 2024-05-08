import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:dtmtest/features/admin_panel/all_data_sources/web_remote_data_source.dart';
import 'package:dtmtest/features/mobile/themes/data/datasource/themes_remote_datasource.dart';
import 'package:dtmtest/features/mobile/themes/domain/repository/themes_repository.dart';

class ThemesRepositoryImpl implements ThemesRepository {
  WebRemoteDataSource webRemoteDataSource;
  ThemesDataSource themesDataSource;
  ThemesRepositoryImpl({
    required this.webRemoteDataSource,
    required this.themesDataSource,
  });
  @override
  Future<Either<Failure, List<ThemeModel>>> getThemes(String id) async {
    try {
      final result = await themesDataSource.getTheme(id);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure("get themes error"));
    }
  }
}
