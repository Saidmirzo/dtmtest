import 'package:cloud_firestore/cloud_firestore.dart';

class ApiService {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection('category');
  final CollectionReference _advertisingCollection =
      FirebaseFirestore.instance.collection('advertising');
  final CollectionReference _planCollection =
      FirebaseFirestore.instance.collection('plans');
  final CollectionReference _adminsCollection =
      FirebaseFirestore.instance.collection('admins');

  CollectionReference get userCollection => _userCollection;
  CollectionReference get categoryCollection => _categoryCollection;
  CollectionReference get advertisingCollection => _advertisingCollection;
  CollectionReference get planCollection => _planCollection;
  CollectionReference get adminsCollection => _adminsCollection;
}
