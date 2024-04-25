// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:socialmedia/common/models/shared_model.dart';

// abstract class LoginRemoteDataSource {
//   Future<dynamic> sendUser(String login);

//   Future<dynamic> login(String? phone, String? password);

//   Future<dynamic> verifyCode(String phone, String code);

//   Future<dynamic> register(String? phone, String? name, String? userName,
//       String? password, String? photo, String? cover, String? description);
// }

// class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
//   Dio dio;

//   LoginRemoteDataSourceImpl({required this.dio});

//   @override
//   Future sendUser(String? login) async {
//     var json = {
//       'phone': login,
//     };
//     final responce = await dio.request(
//       '/singup',
//       data: jsonEncode(json),
//       options: Options(
//         method: 'POST',
//         headers: {
//           'accept': 'application/json',
//         },
//       ),
//     );
//     return responce.data['message'];
//   }

//   @override
//   Future verifyCode(String? phone, String? code) async {
//     var json = {
//       'phone': phone,
//       'code': code,
//     };
//     final responce = await dio.request(
//       '/VerificationCode',
//       data: jsonEncode(json),
//       options: Options(
//         method: 'POST',
//         headers: {
//           'accept': 'application/json',
//         },
//       ),
//     );

//     return responce.data['message']; //Successfully,Bad request
//   }

//   @override
//   Future register(
//       String? phone,
//       String? name,
//       String? userName,
//       String? password,
//       String? photo,
//       String? cover,
//       String? description) async {
//     SharedPreferences? prefs;
//     prefs = await SharedPreferences.getInstance();
//     String deviceName = "";

//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       deviceName = iosInfo.utsname.machine;
//       // identifier = iosInfo.identifierForVendor ?? "";
//     } else {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceName = androidInfo.model ;
//       // identifier = androidInfo.id ?? "";
//     }
//     FormData formData = FormData.fromMap({
//       'phone': phone,
//       'name': name,
//       'username': userName,
//       'password': password,
//       'cover': cover,
//       'status': 'active',
//       'description': description,
//       'userAgent': deviceName,
//       "fcm_token": prefs.getString(SharedModel.messagingToken),
//       'photo': await MultipartFile.fromFile(photo ?? '55'),
//     });

//     final responce = await dio.request(
//       '/registration',
//       data: formData,
//       options: Options(
//         method: 'POST',
//         headers: {
//           'accept': 'application/json',
//           'Content-Type': 'multipart/form-data'
//         },
//       ),
//     );
//     if (responce.statusCode == 201) {
//       return responce.data['token'];
//     }
//   }

//   @override
//   Future login(String? phone, String? password) async {
//     SharedPreferences? prefs;
//     prefs = await SharedPreferences.getInstance();
//     log(prefs.getString(SharedModel.messagingToken) ?? '');
//     String deviceName = "";

//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       deviceName = iosInfo.utsname.machine;
//       // identifier = iosInfo.identifierForVendor ?? "";
//     } else {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceName = androidInfo.model;
//       // identifier = androidInfo.id ?? "";
//     }

//     var json = {
//       'phone': phone,
//       'password': password,
//       'userAgent': deviceName,
//       "fcm_token": prefs.getString(SharedModel.messagingToken),
//     };
//     final responce = await dio.request(
//       '/login',
//       data: jsonEncode(json),
//       options: Options(
//         method: 'POST',
//         headers: {
//           'accept': 'application/json',
//         },
//       ),
//     );

//     return responce.data['token'];
//   }
// }
