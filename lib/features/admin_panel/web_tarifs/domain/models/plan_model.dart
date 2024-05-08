class PlanModel {
  int? days;
  String? desciption;
  String? name;
  String? price;
  String? id;

  PlanModel({this.days, this.desciption, this.name, this.price, this.id});

  PlanModel.fromJson(Map<String, dynamic> json) {
    days = json['days'];
    desciption = json['description'];
    name = json['name'];
    price = json['price'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['days'] = days;
    data['description'] = desciption;
    data['name'] = name;
    data['price'] = price;
    data['id'] = id;
    return data;
  }
}
