import 'package:shared_preferences/shared_preferences.dart';

class CheckInstallation {
  static const String _isFirstTimeKey = 'is_first_time';

  // Method to check if it's the first time the app is being launched
  static Future<bool> isFirstTime() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstTimeKey) ?? true;
  }

  // Method to set that the app has been launched before
  static Future<void> setLaunched() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_isFirstTimeKey, false);
  }
}
