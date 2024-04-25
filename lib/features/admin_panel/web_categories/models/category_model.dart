class CategoryModel {
  String? image;
  String? name;
  int? quizCount;
  int? themeCount;
  String? id;

  CategoryModel(
      {this.image, this.name, this.quizCount, this.themeCount, this.id});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
    quizCount = json['quiz_count'];
    themeCount = json['theme_count'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['quiz_count'] = quizCount;
    data['theme_count'] = themeCount;
    data['id'] = id;
    return data;
  }
}
