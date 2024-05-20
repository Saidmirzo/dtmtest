import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';

abstract class WebUsersRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<List<AdminModel>> getAdmins();
  Future<String> addAdmin(AdminModel? model);

  Future<String> editAdmin(AdminModel? model);

  Future<String> deteleAdmin(String id);

  Future<String> deteleUser(String id);
}

class WebUsersRemoteDataSourceImpl implements WebUsersRemoteDataSource {
  WebUsersRemoteDataSourceImpl({required this.authLocaleDataSource});

  final AuthLocaleDataSource authLocaleDataSource;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference adminsCollection =
      FirebaseFirestore.instance.collection('admins');

  @override
  Future<List<UserModel>> getAllUsers() async {
    final result = await userCollection.get();
    List<UserModel> users = result.docs.map((e) {
      Map<String, dynamic> data = e.data() as Map<String, dynamic>;
      data['id'] = e.id;
      return UserModel.fromJson(data);
    }).toList();
    return users.reversed.toList();
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
  Future<String> addAdmin(AdminModel? model) async {
    await adminsCollection.add(model?.toJson());
    return "success";
  }

  @override
  Future<String> deteleAdmin(String id) async {
    try {
      await adminsCollection.doc(id).delete();
      log("Элемент успешно удален");
    } catch (e) {
      log("Ошибка при удалении элемента: $e");
    }
    return "success";
  }

  @override
  Future<String> deteleUser(String id) async {
    try {
      await userCollection.doc(id).delete();
      log("Элемент успешно удален");
    } catch (e) {
      log("Ошибка при удалении элемента: $e");
    }
    return "success";
  }

  @override
  Future<String> editAdmin(AdminModel? model) async {
    try {
      await adminsCollection.doc(model?.id).update(model!.toJson());
      log("Данные успешно обновлены");
    } catch (e) {
      log("Ошибка при обновлении данных: $e");
    }
    return "success";
  }
}
