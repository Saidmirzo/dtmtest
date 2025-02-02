import 'dart:convert';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';

abstract class WebRemoteDataSource {
  Future<List<UserModel>> getAllUsers();
  Future<String> editPlan(PlanModel? model);
  Future<String> addPlan(PlanModel? model);
  Future<String> deletePlan(PlanModel? model);
  Future<List<PlanModel>> getPlan();
  Future<List<AdminModel>> getAdmins();
  Future<List<HistoryModel>> getAllHistory();
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
    final result = await historyCollection.orderBy('time').get();
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
}
