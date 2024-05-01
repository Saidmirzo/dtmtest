class CategoryModel {
  String? image;
  String? name;
  int? quizCount;
  int? themeCount;
  String? id;
  bool? isActive;

  CategoryModel(
      {this.image, this.name, this.quizCount, this.themeCount, this.id,this.isActive});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    quizCount = json['quiz_count'];
    themeCount = json['theme_count'];
    id = json['id'];
    isActive=json["isActive"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['quiz_count'] = quizCount;
    data['theme_count'] = themeCount;
    data['id'] = id;
    data["isActive"]=isActive;
    return data;
  }
}
