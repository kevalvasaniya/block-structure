import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  static SharedPreferences? prefs;

  static const String keyUserLogin = "USER_LOGIN";
  static const String keyUserId = "USER_ID";
  static const String keyUserName = "USER_NAME";
  static const String keyUserEmail = "USER_EMAIL";
  static const String keyUserPhotoURL = "USER_PHOTO_URL";

  /// set int method
  static Future prefSetInt(String key, int value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setInt(key, value);
  }

  /// get int method
  static Future<int?> prefGetInt(String key, int intDef) async {
    prefs = await SharedPreferences.getInstance();

    if (prefs!.getInt(key) != null) {
      return prefs!.getInt(key);
    } else {
      return intDef;
    }
  }

  /// set bool method
  static Future prefSetBool(String key, bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(key, value);
  }

  /// get bool method
  static Future<bool?> prefGetBool(String key, bool boolDef) async {
    prefs = await SharedPreferences.getInstance();
    if (prefs!.getBool(key) != null) {
      return prefs!.getBool(key);
    } else {
      return boolDef;
    }
  }


  /// set string method
  static Future prefSetString(String key, String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(key, value);
  }

  /// get string method
  static Future<String?> prefGetString(String key, String strDef) async {
    prefs = await SharedPreferences.getInstance();
    if (prefs!.getString(key) != null) {
      return prefs!.getString(key);
    } else {
      return strDef;
    }
  }

  /// set double method
  static Future prefSetDouble(String key, double value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setDouble(key, value);
  }

  /// get double method
  static Future<double?> prefGetDouble(String key, double douDef) async {
    prefs = await SharedPreferences.getInstance();
    if (prefs!.getDouble(key) != null) {
      return prefs!.getDouble(key);
    } else {
      return douDef;
    }
  }

  /// clear all preference method
  static Future clearAllPref() async {
    prefs = await SharedPreferences.getInstance();
    prefs!.clear();
  }
  /// clear key of value method
  static Future clearPref(String key) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.remove(key);
  }
}
