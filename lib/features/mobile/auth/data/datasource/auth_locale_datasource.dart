import 'package:dtmtest/common/constatnts/hive_keys.dart';
import 'package:dtmtest/features/mobile/auth/data/model/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class AuthLocaleDataSource {
  Future saveLocaleUserDtat(UserModel userModel);
  Future<UserModel?> getLocaleUserDtat();
  Future<bool> logOut();
}

class AuthLocaleDataSourceImpl implements AuthLocaleDataSource {
  final String boxName = HiveKeys.boxName;

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
}
