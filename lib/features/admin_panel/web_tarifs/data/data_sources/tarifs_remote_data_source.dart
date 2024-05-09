import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/admin_panel/web_tarifs/domain/models/plan_model.dart';

abstract class TarifsRemoteDataSource {
  Future<String> editPlan(PlanModel? model);
  Future<String> addPlan(PlanModel? model);
  Future<String> deletePlan(PlanModel? model);
  Future<List<PlanModel>> getPlan();
}

class TarifsRemoteDataSourceImpl implements TarifsRemoteDataSource {
  TarifsRemoteDataSourceImpl();
  final CollectionReference planCollection =
      FirebaseFirestore.instance.collection('plans');

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
}
