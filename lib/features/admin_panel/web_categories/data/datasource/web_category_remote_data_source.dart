import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';

abstract class WebRemoteCategoryDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<String> addCategory(CategoryModel model);
  Future<String> deleteCategory(CategoryModel? model);
  Future<String> editCategory(CategoryModel? model);
  Future<List<ThemeModel>> getAllThemes(String? id);
  Future<String> addNewTheme(ThemeModel themeModel, String categoryId);
}

class WebRemoteCategoryDataSourceImpl implements WebRemoteCategoryDataSource {
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('category');
  @override
  Future<String> addCategory(CategoryModel model) async {
    categoryCollection.add(model.toJson());
    return "success";
  }

  @override
  Future<String> deleteCategory(CategoryModel? model) async {
    try {
      await categoryCollection.doc(model?.id).delete();

      log("Элемент успешно удален");
    } catch (e) {
      log("Ошибка при удалении элемента: $e");
    }
    return "success";
  }

  @override
  Future<String> editCategory(CategoryModel? model) async {
    try {
      await categoryCollection.doc(model?.id).update(model!.toJson());
      log("Данные успешно обновлены");
    } catch (e) {
      log("Ошибка при обновлении данных: $e");
    }
    return "success";
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final result = await categoryCollection.get();
    List<CategoryModel> categories = result.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      data['id'] = e.id;
      return CategoryModel.fromJson(data);
    }).toList();
    categories.sort((a, b) {
      if ((a.isActive ?? false) && !(b.isActive ?? false)) {
        return -1;
      } else if (!(a.isActive ?? false) && (b.isActive ?? false)) {
        return 1;
      }
      return 0;
    });
    return categories;
  }

  @override
  Future<List<ThemeModel>> getAllThemes(String? id) async {
    List<ThemeModel> themes = [];
    QuerySnapshot result;
    if (id != null) {
      result = await categoryCollection.where('', isEqualTo: id).get();
    } else {
      result = await categoryCollection.get();
    }
    for (var element in result.docs) {
      final themesDocs =
          await categoryCollection.doc(element.id).collection('theme').get();
      themes.addAll(
        themesDocs.docs.map(
          (e) => ThemeModel.fromJson(
            jsonDecode(
              jsonEncode(e.data()),
            ),
          ),
        ),
      );
    }
    return themes;
  }

  @override
  Future<String> addNewTheme(ThemeModel themeModel, String categoryId) async {
    final CollectionReference category =
        categoryCollection.doc(categoryId).collection('theme');
    await category.add(themeModel.toJson());
    return "Success";
  }
}
