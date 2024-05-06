import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getProfileData();
  Future<String> updateProfileData(UserModel model);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final AuthLocaleDataSource authLocaleDataSource;
  ProfileRemoteDataSourceImpl({
    required this.authLocaleDataSource,
  });

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<UserModel> getProfileData() async {
    UserModel? model = await authLocaleDataSource.getLocaleUserDtat();
    final result = await userCollection.doc(model?.uid).get();
    return UserModel.fromJson(
      jsonDecode(
        jsonEncode(
          result.data(),
        ),
      ),
    );
  }

  @override
  Future<String> updateProfileData(UserModel model) async {
    UserModel? localUser = await authLocaleDataSource.getLocaleUserDtat();
    try {
      await userCollection.doc(localUser?.uid).update(model.toJson());
      log("Данные успешно обновлены");
      authLocaleDataSource.saveLocaleUserDtat(model);
    } catch (e) {
      log("Ошибка при обновлении данных: $e");
    }
    return "success";
  }
}
