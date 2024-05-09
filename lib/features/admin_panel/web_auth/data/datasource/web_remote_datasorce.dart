import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/admin_panel/web_auth/data/model/response_enum.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';

abstract class WebAuthRemoteDataSource {
  Future<ResponseModel> loginAdmin(AdminModel adminModel);
}

class WebAuthRemoteDataSourceImpl implements WebAuthRemoteDataSource {
  final AuthLocaleDataSource authLocaleDataSource;
  WebAuthRemoteDataSourceImpl({required this.authLocaleDataSource});
  final CollectionReference adminCollection =
      FirebaseFirestore.instance.collection('admins');
  @override
  Future<ResponseModel> loginAdmin(AdminModel adminModel) async {
    final result =
        await adminCollection.where('login', isEqualTo: adminModel.login).get();
    if (result.docs.isNotEmpty) {
      final data = await adminCollection.doc(result.docs.first.id).get();
      final AdminModel resutModel =
          AdminModel.fromJson(jsonDecode(jsonEncode(data.data())));
      if (resutModel.password == adminModel.password &&
          resutModel.login == adminModel.login) {
        await authLocaleDataSource.saveAdmin(resutModel);
        return ResponseModel(
            adminModel: resutModel, responseEnum: ResponseEnum.success);
      } else {
        return ResponseModel(responseEnum: ResponseEnum.incorrectPassword);
      }
    } else {
      return ResponseModel( responseEnum: ResponseEnum.notFound);
    }
  }
}
