import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_register_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<String> loginWithGoogle();
  Future<String> registerWithEmail(UserRegisterModel userRegisterModel);
  Future<String> loginWithEmail({
    required String email,
    required String password,
  });
  Future<UserModel> getUserFromRemote(String id);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthLocaleDataSource authLocaleDataSource;
  AuthRemoteDataSourceImpl({
    required this.authLocaleDataSource,
  });

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<String> loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final result = await firebaseAuth.signInWithCredential(credential);
    final UserModel userModel = UserModel(
      email: result.user?.email,
      fullName: result.user?.displayName,
      uid: result.user?.uid,
      phoneNumber: result.user?.phoneNumber,
      userImage: result.user?.photoURL,
    );
    authLocaleDataSource.saveLocaleUserDtat(userModel);
    final userCount = await userCollection
        .where('email', isEqualTo: result.user?.email)
        .get();

    final model = userCollection.doc(result.user?.uid);
    if (userCount.docs.isEmpty) {
      model.set(userModel.toJson());
    }

    log(result.user!.email.toString());

    return "Success";
  }

  @override
  Future<String> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final User? user = result.user;

    if (user != null) {
      final UserModel userModel = await getUserFromRemote(user.uid);
      authLocaleDataSource.saveLocaleUserDtat(userModel);
      return "Success";
    } else {
      throw Exception();
    }
  }

  @override
  Future<String> registerWithEmail(UserRegisterModel userRegisterModel) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: userRegisterModel.email, password: userRegisterModel.password);
    final User? user = result.user;
    final UserModel userModel = UserModel(
      email: result.user?.email,
      fullName: userRegisterModel.fullName,
      uid: result.user?.uid,
      phoneNumber: result.user?.phoneNumber,
      userImage: result.user?.photoURL,
    );
    if (user != null) {
      authLocaleDataSource.saveLocaleUserDtat(userModel);
      final userCount = await userCollection
          .where('email', isEqualTo: result.user?.email)
          .get();

      final model = userCollection.doc(result.user?.uid);
      if (userCount.docs.isEmpty) {
        model.set(userModel.toJson());
      }
      return "Success";
    } else {
      throw Exception();
    }
  }

  @override
  Future<UserModel> getUserFromRemote(String id) async {
    final result = await userCollection.doc(id).get();
    return UserModel.fromJson(
      jsonDecode(
        jsonEncode(
          result.data(),
        ),
      ),
    );
  }
}
