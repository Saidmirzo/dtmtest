import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  String? email;
  @HiveField(1)
  String? userImage;
  @HiveField(2)
  String? uid;
  @HiveField(3)
  String? fullName;
  @HiveField(4)
  String? phoneNumber;
  @HiveField(5)
  String? plan;
  @HiveField(6)
  int? rating;

  UserModel(
      {this.email, this.userImage, this.uid, this.fullName, this.phoneNumber});

  UserModel copyWith(
      {String? fullName,
      String? email,
      String? userImage,
      String? phoneNumber}) {
    return UserModel(
      email: email ?? this.email,
      userImage: userImage ?? this.userImage,
      uid: uid,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    userImage = json['user_image'];
    uid = json['uid'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    plan = json['plan'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['user_image'] = userImage;
    data['uid'] = uid;
    data['full_name'] = fullName;
    data['phone_number'] = phoneNumber;
    data['plan'] = plan ?? 'Free';
    data['rating'] = rating ?? 0;
    return data;
  }
}
