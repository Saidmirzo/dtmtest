import 'dart:typed_data';

import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';

import 'quiz_parser.dart';

class WebQuizParser implements QuizParser {
  @override
  Future<List<ThemeModel>> parseFromFile(Uint8List bytes) {
    throw UnsupportedError("This functionality is only available on the web.");
  }
}
