import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dtmtest/core/error/failure.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/datasource/advertising_datasource.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/data/models/advertising_model.dart';
import 'package:dtmtest/features/admin_panel/web_advertising/domain/advertising_repository.dart';

class AdvertisingRepositoryImpl implements AdvertisingRepository {
  final AdvertisingRemoteDataSource advertisingRemoteDataSource;
  AdvertisingRepositoryImpl({required this.advertisingRemoteDataSource});

  @override
  Future<Either<Failure, String>> addNewAdvertising(
      AdvertisingModel advertisingModel) async {
    try {
      final result =
          await advertisingRemoteDataSource.addNewAdvertising(advertisingModel);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get themes Error'));
    }
  }

  @override
  Future<Either<Failure, List<AdvertisingModel>>> getAllAdvertising() async {
    try {
      final result = await advertisingRemoteDataSource.getAdvertising();
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('get themes Error'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadImage(
      Uint8List byte, String name) async {
    try {
      final result = await advertisingRemoteDataSource.postImage(byte, name);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('add history Error'));
    }
  }

  @override
  Future<Either<Failure, String>> updateImage(
      Uint8List byte, String name, String publicId) async {
    try {
      final result =
          await advertisingRemoteDataSource.updateImage(byte, name, publicId);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, String>> editAdvertising(
      AdvertisingModel advertisingModel) async {
    try {
      final result =
          await advertisingRemoteDataSource.editAdvertising(advertisingModel);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAdvertising(String id) async {
    try {
      final result = await advertisingRemoteDataSource.deteteAdvertising(id);
      return Right(result);
    } catch (e) {
      return const Left(ServerFailure('Error'));
    }
  }
}
