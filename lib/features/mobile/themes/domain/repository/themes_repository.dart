import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';

abstract class ThemesRepository {
  Future<Either<Failure, List<ThemeModel>>> getThemes(String id);
}
