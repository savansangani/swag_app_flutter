import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  // Keys
  static const String token = 'token';
  static const String refreshToken = 'refreshToken';
  static const String email = 'email';
  static const String stripeToken = 'strip_token';
  static const String pinCode = 'pin_code';
  static const String isDark = 'isDark';

  // For plain-text data
  Future<void> set(String key, value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    }
  }

  Future<dynamic> get(String key, {dynamic defaultValue}) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return (sharedPreferences.get(key)) ?? defaultValue;
  }

  Future<void> setToken(String newToken) async {
    return await set(token, newToken);
  }

  Future<void> setRefreshToken(String newRefreshToken) async {
    return await set(refreshToken, newRefreshToken);
  }

  Future<void> setEmail(String userEmail) async {
    return await set(email, userEmail);
  }

  Future<void> setStripeToken(String newToken) async {
    return await set(stripeToken, newToken);
  }

  Future<void> setIsDark(bool dark) async {
    return await set(isDark, dark);
  }

  Future<String?> getToken() async {
    return await get(token);
  }

  Future<String?> getRefreshToken() async {
    return await get(refreshToken);
  }

  Future<String?> getEmail() async {
    return await get(email);
  }

  Future<String?> getStripToken() async {
    return await get(stripeToken);
  }

  Future<bool> getIsDark() async {
    var dark = await get(isDark);
    return dark ?? false;
  }

  Future<void> setPinCode(String newToken) async {
    return await set(pinCode, newToken);
  }

  Future<String?> getPinCode() async {
    return await get(pinCode);
  }

  // For logging out
  Future<void> deleteAll() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<void> setDarkMode(bool darkMode) async {
    return await set("DarkMode", darkMode);
  }

  // bool getDarkMode() {
  //   if (appDataService.sharedPreferences != null) {
  //     return appDataService.sharedPreferences?.getBool("DarkMode") ?? false;
  //   } else {
  //     return false;
  //   }
  // }
}
