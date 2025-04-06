import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static late SharedPreferences _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Save token
  static Future<void> saveToken(String token) async {
    await _prefs.setString('token', token);
  }

  // Get token
  static Future<String?> getToken() async {
    return _prefs.getString('token');
  }

  // Clear storage
  static Future<void> clear() async {
    await _prefs.clear();
  }
}