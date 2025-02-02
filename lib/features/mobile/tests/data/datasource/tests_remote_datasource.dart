import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/tests/data/models/history_model.dart';

abstract class TestsRemoteDataSource {
  Future<List<HistoryModel>> getAllHistory();
  Future<String> saveToHistory(HistoryModel historyModel);
}

class TestsRemoteDataSourceImpl implements TestsRemoteDataSource {
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final AuthLocaleDataSource authLocaleDataSource;
  TestsRemoteDataSourceImpl({required this.authLocaleDataSource});

  @override
  Future<List<HistoryModel>> getAllHistory() async {
    final UserModel? userModel = await authLocaleDataSource.getLocaleUserDtat();
    List<HistoryModel> listHistory;
    if (userModel != null) {
      final String id = userModel.uid ?? "";
      final CollectionReference historyCollection =
          userCollection.doc(id).collection('history');
      final result = await historyCollection.get();
      listHistory = result.docs
          .map((e) => HistoryModel.fromJson(jsonDecode(jsonEncode(e))))
          .toList();
      return listHistory;
    } else {
      throw Exception();
    }
  }

  @override
  Future<String> saveToHistory(HistoryModel historyModel) async {
    final UserModel? userModel = await authLocaleDataSource.getLocaleUserDtat();
    if (userModel != null) {
      final String id = userModel.uid ?? "";
      final userDoc = userCollection.doc(id);
      final result = await userDoc.get();
      final UserModel user =
          UserModel.fromJson(jsonDecode(jsonEncode(result.data())));
      await  userDoc.update(
          {"rating": (user.rating ?? 0) + (historyModel.correctCount ?? 0)});
      final CollectionReference historyCollection =
          userCollection.doc(id).collection('history');
      await historyCollection.add(historyModel.toJson());
      return 'Success';
    } else {
      throw Exception();
    }
  }
}
