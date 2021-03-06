import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _preferences;
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static const _keyEmail = "email";

  static Future setEmail(String email) async {
    await _preferences.setString(_keyEmail, email);
  }

  static getEmail() => _preferences.getString(_keyEmail);
}
