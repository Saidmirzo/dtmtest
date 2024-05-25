import 'dart:typed_data';

import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';

abstract class QuizParser {
  Future<List<ThemeModel>> parseFromFile(Uint8List bytes);
}
 