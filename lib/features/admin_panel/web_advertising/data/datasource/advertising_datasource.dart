import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/models/advertising_model.dart';
import 'package:http_parser/http_parser.dart';

abstract class AdvertisingRemoteDataSource {
  Future<String> updateImage(Uint8List byte, String name, String publicId);

  Future<String> addNewAdvertising(AdvertisingModel advertisingModel);
  Future<List<AdvertisingModel>> getAdvertising();

  Future<String> postImage(Uint8List byte, String name);
  Future<bool> deleteImage(String publicId);
}

class AdvertisingRemoteDataSourceImpl implements AdvertisingRemoteDataSource {
   final FirebaseFirestore firebaseFirestore;
  AdvertisingRemoteDataSourceImpl({required this.firebaseFirestore});

  final CollectionReference userCollection =
      firebaseFirestore.collection('users');
  final CollectionReference categoryCollection =
      FirebaseFirestore.instance.collection('category');
  final CollectionReference advertisingCollection =
      FirebaseFirestore.instance.collection('advertising');
  final CollectionReference planCollection =
      FirebaseFirestore.instance.collection('plans');
  final CollectionReference adminsCollection =
      FirebaseFirestore.instance.collection('admins');

  @override
  Future<String> addNewAdvertising(AdvertisingModel advertisingModel) async {
    await advertisingCollection.add(advertisingModel.toJson());
    return "Success";
  }

  @override
  Future<List<AdvertisingModel>> getAdvertising() async {
    final List<AdvertisingModel> listAdvertising;
    final result = await advertisingCollection.get();
    listAdvertising = result.docs
        .map((e) => AdvertisingModel.fromJson(jsonDecode(jsonEncode(e.data()))))
        .toList();
    return listAdvertising;
  }

  @override
  Future<String> updateImage(
      Uint8List byte, String name, String publicId) async {
    //extractImageId(String url)  shu bor public id olishga
    bool isDeleted = await deleteImage(publicId);
    if (!isDeleted) {
      throw Exception("Failed to delete old image");
    }

    return await postImage(byte, name);
  }

  @override
  Future<String> postImage(Uint8List byte, String name) async {
    var dio = Dio();
    var multiPartFile = MultipartFile.fromBytes(
      byte,
      filename: name,
      contentType: MediaType('image', 'jpeg'),
    );
    var formData = FormData.fromMap(
      {
        'file': multiPartFile,
        'upload_preset': 'kxjpuwhs',
      },
    );

    var response = await dio.post(
      'https://api.cloudinary.com/v1_1/df7fvomdn/upload',
      data: formData,
    );
    return response.data["secure_url"];
  }

  @override
  Future<bool> deleteImage(String publicId) async {
    var dio = Dio();
    try {
      var response = await dio.delete(
        'https://api.cloudinary.com/v1_1/df7fvomdn/image/destroy',
        data: {'public_id': publicId},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
        ),
      );
      return response.data['result'] == 'ok';
    } catch (e) {
      print("Error deleting image: $e");
      return false;
    }
  }
}
