import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';

abstract class ThemesDataSource {
  Future<List<ThemeModel>> getTheme(String id);
}

class ThemesDataSourceImpl implements ThemesDataSource {
  @override
  Future<List<ThemeModel>> getTheme(String id) async {
    final result = await FirebaseFirestore.instance
        .collection('category')
        .doc(id)
        .collection('theme')
        .get();
    List<ThemeModel> list = result.docs
        .map((e) => ThemeModel.fromJson(jsonDecode(jsonEncode(e.data()))))
        .toList();
    return list;
  }
}
