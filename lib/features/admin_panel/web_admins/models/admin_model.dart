class AdminModel {
  String? login;
  String? password;
  String? name;
  String? id;

  AdminModel({this.login, this.password, this.name, this.id});

  AdminModel.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    password = json['password'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['password'] = password;
    data['name'] = name;
    data['id'] = id;
    return data;
  }
}
