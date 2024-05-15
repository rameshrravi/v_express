import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;
  static SharedPreferences? _preferences;
  static String? colorName = 'colorName';
  static String? fontFamily = 'fontFamily';
  static String? fontSizeType = 'fontSizeType';
  static String? lastMsgID = 'lastMsgID';
  static String? firstMsgID = 'firstMsgID';

  static Future<SharedPreferencesHelper> getInstance() async {
    _instance ??= SharedPreferencesHelper();
    _preferences ??= await SharedPreferences.getInstance();

    return _instance!;
  }

  Future<bool> setString(String key, String value) {
    return _preferences?.setString(key, value) ?? Future.value(false);
  }

  String? getString(String key) {
    return _preferences?.getString(key);
  }

  Future<bool> setInt(String key, int value) {
    return _preferences?.setInt(key, value) ?? Future.value(false);
  }

  int? getInt(String key) {
    return _preferences?.getInt(key);
  }

  Future<bool> setBool(String key, bool value) {
    return _preferences?.setBool(key, value) ?? Future.value(false);
  }

  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  Future<bool> setDouble(String key, double value) {
    return _preferences?.setDouble(key, value) ?? Future.value(false);
  }

  double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  Future<bool> setStringList(String key, List<String> value) {
    return _preferences?.setStringList(key, value) ?? Future.value(false);
  }

  List<String>? getStringList(String key) {
    return _preferences?.getStringList(key);
  }

  Future<bool> remove(String key) {
    return _preferences?.remove(key) ?? Future.value(false);
  }

  Future<bool> clear() {
    return _preferences?.clear() ?? Future.value(false);
  }

  Future<bool> setFirstLogin(String key, bool value) {
    return _preferences?.setBool(key, value) ?? Future.value(false);
  }

  bool? getFirstLogin(String key) {
    return _preferences?.getBool(key);
  }

  Future<bool> setFcmToken(String key, String value) {
    return _preferences?.setString(key, value) ?? Future.value(false);
  }

  String? getFcmToken(String key) {
    return _preferences?.getString(key);
  }

  Future<bool> setFontType(String value) {
    return _preferences?.setString(fontSizeType!, value) ?? Future.value(false);
  }

  String? getFontType() {
    return _preferences?.getString(fontSizeType!);
  }

  Future<bool> setColor(String value) {
    return _preferences?.setString(colorName!, value) ?? Future.value(false);
  }

  String? getColor() {
    return _preferences?.getString(colorName!);
  }

  Future<bool> setFontFamily(String value) {
    return _preferences?.setString(
          fontFamily!,
          value,
        ) ??
        Future.value(false);
  }

  String? getFontFamily() {
    return _preferences?.getString(fontFamily!);
  }



  Future<bool> setLastMsgId(int value) {
    return _preferences?.setInt(
          lastMsgID!,
          value,
        ) ??
        Future.value(false);
  }

  int? getLastMsgId() {
    return _preferences?.getInt(lastMsgID!);
  }
   Future<bool> setFirstMsgId(int value) {
    return _preferences?.setInt(
          firstMsgID!,
          value,
        ) ??
        Future.value(false);
  }

  int? getFirstMsgId() {
    return _preferences?.getInt(firstMsgID!);
  }
}
