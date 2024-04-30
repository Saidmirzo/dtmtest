import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/data/model/theme_model.dart';

abstract class ThemesRepository {
  Future<Either<Failure, List<ThemeModel>>> getThemes(String id);
}
