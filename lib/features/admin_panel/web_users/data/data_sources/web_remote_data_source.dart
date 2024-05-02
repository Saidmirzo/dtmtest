import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dtmtest/features/admin_panel/web_admins/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/model/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_categories/models/category_model.dart';
import 'package:dtmtest/features/admin_panel/web_quizes/data/model/theme_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/models/plan_model.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http_parser/http_parser.dart';

abstract class WebRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<List<ThemeModel>> getAllThemes();
  Future<String> addNewTheme(ThemeModel themeModel, String categoryId);
  Future<String> addNewAdvertising(AdvertisingModel advertisingModel);
  Future<List<AdvertisingModel>> getAdvertising();
  Future<List<CategoryModel>> getAllCategories();
  Future<String> addCategory(CategoryModel model);
  Future<String> deleteCategory(CategoryModel? model);
  Future<String> editCategory(CategoryModel? model);
  Future<String> editPlan(PlanModel? model);
  Future<String> addPlan(PlanModel? model);
  Future<String> deletePlan(PlanModel? model);
  Future<List<PlanModel>> getPlan();
  Future<List<AdminModel>> getAdmins();
  Future<List<HistoryModel>> getAllHistory();
  Future<String> postImage(Uint8List byte, String name);
}

class WebRemoteDataSourceImpl implements WebRemoteDataSource {
  WebRemoteDataSourceImpl({required this.authLocaleDataSource});

  final AuthLocaleDataSource authLocaleDataSource;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('category');
  final CollectionReference advertisingCollection =
      FirebaseFirestore.instance.collection('advertising');
  final CollectionReference planCollection =
      FirebaseFirestore.instance.collection('plans');
  final CollectionReference adminsCollection =
      FirebaseFirestore.instance.collection('admins');

  @override
  Future<List<UserModel>> getAllUsers() async {
    final List<UserModel> users;
    final result = await userCollection.get();
    users = result.docs
        .map((e) => UserModel.fromJson(jsonDecode(jsonEncode(e.data()))))
        .toList();
    return users;
  }

  @override
  Future<List<ThemeModel>> getAllThemes() async {
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
    return themes;
  }

  @override
  Future<String> addNewTheme(ThemeModel themeModel, String categoryId) async {
    final CollectionReference category =
        categoryCollection.doc(categoryId).collection('theme');
    await category.add(themeModel.toJson());
    return "Success";
  }

  @override
  Future<String> addNewAdvertising(AdvertisingModel advertisingModel) async {
    await advertisingCollection.add(advertisingModel.toJson());
    return "Success";
  }

  @override
  Future<List<AdvertisingModel>> getAdvertising() async {
    final List<AdvertisingModel> listAdvertising;
    final result = await advertisingCollection.get();
    listAdvertising = result.docs
        .map((e) => AdvertisingModel.fromJson(jsonDecode(jsonEncode(e.data()))))
        .toList();
    return listAdvertising;
  }

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    final result = await categoryCollection.get();
    List<CategoryModel> categories = result.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      data['id'] = e.id;
      return CategoryModel.fromJson(data);
    }).toList();

    return categories;
  }

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
  Future<String> editCategory(
    CategoryModel? model,
  ) async {
    try {
      await categoryCollection.doc(model?.id).update(model!.toJson());
      log("Данные успешно обновлены");
    } catch (e) {
      log("Ошибка при обновлении данных: $e");
    }
    return "success";
  }

  @override
  Future<String> deletePlan(PlanModel? model) async {
    try {
      await planCollection.doc(model?.id).delete();
      log("Элемент успешно удален");
    } catch (e) {
      log("Ошибка при удалении элемента: $e");
    }
    return "success";
  }

  @override
  Future<String> editPlan(PlanModel? model) async {
    try {
      await planCollection.doc(model?.id).update(model!.toJson());
      log("Данные успешно обновлены");
    } catch (e) {
      log("Ошибка при обновлении данных: $e");
    }
    return "success";
  }

  @override
  Future<List<PlanModel>> getPlan() async {
    final result = await planCollection.get();
    List<PlanModel> plans = result.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      data['id'] = e.id;
      return PlanModel.fromJson(data);
    }).toList();

    return plans;
  }

  @override
  Future<String> addPlan(PlanModel? model) async {
    planCollection.add(model?.toJson());
    return "success";
  }

  @override
  Future<List<AdminModel>> getAdmins() async {
    final result = await adminsCollection.get();
    List<AdminModel> admins = result.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      data['id'] = e.id;
      return AdminModel.fromJson(data);
    }).toList();
    return admins;
  }

  @override
  Future<List<HistoryModel>> getAllHistory() async {
    final UserModel? userModel = await authLocaleDataSource.getLocaleUserDtat();
    List<HistoryModel> listHistory;
    final String id = userModel?.uid ?? "";
    final CollectionReference historyCollection =
        userCollection.doc(id).collection('history');
    final result = await historyCollection.get();
    listHistory = result.docs
        .map(
          (e) => HistoryModel.fromJson(
            jsonDecode(
              jsonEncode(e.data()),
            ),
          ),
        )
        .toList();
    return listHistory;
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
