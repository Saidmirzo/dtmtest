import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/models/advertising_model.dart';

abstract class AdvertisingRepository {
  Future<Either<Failure, String>> deleteAdvertising(String id);
  Future<Either<Failure, String>> uploadImage(Uint8List byte, String name);
  Future<Either<Failure, String>> updateImage(
      Uint8List byte, String name, String publicId);
  Future<Either<Failure, List<AdvertisingModel>>> getAllAdvertising();
  Future<Either<Failure, String>> addNewAdvertising(
      AdvertisingModel advertisingModel);
  Future<Either<Failure, String>> editAdvertising(
      AdvertisingModel advertisingModel);
}
