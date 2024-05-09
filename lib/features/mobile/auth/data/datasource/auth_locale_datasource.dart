import 'package:dtmtest/common/constatnts/hive_keys.dart';
import 'package:dtmtest/features/admin_panel/web_users/data/models/admin_model.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AuthLocaleDataSource {
  Future saveLocaleUserDtat(UserModel userModel);
  Future<UserModel?> getLocaleUserDtat();
  Future<bool> logOut();
  Future<bool> saveAdmin(AdminModel adminModel);
  Future<AdminModel?> getAdmin();
  Future<bool> logOutAdmin();
}

class AuthLocaleDataSourceImpl implements AuthLocaleDataSource {
  final String boxName = HiveKeys.boxName;
  final String adminBoxName = HiveKeys.adminBoxNam;
  final String adminBoxKey = HiveKeys.adminBoxKey;

  @override
  Future saveLocaleUserDtat(UserModel userModel) async {
    Box<UserModel> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box(boxName);
    } else {
      box = await Hive.openBox(boxName);
    }
    box = Hive.box(boxName);
    await box.put(HiveKeys.authKey, userModel);
  }

  @override
  Future<UserModel?> getLocaleUserDtat() async {
    Box<UserModel> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box(boxName);
    } else {
      box = await Hive.openBox(boxName);
    }
    box = Hive.box(boxName);
    return box.get(HiveKeys.authKey);
  }

  @override
  Future<bool> logOut() async {
    Box<UserModel> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box(boxName);
    } else {
      box = await Hive.openBox(boxName);
    }
    box = Hive.box(boxName);
    box.clear();

    return true;
  }

  @override
  Future<AdminModel?> getAdmin() async {
    Box<AdminModel> box;
    if (Hive.isBoxOpen(adminBoxName)) {
      box = Hive.box(adminBoxName);
    } else {
      box = await Hive.openBox(adminBoxName);
    }
    box = Hive.box(adminBoxName);
    return box.get(adminBoxKey);
  }

  @override
  Future<bool> saveAdmin(AdminModel adminModel) async {
    Box<AdminModel> box;
    if (Hive.isBoxOpen(adminBoxName)) {
      box = Hive.box(adminBoxName);
    } else {
      box = await Hive.openBox(adminBoxName);
    }
    box = Hive.box(adminBoxName);
    await box.put(adminBoxKey, adminModel);
    return true;
  }

  @override
  Future<bool> logOutAdmin() async {
    Box<AdminModel> box;
    if (Hive.isBoxOpen(adminBoxName)) {
      box = Hive.box(adminBoxName);
    } else {
      box = await Hive.openBox(adminBoxName);
    }
    box = Hive.box(adminBoxName);
    await box.clear();
    return true;
  }
}
