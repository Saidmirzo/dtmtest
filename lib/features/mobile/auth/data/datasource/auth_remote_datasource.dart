import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dtmtest/features/mobile/auth/data/datasource/auth_locale_datasource.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthRemoteDataSource {
  Future<String> loginWithGoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthLocaleDataSource authLocaleDataSource;
  AuthRemoteDataSourceImpl({
    required this.authLocaleDataSource,
  });

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

    final result = await FirebaseAuth.instance.signInWithCredential(credential);
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
}
