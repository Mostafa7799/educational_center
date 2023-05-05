import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _accessTokenKey = 'access_token';
  static const String _userName = 'name';
  static const String _isTeacher = 'isTeacher';
///Token
  static Future<void> saveAccessToken(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_accessTokenKey, accessToken);
    print('====TOKEN====$accessToken');
  }

  static Future<String?> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessTokenKey);
  }

  static Future<void> removeAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_accessTokenKey);
  }

  ///Is teacher
  ///Token
  static Future<void> saveTeacher(bool isTeacher) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isTeacher, isTeacher);
    print('====isTeacher====$isTeacher');
  }

  static Future<bool?> getTeacher() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isTeacher);
  }

  static Future<void> removeTeacher() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_isTeacher);
  }

  ///Name
  static Future<void> saveAccessName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userName, name);
    print('====name====$name');
  }

  static dynamic getAccessName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userName);
  }
}
