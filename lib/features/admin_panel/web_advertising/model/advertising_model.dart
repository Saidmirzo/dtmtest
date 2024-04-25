class AdvertisingModel {
  String? image;
  String? link;
  String? title;
  String? description;

  AdvertisingModel({this.image, this.link, this.title, this.description});

  AdvertisingModel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    link = json['link'];
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image ?? '';
    data['link'] = link ?? '';
    data['title'] = title ?? '';
    data['description'] = description ?? '';
    return data;
  }
}
