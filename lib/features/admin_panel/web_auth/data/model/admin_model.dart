import 'package:hive/hive.dart';

part 'admin_model.g.dart';

@HiveType(typeId: 1)
class AdminModel {
  @HiveField(0)
  String? login;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? password;

  AdminModel({this.login, this.name, this.password});

  AdminModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['login'] = this.login;
    data['name'] = this.name;
    data['password'] = this.password;
    return data;
  }
}
