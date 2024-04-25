// import 'dart:developer';

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:socialmedia/common/models/shared_model.dart';
// import 'package:socialmedia/core/error/exeption.dart';
// import 'package:socialmedia/core/error/failure.dart';
// import 'package:socialmedia/core/platform/network_info.dart';
// import 'package:socialmedia/features/login/data/data_sources/login_remote_data_source.dart';
// import 'package:socialmedia/features/login/domain/repositories/login_repository.dart';

// class LoginRepositoryImpl extends LoginRepository {
//   final LoginRemoteDataSourceImpl remoteDataSourceImpl;
//   final NetworkInfo networkInfo;

//   LoginRepositoryImpl({
//     required this.remoteDataSourceImpl,
//     required this.networkInfo,
//   });

//   @override
//   Future<Either<Failure, String>> sendUser(String? login) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final result = await remoteDataSourceImpl.sendUser(login);

//         return Right(result);
//       } on DioException catch (e) {
//         final failure = DioExceptions.fromDioError(e);
//         return Left(failure);
//       }
//     } else {
//       return const Left(ConnectionFailure("Connection error"));
//     }
//   }

//   @override
//   Future<Either<Failure, String>> verifyCode(
//       String? phone, String? code) async {
//     if (await networkInfo.isConnected) {
//       try {
//         final result = await remoteDataSourceImpl.verifyCode(phone, code);
//         return Right(result);
//       } on DioException catch (e) {
//         final failure = DioExceptions.fromDioError(e);
//         return Left(failure);
//       }
//     } else {
//       return const Left(ConnectionFailure("Connection error"));
//     }
//   }

//   @override
//   Future<Either<Failure, String>> register(String? phone, String? name,
//       String? userName, String? password, String? photo, String? cover, String? description ) async {
//     var prefs = await SharedPreferences.getInstance();

//     if (await networkInfo.isConnected) {
//       try {
//         final result = await remoteDataSourceImpl.register(
//             phone, name, userName, password, photo, cover, description);
//         prefs.setString(SharedModel.token, result);

//         return Right(result);
//       } on DioException catch (e) {
//         final failure = DioExceptions.fromDioError(e);
//         return Left(failure);
//       }
//     } else {
//       return const Left(ConnectionFailure("Connection error"));
//     }
//   }

//   @override
//   Future<Either<Failure, String>> login(String? phone, String? password) async {
//     var prefs = await SharedPreferences.getInstance();
//     if (await networkInfo.isConnected) {
//       try {
//         final result = await remoteDataSourceImpl.login(phone, password);
//         prefs.setString(SharedModel.token, result);
//         log(prefs.getString(SharedModel.token) ?? '');
//         return Right(result);
//       } on DioException catch (e) {
//         final failure = DioExceptions.fromDioError(e);
//         return Left(failure);
//       }
//     } else {
//       return const Left(ConnectionFailure("Connection error"));
//     }
//   }
// }
