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
  @HiveField(3)
  String? id;

  AdminModel({this.login, this.name, this.password, this.id});

  AdminModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    name = json['name'];
    password = json['password'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['login'] = this.login;
    data['name'] = this.name;
    data['password'] = this.password;
    data['id'] = this.id;
    return data;
  }
}
