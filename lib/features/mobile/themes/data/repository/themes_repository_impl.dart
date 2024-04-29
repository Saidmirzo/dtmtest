import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/data/model/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/data_sources/web_remote_data_source.dart';
import 'package:dtmtest/features/mobile/themes/domain/repository/themes_repository.dart';

class ThemesRepositoryImpl implements ThemesRepository {
  WebRemoteDataSource webRemoteDataSource;
  ThemesRepositoryImpl({required this.webRemoteDataSource});
  @override
  Future<Either<Failure, List<ThemeModel>>> getAllThemes() async {
    try {
      final result = await webRemoteDataSource.getAllThemes();      
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure("get themes error"));
    }
  }
}
