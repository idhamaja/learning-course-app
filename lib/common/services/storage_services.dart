import 'dart:convert';

import 'package:learning_course_app/common/entities/entities.dart';
import 'package:learning_course_app/common/values/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  late final SharedPreferences _prefs;

  Future<StorageServices> init() async {
    _prefs = await SharedPreferences.getInstance();

    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstant.STRORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstant.STORAGE_USER_TOKEN_KEY) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  //method for return the token
  String getUserToken() {
    return _prefs.getString(AppConstant.STORAGE_USER_TOKEN_KEY) ?? "";
  }

  //getUserProfileMethod
  UserItem? getUserProfile() {
    var profileOffline =
        _prefs.getString(AppConstant.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profileOffline.isNotEmpty) {
      return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return null;
  }
}
