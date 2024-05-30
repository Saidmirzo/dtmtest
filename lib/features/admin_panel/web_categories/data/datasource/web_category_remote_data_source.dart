import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/data/models/theme_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:dtmtest/features/admin_panel/web_home/data/model/home_detail_model.dart';

abstract class WebRemoteCategoryDataSource {
  Future<List<CategoryModel>> getAllCategories();
  Future<String> addCategory(CategoryModel model);
  Future<String> deleteCategory(String id);
  Future<String> editCategory(CategoryModel? model);

  Future<List<ThemeModel>> getAllThemes(String categoryId);
  Future<HomeDetailModel> getAllThemesCount();
  Future<String> addTheme(ThemeModel themeModel, String categoryId);
  Future<String> editTheme(
    String categoryId,
    ThemeModel model,
  );
  Future<String> deleteTheme(String themeId, String categoryId);
  Future<String> postImage(Uint8List byte, String name);
}

class WebRemoteCategoryDataSourceImpl implements WebRemoteCategoryDataSource {
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('category');

  @override
  Future<HomeDetailModel> getAllThemesCount() async {
    List<ThemeModel> themes = [];
    final result = await categoryCollection.get();
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
    int quizs = 0;
    for (var element in themes) {
      quizs += element.quiz?.length ?? 0;
    }
    return HomeDetailModel(themes: themes.length, quizes: quizs);
  }

  @override
  Future<String> addCategory(CategoryModel model) async {
    try {
      await categoryCollection.add(model.toJson());
      log("Элемент успешно добавлен");
    } catch (e) {
      log("Ошибка при добавление элемента: $e");
    }
    return "success";
  }

  @override
  Future<String> deleteCategory(String id) async {
    try {
      await categoryCollection.doc(id).delete();
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
  Future<List<ThemeModel>> getAllThemes(String categoryId) async {
    final result =
        await categoryCollection.doc(categoryId).collection('theme').get();
    List<ThemeModel> themesList = result.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      return ThemeModel.fromJson(data);
    }).toList();
    return themesList;
  }

  @override
  Future<String> addTheme(ThemeModel themeModel, String categoryId) async {
    final CollectionReference theme =
        categoryCollection.doc(categoryId).collection('theme');
    await theme.add(themeModel.toJson());
    return "Success";
  }

  @override
  Future<String> deleteTheme(String themeId, String categoryId) async {
    final CollectionReference category =
        categoryCollection.doc(categoryId).collection('theme');
    await category.doc(themeId).delete();
    return "Success";
  }

  @override
  Future<String> editTheme(String categoryId, ThemeModel? model) async {
    model?.quizCount = model.quiz?.length;
    final CollectionReference category =
        categoryCollection.doc(categoryId).collection('theme');
    await category.doc(model?.id).update(model!.toJson());
    return "Success";
  }

  @override
  Future<String> postImage(Uint8List byte, String name) async {
    var dio = Dio();
    var multiPartFile = MultipartFile.fromBytes(
      byte,
      filename: name,
      contentType: MediaType('image', 'jpeg'),
    );
    var formData = FormData.fromMap(
      {
        'file': multiPartFile,
        'upload_preset': 'kxjpuwhs',
      },
    );

    var response = await dio.post(
      'https://api.cloudinary.com/v1_1/df7fvomdn/upload',
      data: formData,
    );
    return response.data["secure_url"];
  }
}
