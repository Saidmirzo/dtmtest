import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/admin_panel/web_auth/data/model/response_enum.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';

abstract class WebAuthRemoteDataSource {
  Future<ResponseEnum> loginAdmin(AdminModel adminModel);
}

class WebAuthRemoteDataSourceImpl implements WebAuthRemoteDataSource {
  final CollectionReference adminCollection =
      FirebaseFirestore.instance.collection('admins');
  @override
  Future<ResponseEnum> loginAdmin(AdminModel adminModel) async {
    final result =
        await adminCollection.where('login', isEqualTo: adminModel.login).get();
    if (result.docs.isNotEmpty) {
      final data = await adminCollection.doc(result.docs.first.id).get();
      final AdminModel resutModel =
          AdminModel.fromJson(jsonDecode(jsonEncode(data.data())));
      if (resutModel.password == adminModel.password &&
          resutModel.login == adminModel.login) {
        return ResponseEnum.success;
      } else {
        return ResponseEnum.incorrectPassword;
      }
    } else {
      return ResponseEnum.notFound;
    }
  }
}
