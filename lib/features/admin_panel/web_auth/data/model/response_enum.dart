import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';

enum ResponseEnum {
  success,
  notFound,
  incorrectPassword,
}

class ResponseModel {
  AdminModel? adminModel;
  ResponseEnum responseEnum;
  ResponseModel({ this.adminModel, required this.responseEnum});
}
